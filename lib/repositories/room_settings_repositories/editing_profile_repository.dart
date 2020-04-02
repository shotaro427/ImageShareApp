

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditingProfileRepository {

  /// ローカルストレージに名前を保存する関数
  void setNickNameIntoLocalStorage(String name) async {

    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    await _prefs.setString('name', name);
  }

  /// FireStoreに名前を保存する関数
  void setNickNameIntoFireStore(String name) async {

    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    final _uid = _prefs.getString('uid');

    final QuerySnapshot _querySnapshot = await Firestore.instance.collection('users').where('uid', isEqualTo: _uid).getDocuments();

    if (_querySnapshot.documents.first.reference != null) {
      await  _querySnapshot.documents.first.reference.updateData({
        'name': name,
      });
    }
  }
}