import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_share_app/model/entities/user.entity.dart';
import 'dart:math' as math;

class FirestoreService {
  /// ユーザー情報をFireStoreに保存する処理
  Future<UserState> createNewUser(UserState user) async {
    CollectionReference _publicRef =
        Firestore.instance.collection('public/users/users');

    // IDを追加
    final UserState _user = _addRamdonId(user);

    // 同じユーザーが存在するか確認
    final _documents =
        (await _publicRef.where('uid', isEqualTo: _user.uid).getDocuments())
            .documents;

    // Firestorに保存
    if (_documents.length == 0) {
      await Future.wait([_setUserPublic(_user), _setUserPrivate(_user)]);
    } else if (_documents.first['id'] == null) {
      // もしIDを持っていなかったらupdate
      await _publicRef.document('${_user.uid}').updateData({'id': _user.id});
    }

    return _user;
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

  Future _setUserPublic(UserState user) async {
    CollectionReference _publicRef =
        Firestore.instance.collection('public/users/users');

    final time = DateTime.now().millisecondsSinceEpoch;
    final createdAt = user.createdAt ?? time;

    await _publicRef.document('${user.uid}').setData({
      'createdAt': createdAt,
      'updateAt': time,
      'id': user.id,
      'iconUrl': user.iconUrl,
      'name': user.name,
      'uid': user.uid
    });
  }

  Future _setUserPrivate(UserState user) async {
    CollectionReference _privateRef =
        Firestore.instance.collection('private/users/users');

    final time = DateTime.now().millisecondsSinceEpoch;
    final createdAt = user.createdAt ?? time;

    await _privateRef.document('${user.uid}').setData({
      'createdAt': createdAt,
      'updateAt': time,
      'uid': user.uid,
      'email': user.email,
      'joinedRooms': user.joinedRooms,
      'invitedRooms': user.invitedRooms,
    });
  }
}
