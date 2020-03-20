
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_share_app/Entities/user_entity/user_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpWithEmailRepository {

  Future<UserEntity> signUpWithEmail(String email, String password) async {

    final FirebaseAuth _auth = FirebaseAuth.instance;

    AuthResult result = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    final FirebaseUser _user = result.user;
    final UserEntity _userEntity = UserEntity(
        email: _user.email, uid: _user.uid);

    await _saveUserInfo(_userEntity);

    return _userEntity;
  }

  Future<void> _saveUserInfo(UserEntity user) async {
    // ローカルにuidを保存
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    await _prefs.setString('uid', user.uid);
    await _prefs.setString('email', user.email);

    // FireStoreに保存
    await Firestore.instance.collection('users').document('${user.uid}').setData({
      'email': user.email,
      'uid': user.uid
    });
  }
}