import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_share_app/Entities/room_entity/room_info_entity.dart';
import 'package:image_share_app/Entities/user_entity/user_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RoomSettingsRepository {
  final RoomInfoEntity _roomInfoEntity;

  RoomSettingsRepository(this._roomInfoEntity);

  /// 所属しているメンバーを取得する
  Future<Map<String, List<UserEntity>>> fetchRoomMembers() async {
    final List<DocumentReference> _refs = [];
    final Map<String, List<UserEntity>> _participants = {
      'you': [],
      'members': [],
    };

    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    final String _uid = _prefs.getString('uid') ?? "";

    Query _membersQuery = Firestore.instance
        .collection('rooms/${_roomInfoEntity.roomId}/participants');

    final QuerySnapshot snapshot = await _membersQuery.getDocuments();

    // 参加メンバーの参照をリストに追加
    if (snapshot.documents.length > 0) {
      _refs.addAll(snapshot.documents.map((e) => e.data['user']));
    }

    // プロフィールを取得
    for (final ref in _refs) {
      DocumentSnapshot documentSnapshot = await ref.get();

      // プロフィール
      final _profile = UserEntity.fromJson(documentSnapshot.data);

      // リストに追加
      if (_profile.uid == _uid && _participants['you'].length == 0) {
        print(_profile.toJson().toString());
        // 更新
        if (_profile.id == null || _profile.id.isEmpty) {
          await _saveUserInfo(_profile);
        }
        // 自分のプロフィールを追加
        _participants['you'].add(_profile);
      } else if (_profile.uid != _uid) {
        // その他メンバーのプロフィールを追加
        _participants['members'].add(_profile);
      }
    }

    return _participants;
  }

  Future<void> _saveUserInfo(UserEntity user) async {
    // FireStoreに保存
    await Firestore.instance
        .collection('users')
        .document('${user.uid}')
        .updateData({'id': _randomString()});
  }

  String _randomString() {
    const _randomChars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
    const _charsLength = _randomChars.length;

    final rand = new Random.secure();
    final codeUnits = new List.generate(
      12,
      (index) {
        final n = rand.nextInt(_charsLength);
        return _randomChars.codeUnitAt(n);
      },
    );
    return new String.fromCharCodes(codeUnits);
  }
}
