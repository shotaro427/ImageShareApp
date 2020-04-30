
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_share_app/Entities/room_entity/room_info_entity.dart';

class WaitingRoomListRepository {

  final db = Firestore.instance;

  /// 招待を受けているルーム一覧を表示する
  Future<List<RoomInfoEntity>> fetchWaitingRooms() async {

    DocumentReference _userRef = await _fetchUserRef();
    List<DocumentReference> _roomRefs = [];
    List<RoomInfoEntity> _rooms = [];

    /// ユーザーが招待されているルームの参照を取得
    final _snapshots = await _userRef.collection('waitingRooms').getDocuments();
    _roomRefs.addAll(_snapshots.documents.map((doc) => doc.data['room']));

    /// ルームの参照のリストから、ルームのSnapShotを追加
    for (final ref in _roomRefs) {
      final _room = await ref.get();
      _rooms.add(RoomInfoEntity.fromJson(_room.data));
    }
    return _rooms;
  }

  /// 招待を受けているグループに参加する
  Future<void> joinRoom(String roomId) async {

    final DocumentReference _userRef = await _fetchUserRef();
    final DocumentReference _roomRef = (await _fetchRoomByRoomId(roomId)).reference;

    // waitingRoomsコレクションから該当する部屋を削除
    final _snapshots = await _userRef.collection('waitingRooms')
        .where('room', isEqualTo: _roomRef)
        .getDocuments();

    if (_snapshots.documents.length > 0) {
      // 削除
      await _snapshots.documents.first.reference.delete();
    }

    // roomsコレクションに該当する部屋を追加
    await _userRef.collection('rooms').add({
      'room': _roomRef
    });

    // roomsのparticipantsコレクションにユーザーを追加
    await db.document(_roomRef.path).collection("participants").add({
      "user": _userRef
    });
  }

  /// roomIdからdocumentを取得する
  Future<DocumentSnapshot> _fetchRoomByRoomId(String roomId) async {

    final _snapshots = await db.collection('rooms')
        .where('roomId', isEqualTo: roomId)
        .getDocuments();

    if (_snapshots.documents.length > 0) {
      return _snapshots.documents.first;
    } else{
      return null;
    }
  }

  /// ログインしているユーザーの参照を取得
  Future<DocumentReference> _fetchUserRef() async {
    var _user = await FirebaseAuth.instance.currentUser();
    var _authToken = _user.uid;

    DocumentReference _userRef;

    final _snapshots = await db.collection('users')
        .where('uid', isEqualTo: _authToken)
        .getDocuments();

    if (_snapshots.documents.length > 0) {
      _userRef = _snapshots.documents.first.reference;
    }

    return _userRef;
  }
}
