

import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

/// ユーザーが所属しているルームの一覧を取得する
class RoomListRepository {

  final db = Firestore.instance;

  Future<List<dynamic>> fetch() async {
    debugPrint("所属しているルーム一覧を取得");

    var _user = await FirebaseAuth.instance.currentUser();
    var _authToken = _user.uid;
    List<DocumentReference> _roomRefs = [];
    var _rooms = [];

    /// ユーザーの参加しているルームIDを取得
    await db.collection("users")
        .where("userId", isEqualTo: _authToken)
        .getDocuments()
        .then((data) {
          data.documents.forEach((doc) {
            var newVal = List.from(doc.data["rooms"]);
            _roomRefs.addAll(newVal.cast<DocumentReference>());
          });
        }).catchError((e) {
          debugPrint(e.toString());
        });

    debugPrint(_roomRefs.toString());

    return _rooms;
  }
 }