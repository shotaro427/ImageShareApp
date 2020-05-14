import 'dart:math';
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
    final UserEntity _userEntity =
        UserEntity(email: _user.email, uid: _user.uid);

    await _saveUserInfo(_userEntity);

    return _userEntity;
  }

  Future<void> _saveUserInfo(UserEntity user) async {
    // ローカルにuidを保存
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    await _prefs.setString('uid', user.uid);
    await _prefs.setString('email', user.email);

    // IDを追加
    final UserEntity _user = user.copyWith(id: _randomString());

    // FireStoreに保存
    await Firestore.instance
        .collection('users')
        .document('${_user.uid}')
        .setData(_user.toJson());
  }

  String _randomString() {
    const _randomChars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
    const _charsLength = _randomChars.length;

    final rand = new Random.secure();
    final codeUnits = new List.generate(
      12,
      (index) {
        final n = rand.nextInt(_charsLength);
        return _randomChars.codeUnitAt(n);
      },
    );
    return new String.fromCharCodes(codeUnits);
  }
}
