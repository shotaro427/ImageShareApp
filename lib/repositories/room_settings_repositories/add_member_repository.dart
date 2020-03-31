
import 'package:cloud_firestore/cloud_firestore.dart';

class AddMemberRepository {

  /// グループにメンバーを招待する関数
  /// firestoreのサブコレクションにグループ情報を保存
  void inviteUser(String email, DocumentReference roomRef) async {

    final Query _query = Firestore.instance
        .collection("users")
        .where("email", isEqualTo: email);

    QuerySnapshot _querySnapshot = await _query.getDocuments();

    final _userRef = _querySnapshot.documents.first.reference;

    await _userRef.collection('waitingRooms').add({
      'room': roomRef
    });
  }
}
