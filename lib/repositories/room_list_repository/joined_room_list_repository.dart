import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_share_app/Entities/room_entity/room_info_entity.dart';

/// ユーザーが所属しているルームの一覧を取得する
class RoomListRepository {
  final db = Firestore.instance;

  /// FireStoreからユーザーが所属しているルーム一覧を取得する
  Future<List<RoomInfoEntity>> fetchJoinedRooms({RoomInfoEntity lastRoom}) async {
    DocumentReference userRef = await _fetchUserRef();
    List<DocumentReference> _roomRefs = [];
    List<RoomInfoEntity> _rooms = [];

    /// ユーザーの参加しているルームの参照を取得
    if (lastRoom == null) {
      final _snapshots = await db.document(userRef.path).collection('rooms').orderBy('room').limit(20).getDocuments();
      _roomRefs.addAll(_snapshots.documents.map((doc) => doc.data['room']));
    } else {
      final _lastRoomRef = Firestore.instance.document('rooms/${lastRoom.roomId}');
      final _snapshots = await db.document(userRef.path).collection('rooms').orderBy('room').limit(20).startAfter([_lastRoomRef]).getDocuments();
      _roomRefs.addAll(_snapshots.documents.map((doc) => doc.data['room']));
    }

    /// ルームの参照のリストから、ルームのSnapShotを追加
    for (final ref in _roomRefs) {
      final _room = await ref.get();
      _rooms.add(RoomInfoEntity.fromJson(_room.data));
    }

    return _rooms;
  }

  /// ログインしているユーザーの参照を取得
  Future<DocumentReference> _fetchUserRef() async {
    var _user = await FirebaseAuth.instance.currentUser();
    var _authToken = _user.uid;

    DocumentReference _userRef;

    final _snapshots = await db
        .collection('users')
        .where('uid', isEqualTo: _authToken)
        .getDocuments();

    if (_snapshots.documents.length > 0) {
      _userRef = _snapshots.documents.first.reference;
    }

    return _userRef;
  }
}
