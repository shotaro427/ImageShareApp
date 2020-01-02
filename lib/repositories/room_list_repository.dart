

import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

/// ユーザーが所属しているルームの一覧を取得する
class RoomListRepository {

  final db = Firestore.instance;

  /// FireStoreからユーザーが所属しているルーム一覧を取得する
  Future<List<DocumentSnapshot>> fetch() async {
    debugPrint("所属しているルーム一覧を取得");

    DocumentReference userRef = await fetchUserRef();
    List<DocumentReference> _roomRefs = [];
    List<DocumentSnapshot> _rooms = [];

    /// ユーザーの参加しているルームの参照を取得
    await db.document(userRef.path)
        .get()
        .then((data) {
          var newVal = List.from(data["rooms"]);
          _roomRefs.addAll(newVal.cast<DocumentReference>());
        }).catchError((e) {
          debugPrint(e.toString());
        });

    /// ルームの参照のリストから、ルームのSnapShotを追加
    for (final ref in _roomRefs) {
      await ref.get().then((data) {
        _rooms.add(data);
      }).catchError((e) {
        debugPrint(e.toString());
      });
    }
    return _rooms;
  }

  Future<void> createRoom(String roomName) async {
    DocumentReference _ref;
    // roomsコレクションに新規部屋を追加
    await db.collection("rooms").add({
      "name": roomName.toString()
    }).then((data) => _ref = data )
    .catchError((e) {
      debugPrint(e.toString());
    });

    DocumentReference userRef = await fetchUserRef();

    await db.document(_ref.path).collection("participants").add({
      "user": userRef
    });

    debugPrint(_ref.path.toString());

  }

  /// ログインしているユーザーの参照を取得
  Future<DocumentReference> fetchUserRef() async {
    var _user = await FirebaseAuth.instance.currentUser();
    var _authToken = _user.uid;

    DocumentReference _userRef;

    await db.collection("users")
        .where("userId", isEqualTo: _authToken)
        .getDocuments()
        .then((data) {
          data.documents.forEach((doc) {
            _userRef = doc.reference;
          });
        }).catchError((e) {
          debugPrint(e.toString());
        });

    return _userRef;
  }
}