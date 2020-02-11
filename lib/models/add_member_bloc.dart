

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class AddMemberBloc {

  inviteUser(String email, DocumentReference roomRef) async {
    
    final Query _query = Firestore.instance
        .collection("users")
        .where("email", isEqualTo: email);

    DocumentReference _userRef;

    await _query.getDocuments().then((docs) {
        _userRef = docs.documents.first.reference;
    }).catchError((e) => debugPrint(e.toString()));
    
    await _userRef.collection('waitingRooms').add({
      'room': roomRef
    });
  }
}