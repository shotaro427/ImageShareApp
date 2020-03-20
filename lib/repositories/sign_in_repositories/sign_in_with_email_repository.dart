
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_share_app/Entities/user_entity/user_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInWithEmailRepository {

  /// ログインする
  Future<UserEntity> loginWithEmailAndPassword(String email, String password) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;

    // ログイン
    final FirebaseUser user = (await _auth.signInWithEmailAndPassword(
        email: email, password: password)).user;

    final UserEntity _userEntity = UserEntity(
        email: user.email, uid: user.uid);

    _saveUserInfo(_userEntity);

    return _userEntity;
  }

  /// ユーザー情報を保存する関数
  Future<void> _saveUserInfo(UserEntity user) async {
    // ローカルにuidを更新
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    await _prefs.setString('uid', user.uid);
    await _prefs.setString('email', user.email);

    await Firestore.instance.collection('users').where('uid', isEqualTo: user.uid)
        .getDocuments()
        .then((docs) {
      // ユーザーが存在しなかった場合追加する
      if (docs.documents.length == 0) {
        Firestore.instance.collection('users').document('${user.uid}').setData({
          'email': user.email,
          'uid': user.uid
        });
      }
    }).catchError((e) => log(e.toString()));
  }
}