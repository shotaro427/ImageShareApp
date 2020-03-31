
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_share_app/Entities/room_entity/room_info_entity.dart';
import 'package:image_share_app/Entities/user_entity/user_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RoomSettingsRepository {

  final RoomInfoEntity _roomInfoEntity;

  RoomSettingsRepository(this._roomInfoEntity);

  /// 所属しているメンバーを取得する
  Future<List<UserEntity>> fetchRoomMembers() async {

    final List<DocumentReference> _refs = [];
    final List<UserEntity> _participants = [];

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
      if (_profile.uid == _uid && _participants.length > 0) {
        // 自分のプロフィールを追加
        _participants.insert(0, _profile);
      } else {
        // その他メンバーのプロフィールを追加
        _participants.add(_profile);
      }
    }

    return _participants;
  }
}
