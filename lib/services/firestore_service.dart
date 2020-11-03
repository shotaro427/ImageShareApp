import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_share_app/model/controllers/create_post_controller/create_post_state.dart';
import 'package:image_share_app/model/entities/image.entity.dart';
import 'package:image_share_app/model/entities/pdf.entity.dart';
import 'package:image_share_app/model/entities/post.entity.dart';
import 'package:image_share_app/model/entities/room.entity.dart';
import 'package:image_share_app/model/entities/user.entity.dart';
import 'dart:math' as math;

import 'package:uuid/uuid.dart';

enum RoomType {
  joinedRooms,
  invitedRooms,
}

class FirestoreService {
  final store = Firestore.instance;
  final storage = FirebaseStorage.instance;

  // ユーザー情報をFireStoreに保存する処理
  Future<UserState> saveUserInfo(UserState user) async {
    CollectionReference _publicRef = store.collection('public/users/users');

    // 同じユーザーが存在するか確認
    final _documents =
        (await _publicRef.where('uid', isEqualTo: user.uid).getDocuments())
            .documents;

    // Firestorに保存
    if (_documents.length == 0) {
      // 新規作成
      return (await _createUser(user));
    } else if (_documents.first['id'] == null) {
      // IDを追加
      final UserState _user = _addRamdonId(user);
      // もしIDを持っていなかったらupdate
      await _publicRef.document('${_user.uid}').updateData({
        'id': _user.id,
        'updatedAt': DateTime.now().millisecondsSinceEpoch,
      });

      return _user;
    } else {
      return (await _updateUser(user));
    }
  }

  Future<UserState> getUser(String uid) async {
    final pubDocuments = (await store
            .collection('public/users/users')
            .where('uid', isEqualTo: uid)
            .getDocuments())
        .documents;

    final priDocuments = (await store
            .collection('private/users/users')
            .where('uid', isEqualTo: uid)
            .getDocuments())
        .documents;

    if (pubDocuments.length < 1 || priDocuments.length < 1) return null;

    Map<String, dynamic> data = {};
    data.addAll(pubDocuments[0].data);
    data.addAll(priDocuments[0].data);

    return UserState.fromJson(data);
  }

  Future<RoomState> saveRoomInfo(RoomState room, {String uid}) async {
    CollectionReference _publicRef = store.collection('public/rooms/rooms');

    // 同じグループがあるかどうか確認
    final _documents =
        (await _publicRef.where('id', isEqualTo: room.id).getDocuments())
            .documents;

    // Firestoreに保存
    if (_documents.length == 0 && uid != null && uid.isNotEmpty) {
      // 新規保存
      return (await _createRoom(room, uid));
    } else {
      // 更新
      return (await _updateRoom(room));
    }
  }

  // グループ一覧を取得する
  Future<List<RoomState>> getRooms(
    String uid, {
    int page = 1,
    RoomType type = RoomType.joinedRooms,
  }) async {
    // ユーザーの参加グループのIDを取得
    final userData =
        (await store.document('private/users/users/${uid}').get()).data;
    final List<String> roomIds = userData[describeEnum(type)].cast<String>();
    final lastCount = roomIds.length < (((page - 1) * 10) + 11)
        ? roomIds.length
        : (((page - 1) * 10) + 11);
    final slicedIds = roomIds.sublist((page - 1) * 10, lastCount);

    return (await _getRoomsByIdList(slicedIds));
  }

  // 投稿一覧を取得する
  Future<List<PostState>> getPosts(String roomId) async {
    final roomsByRoomId = (await store
            .collection('memberOnly/rooms/rooms')
            .where('id', isEqualTo: roomId)
            .getDocuments())
        .documents;

    if (roomsByRoomId.length < 0) return [];

    final posts = (await roomsByRoomId[0]
            .reference
            .collection('posts')
            .orderBy('createdAt', descending: true)
            .getDocuments())
        .documents
        .map((e) => PostState.fromJson(e.data))
        .toList();

    return posts;
  }

  // 投稿を作成する
  Future<void> createPost(
      CreatePostState state, String roomId, String uid) async {
    final postId = Uuid().v4().replaceAll('-', '');
    final nowTime = DateTime.now().millisecondsSinceEpoch;

    final StorageReference storageRef =
        storage.ref().child('images/${roomId}/${postId}/');

    final thumbnailFile = state.pickedFiles[0];
    final extension = thumbnailFile.path.split('/').last;

    String thumbnailUrl = null;

    if (!extension.contains('.pdf')) {
      thumbnailUrl = await _createThumbnail(thumbnailFile, storageRef);
    }

    /// 投稿情報をFirestoreにアップロード
    final docRef = await _savePostInfo(
      state,
      roomId: roomId,
      uid: uid,
      postId: postId,
      thumbnailUrl: thumbnailUrl ?? '',
      nowTime: nowTime,
    );

    // 画像やPDFの情報をStorageとFirestoreに保存する
    await _saveImagesOrPdfs(
      state,
      extension.contains('.pdf'),
      storageRef: storageRef,
      docRef: docRef,
      uid: uid,
      nowTime: nowTime,
    );
  }

  // メンバーを取得する
  Future<List<UserState>> getMember(
    List<String> ids,
  ) async {
    List<UserState> users = [];

    await Future.forEach(ids, (userId) async {
      final docsUser = (await (await store
                  .collection('public/users/users')
                  .where('uid', isEqualTo: userId))
              .getDocuments())
          .documentChanges;

      if (docsUser.length == 0) return;
      final user = UserState.fromJson(docsUser[0].document.data);
      users.add(user);
    });

    return users;
  }

  // グループのアイコンを設定する
  Future<RoomState> setGroupIcon(File icon, RoomState room) async {
    if (room.id.isEmpty) return room;

    final StorageUploadTask uploadTask =
        storage.ref().child('images/${room.id}/icon/').putFile(icon);

    final iconUrl =
        (await (await uploadTask.onComplete).ref.getDownloadURL()).toString();

    return room.copyWith(iconUrl: iconUrl);
  }

  // ユーザーのアイコンを設定する
  Future<UserState> setUserIcon(File icon, UserState user) async {
    if (user.uid.isEmpty) return user;

    final StorageUploadTask uploadTask =
        storage.ref().child('users/${user.uid}/icon/').putFile(icon);

    final iconUrl =
        (await (await uploadTask.onComplete).ref.getDownloadURL()).toString();

    return user.copyWith(iconUrl: iconUrl);
  }

  // ユーザーを招待する
  Future<RoomState> inviteUser(RoomState room, String id) async {
    if (room.id.isEmpty) throw Exception('Invalid Room Id');

    // グループのinvitedに追加
    final pubUserRef = store.collection('public/users/users');

    // IDからユーザーを検索
    final inviteUsers =
        (await pubUserRef.where('id', isEqualTo: id).getDocuments()).documents;

    if (inviteUsers.length < 1) throw Exception('Not Found User');

    final inviteUser = UserState.fromJson(inviteUsers.first.data);

    final List<String> newInvited = List.from(room.invited);
    if (!newInvited.contains(inviteUser.uid)) {
      newInvited.add(inviteUser.uid);
    }

    final List<String> newUserInvited = List.from(inviteUser.invitedRooms);
    if (!newUserInvited.contains(room.id)) {
      newUserInvited.add(room.id);
    }

    await inviteUsers.first.reference.updateData({
      'invited': newUserInvited,
    });

    return room.copyWith(invited: newInvited);
  }

  /// ========= PRIVATE =========

  /// ======= USER =======

  Future<UserState> _createUser(UserState user) async {
    // IDを追加
    final UserState _user = _addRamdonId(user);
    final time = DateTime.now().millisecondsSinceEpoch;
    final UserState newUser = _user.copyWith(createdAt: time, updateAt: time);

    await Future.wait([
      _createUserPublic(newUser),
      _createUserPrivate(newUser),
    ]);

    return newUser;
  }

  Future<UserState> _updateUser(UserState user) async {
    final time = DateTime.now().millisecondsSinceEpoch;
    final UserState newUser = user.copyWith(updateAt: time);

    await Future.wait([
      _updateUserPublic(newUser),
      _updateUserPrivate(newUser),
    ]);

    return newUser;
  }

  Future _createUserPublic(UserState user) async {
    CollectionReference _publicRef = store.collection('public/users/users');

    await _publicRef.document('${user.uid}').setData({
      'createdAt': user.createdAt,
      'updateAt': user.updateAt,
      'id': user.id,
      'iconUrl': user.iconUrl,
      'name': user.name,
      'uid': user.uid,
      'invitedRooms': user.invitedRooms,
    });
  }

  Future _createUserPrivate(UserState user) async {
    CollectionReference _privateRef = store.collection('private/users/users');

    await _privateRef.document('${user.uid}').setData({
      'createdAt': user.createdAt,
      'updateAt': user.updateAt,
      'uid': user.uid,
      'email': user.email,
      'joinedRooms': user.joinedRooms,
    });
  }

  Future _updateUserPublic(UserState user) async {
    CollectionReference _publicRef = store.collection('public/users/users');

    await _publicRef.document('${user.uid}').updateData({
      'updateAt': user.updateAt,
      'id': user.id,
      'iconUrl': user.iconUrl,
      'name': user.name,
      'uid': user.uid,
      'invitedRooms': user.invitedRooms,
    });
  }

  Future _updateUserPrivate(UserState user) async {
    CollectionReference _privateRef = store.collection('private/users/users');

    await _privateRef.document('${user.uid}').updateData({
      'updateAt': user.updateAt,
      'uid': user.uid,
      'email': user.email,
      'joinedRooms': user.joinedRooms,
    });
  }

  // ランダムなIDを追加
  UserState _addRamdonId(UserState user) {
    const _randomChars =
        "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
    const _charsLength = _randomChars.length;

    final rand = math.Random.secure();
    final codeUnits = new List.generate(
      12,
      (index) {
        final n = rand.nextInt(_charsLength);
        return _randomChars.codeUnitAt(n);
      },
    );
    final id = String.fromCharCodes(codeUnits);

    return user.copyWith(id: id);
  }

  /// ======= ROOM =======

  Future<RoomState> _createRoom(RoomState room, String userId) async {
    // uuidからIDを追加
    final id = Uuid().v4().replaceAll('-', '');
    final time = DateTime.now().millisecondsSinceEpoch;
    final newRoom = room
        .copyWith(id: id, updateAt: time, createdAt: time, member: [userId]);

    await Future.wait([
      _createRoomMemberOnly(newRoom),
      _createRoomPublic(newRoom),
    ]);

    return newRoom;
  }

  Future<RoomState> _updateRoom(RoomState room) async {
    final time = DateTime.now().millisecondsSinceEpoch;
    final newRoom = room.copyWith(updateAt: time);

    await Future.wait([
      _updateRoomMemberOnly(newRoom),
      _updateRoomPublic(newRoom),
    ]);

    return newRoom;
  }

  Future _createRoomMemberOnly(RoomState room) async {
    CollectionReference _memberOnlyRef =
        store.collection('memberOnly/rooms/rooms');

    await _memberOnlyRef.document(room.id).setData({
      'createdAt': room.createdAt,
      'updatedAt': room.updateAt,
      'tags': room.tags,
      'invited': room.invited,
      'members': room.member,
      'id': room.id,
    });
  }

  Future _createRoomPublic(RoomState room) async {
    CollectionReference _publicRef = store.collection('public/rooms/rooms');

    await _publicRef.document(room.id).setData({
      'createdAt': room.createdAt,
      'updatedAt': room.updateAt,
      'id': room.id,
      'name': room.name,
      'iconUrl': room.iconUrl,
    });
  }

  Future _updateRoomMemberOnly(RoomState room) async {
    CollectionReference _memberOnlyRef =
        store.collection('memberOnly/rooms/rooms');

    await _memberOnlyRef.document(room.id).updateData({
      'updatedAt': room.updateAt,
      'tags': room.tags,
      'invited': room.invited,
      'members': room.member,
      'id': room.id,
    });
  }

  Future _updateRoomPublic(RoomState room) async {
    CollectionReference _publicRef = store.collection('public/rooms/rooms');

    await _publicRef.document(room.id).updateData({
      'updatedAt': room.updateAt,
      'id': room.id,
      'name': room.name,
      'iconUrl': room.iconUrl,
    });
  }

  Future<List<RoomState>> _getRoomsByIdList(List<String> ids) async {
    // グループリスト
    List<RoomState> groupList = [];

    for (final id in ids) {
      final List<DocumentSnapshot> docs = (await Future.wait([
        store.document('public/rooms/rooms/${id}').get(),
        store.document('memberOnly/rooms/rooms/${id}').get(),
      ]));

      final firstData = docs.first.data;
      final lastData = docs.last.data;

      // グループリストに取得したグループ情報を格納
      if (firstData.keys.contains('name')) {
        // public document
        RoomState group = RoomState.fromJson(firstData);
        group = group.copyWith(
          invited: lastData['invited'].cast<String>(),
          member: lastData['members'].cast<String>(),
          tags: lastData['tags'].cast<String>(),
        );

        groupList.add(group);
      } else if (firstData.keys.contains('invited') &&
          firstData.keys.contains('member') &&
          firstData.keys.contains('tags')) {
        // memberOnly document
        RoomState group = RoomState.fromJson(lastData);
        group = group.copyWith(
          invited: firstData['invited'].cast<String>(),
          member: firstData['member'].cast<String>(),
          tags: firstData['tags'].cast<String>(),
        );

        groupList.add(group);
      }
    }

    return groupList;
  }

  /// ======= POST =======

  Future<String> _createThumbnail(
      File originalFile, StorageReference postRef) async {
    final ImageProperties _properties =
        await FlutterNativeImage.getImageProperties(originalFile.path);
    final File compressedFile = await FlutterNativeImage.compressImage(
        originalFile.path,
        targetHeight: 300,
        targetWidth: (_properties.width / _properties.height * 300).round());

    // サムネイルを保存
    StorageUploadTask uploadTask =
        postRef.child('thumbnail').putFile(compressedFile);

    return (await (await uploadTask.onComplete).ref.getDownloadURL())
        .toString();
  }

  List<String> _createBigramFromString(String text) {
    List<String> _bigramList = [];
    for (int i = 0; i < text.length - 1; i++) {
      _bigramList.add(text.substring(i, i + 2));
    }
    return _bigramList;
  }

  Future<DocumentReference> _savePostInfo(
    CreatePostState state, {
    @required String roomId,
    @required String uid,
    @required String postId,
    @required String thumbnailUrl,
    @required int nowTime,
  }) async {
    /// 投稿情報をFirestoreにアップロード
    final roomsByRoomId = (await store
            .collection('memberOnly/rooms/rooms')
            .where('id', isEqualTo: roomId)
            .getDocuments())
        .documents;

    if (roomsByRoomId.length < 0) {
      throw Exception('can not found room');
    }

    final bigram = _createBigramFromString(state.title + state.memo);
    final tokenMap = Map<String, bool>();
    bigram.forEach((element) {
      tokenMap['$element'] = true;
    });

    final PostState postInfo = PostState(
      createdAt: nowTime,
      updateAt: nowTime,
      id: postId,
      title: state.title,
      description: state.memo,
      tags: state.tags,
      createUserId: uid,
      thumbnailUrl: thumbnailUrl ?? '',
      bigramMap: tokenMap,
    );

    return await roomsByRoomId[0]
        .reference
        .collection('posts')
        .add(postInfo.toJson());
  }

  Future<void> _saveImagesOrPdfs(
    CreatePostState state,
    bool isPdf, {
    @required StorageReference storageRef,
    @required DocumentReference docRef,
    @required String uid,
    @required int nowTime,
  }) async {
    // 画像やPDFの情報をStorageとFirestoreに保存する
    Future.forEach(state.pickedFiles, (file) async {
      final String fileId = Uuid().v4().replaceAll('-', '');
      StorageUploadTask uploadTask = storageRef.child(fileId).putFile(file);
      final url =
          (await (await uploadTask.onComplete).ref.getDownloadURL()).toString();

      if (isPdf) {
        final PdfState pdfInfo = PdfState(
          createdAt: nowTime,
          updateAt: nowTime,
          id: fileId,
          pdfUrl: url,
          createUserId: uid,
        );
        docRef.collection('pdfs').add(pdfInfo.toJson());
      } else {
        final ImageState imageInfo = ImageState(
          createdAt: nowTime,
          updateAt: nowTime,
          id: fileId,
          imageUrl: url,
          createUserId: uid,
        );
        docRef.collection('images').add(imageInfo.toJson());
      }
    });
  }
}
