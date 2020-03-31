
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_share_app/Entities/room_entity/room_info_entity.dart';

class AddMemberRepository {

  /// グループにメンバーを招待する関数
  /// fireStoreのサブコレクションにグループ情報を保存
  void inviteUser(String email, RoomInfoEntity roomInfoEntity) async {

    final Query _query = Firestore.instance
        .collection("users")
        .where("email", isEqualTo: email);

    QuerySnapshot _querySnapshot = await _query.getDocuments();

    final _userRef = _querySnapshot.documents.first.reference;

    final DocumentReference _roomRef = Firestore.instance.document('rooms/${roomInfoEntity.roomId}');

    await _userRef.collection('waitingRooms').add({
      'room': _roomRef
    });
  }
}
