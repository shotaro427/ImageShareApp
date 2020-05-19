import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_share_app/Entities/room_entity/room_info_entity.dart';

class AddMemberRepository {
  /// グループにメンバーを招待する関数
  /// fireStoreのサブコレクションにグループ情報を保存
  void inviteUser(String userId, RoomInfoEntity roomInfoEntity) async {
    final Query _query =
        Firestore.instance.collection("users").where("id", isEqualTo: userId);

    QuerySnapshot _querySnapshot = await _query.getDocuments();

    final DocumentSnapshot _user = _querySnapshot.documents.first;
    final DocumentReference _userRef = _user.reference;

    final DocumentReference _roomRef =
        Firestore.instance.document('rooms/${roomInfoEntity.roomId}');

    // すでに招待されていたり、メンバーだったりしないかをチェックする
    if (await _validateSameUser(_user, roomInfoEntity))
      throw Exception('This user is already invited');

    // ユーザーのwaitingRoomsに追加
    final _addRoom =
        _userRef.collection('waitingRooms').add({'room': _roomRef});

    // グループのpendingに追加
    final _addUser = _roomRef.collection('pending').add({
      'user': _userRef,
    });

    await Future.wait([_addRoom, _addUser]);
  }

  /// 既に招待されていたり、グループに入っていたりするユーザーを弾く
  Future<bool> _validateSameUser(
      DocumentSnapshot user, RoomInfoEntity roomInfoEntity) async {
    final String _targetUid = user.data['uid'];

    final QuerySnapshot _pendings = await Firestore.instance
        .document('rooms/${roomInfoEntity.roomId}')
        .collection('pending')
        .getDocuments();
    final QuerySnapshot _members = await Firestore.instance
        .document('rooms/${roomInfoEntity.roomId}')
        .collection('participants')
        .getDocuments();

    // 招待者をチェック
    for (final ele in _pendings.documents) {
      final _user = await (ele.data['user'] as DocumentReference).get();
      if (_user.data['uid'].toString() == _targetUid) {
        return true;
      }
    }

    // 参加者をチェック
    for (final ele in _members.documents) {
      final _user = await (ele.data['user'] as DocumentReference).get();
      if (_user.data['uid'].toString() == _targetUid) {
        return true;
      }
    }

    return false;
  }
}
