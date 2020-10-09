import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_share_app/model/entities/room.entity.dart';
import 'package:image_share_app/model/entities/user.entity.dart';
import 'dart:math' as math;

import 'package:uuid/uuid.dart';

class FirestoreService {
  // ユーザー情報をFireStoreに保存する処理
  Future<UserState> saveUserInfo(UserState user) async {
    CollectionReference _publicRef =
        Firestore.instance.collection('public/users/users');

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

  Future<RoomState> saveRoomInfo(RoomState room, String uid) async {
    CollectionReference _publicRef =
        Firestore.instance.collection('public/rooms/rooms');

    // 同じグループがあるかどうか確認
    final _documents =
        (await _publicRef.where('uid', isEqualTo: room.id).getDocuments())
            .documents;

    // Firestoreに保存
    if (_documents.length == 0) {
      // 新規保存
      return (await _createRoom(room, uid));
    } else {
      // 更新
      return (await _updateRoom(room));
    }
  }

  // グループ一覧を取得する
  Future<List<RoomState>> getRooms(String uid, {int page = 1}) async {
    // ユーザーの参加グループのIDを取得
    final userData =
        (await Firestore.instance.document('private/users/users/${uid}').get())
            .data;
    final List<String> roomIds = userData['joinedRooms'].cast<String>();
    final lastCount = roomIds.length < (((page - 1) * 10) + 11)
        ? roomIds.length
        : (((page - 1) * 10) + 11);
    final slicedIds = roomIds.sublist((page - 1) * 10, lastCount);

    // グループリスト
    List<RoomState> groupList = [];

    for (final id in slicedIds) {
      final List<DocumentSnapshot> docs = (await Future.wait([
        Firestore.instance.document('public/rooms/rooms/${id}').get(),
        Firestore.instance.document('memberOnly/rooms/rooms/${id}').get(),
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

  // User

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
    CollectionReference _publicRef =
        Firestore.instance.collection('public/users/users');

    await _publicRef.document('${user.uid}').setData({
      'createdAt': user.createdAt,
      'updateAt': user.updateAt,
      'id': user.id,
      'iconUrl': user.iconUrl,
      'name': user.name,
      'uid': user.uid
    });
  }

  Future _createUserPrivate(UserState user) async {
    CollectionReference _privateRef =
        Firestore.instance.collection('private/users/users');

    await _privateRef.document('${user.uid}').setData({
      'createdAt': user.createdAt,
      'updateAt': user.updateAt,
      'uid': user.uid,
      'email': user.email,
      'joinedRooms': user.joinedRooms,
      'invitedRooms': user.invitedRooms,
    });
  }

  Future _updateUserPublic(UserState user) async {
    CollectionReference _publicRef =
        Firestore.instance.collection('public/users/users');

    await _publicRef.document('${user.uid}').updateData({
      'updateAt': user.updateAt,
      'id': user.id,
      'iconUrl': user.iconUrl,
      'name': user.name,
      'uid': user.uid
    });
  }

  Future _updateUserPrivate(UserState user) async {
    CollectionReference _privateRef =
        Firestore.instance.collection('private/users/users');

    await _privateRef.document('${user.uid}').updateData({
      'updateAt': user.updateAt,
      'uid': user.uid,
      'email': user.email,
      'joinedRooms': user.joinedRooms,
      'invitedRooms': user.invitedRooms,
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

  // Room

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
        Firestore.instance.collection('memberOnly/rooms/rooms');

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
    CollectionReference _publicRef =
        Firestore.instance.collection('public/rooms/rooms');

    await _publicRef.document(room.id).setData({
      'createdAt': room.createdAt,
      'updatedAt': room.updateAt,
      'id': room.id,
      'name': room.name,
    });
  }

  Future _updateRoomMemberOnly(RoomState room) async {
    CollectionReference _memberOnlyRef =
        Firestore.instance.collection('memberOnly/rooms/rooms');

    await _memberOnlyRef.document(room.id).updateData({
      'updatedAt': room.updateAt,
      'tags': room.tags,
      'invited': room.invited,
      'members': room.member,
      'id': room.id,
    });
  }

  Future _updateRoomPublic(RoomState room) async {
    CollectionReference _publicRef =
        Firestore.instance.collection('public/rooms/rooms');

    await _publicRef.document(room.id).updateData({
      'updatedAt': room.updateAt,
      'id': room.id,
      'name': room.name,
    });
  }
}
