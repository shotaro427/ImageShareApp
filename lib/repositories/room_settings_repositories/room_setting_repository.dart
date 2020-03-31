
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
    UserEntity _myProfile;

    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    final String _uid = _prefs.getString('uid') ?? "";

    Query _membersQuery = Firestore.instance
        .collection('rooms/${_roomInfoEntity.roomId}/participants');

    final QuerySnapshot snapshot = await _membersQuery.getDocuments();

    // 参加メンバーの参照をリストに追加
    if (snapshot.documents.length >0) {
      _refs.addAll(snapshot.documents.map((e) => e.data['user']));
    }

    _refs.forEach((ref) async {
      final DocumentSnapshot documentSnapshot = await ref.get();
      // 自分以外のメンバーを追加
      if (documentSnapshot.data['uid'].toString() != _uid) {
        _participants.add(UserEntity.fromJson(documentSnapshot.data));
      } else {
        _myProfile = UserEntity.fromJson(documentSnapshot.data);
      }
    });

    // 最初に自分のプロフィールを代入
    _participants.insert(0, _myProfile);

    return _participants;
  }
}
