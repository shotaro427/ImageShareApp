
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CreateRoomRepository {

  final db = Firestore.instance;

  /// グループを作成
  Future<void> createRoom(String roomName) async {

    // roomsコレクションに新規部屋を追加
    DocumentReference _roomRef = await db.collection('rooms').add({
      'name': roomName.toString()
    });

    await db.document(_roomRef.path).updateData({
      'roomId': _roomRef.documentID,
    });

    DocumentReference _userRef = await _fetchUserRef();

    await db.document(_roomRef.path).collection("participants").add({
      "user": _userRef
    });

    await db.document(_userRef.path).collection("rooms").add({
      "room": _roomRef
    });
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
