
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
    final List<DocumentSnapshot> _participants = [];

    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    final String _uid = _prefs.getString('uid') ?? "";

    Query _membersQuery = Firestore.instance
        .collection('rooms/${_roomInfoEntity.roomId}/participants');

    return [];
//
//    // 参加者の参照を取得
//    await _membersQuery.getDocuments().then((data) {
//      if (data.documents.length > 0) {
//        _refs.addAll(data.documents.map((e) => e.data['user']));
//      }
//    });
//
//    for (final ref in _refs) {
//      await ref.get().then((data) {
//        // 自分以外のメンバーを追加
//        if (data.data['uid'].toString() == _uid) {
//          _myProfileController.sink.add(data);
//        } else {
//          _participants.add(data);
//        }
//      }).catchError((e) {
//        debugPrint(e.toString());
//      });
//    }
//    return _participants;
  }

}