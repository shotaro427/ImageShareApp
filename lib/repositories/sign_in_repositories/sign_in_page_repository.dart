
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInPageRepository {

  /// Googleアカウントでログインする
  Future<FirebaseUser> loginWithGoogle() async {
    final GoogleSignIn _googleSignIn = GoogleSignIn();
    final FirebaseAuth _auth = FirebaseAuth.instance;

    try {
      // 現在のログインユーザー
      GoogleSignInAccount googleCurrentUser = _googleSignIn.currentUser;

      // SignInしていなかったら、SignInする
      if (googleCurrentUser == null) googleCurrentUser = await _googleSignIn.signInSilently();
      if (googleCurrentUser == null) googleCurrentUser = await _googleSignIn.signIn();
      if (googleCurrentUser == null) return null;

      GoogleSignInAuthentication googleAuth = await googleCurrentUser
          .authentication;
      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final FirebaseUser _user = (await _auth.signInWithCredential(credential)).user;

      return _user;
    } catch(e) {
      log(e.toString());
      return null;
    }
  }

  /// ユーザー情報をFireStoreに保存する処理
  Future<void> saveUserInfo(FirebaseUser user) async {

    CollectionReference _usersCollectionRef = Firestore.instance.collection('users');

    // ローカルにuidを保存
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    await _prefs.setString('uid', user.uid);
    await _prefs.setString('email', user.email);

    // FireStoreに保存
    try {
      final _documents = (await _usersCollectionRef.where('uid', isEqualTo: user.uid).getDocuments()).documents;

      if (_documents.length == 0) {
        await _usersCollectionRef.document('${user.uid}').setData({
          'email': user.email,
          'uid': user.uid
        });
      }
    } catch(e) {
      log(e.toString());
    }
  }
}