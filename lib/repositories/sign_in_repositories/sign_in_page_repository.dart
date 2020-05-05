
import 'dart:developer';

import 'package:apple_sign_in/apple_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_share_app/Entities/user_entity/user_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInPageRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// Googleアカウントでログインする
  Future<UserEntity> loginWithGoogle() async {
    final GoogleSignIn _googleSignIn = GoogleSignIn();

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

    return UserEntity(email: _user.email, uid: _user.uid, name: _user.displayName);
  }

  /// appleでサインインする
  Future<UserEntity> loginWithApple() async {

    final AuthorizationResult _result = await AppleSignIn.performRequests([
      const AppleIdRequest(requestedScopes: [Scope.email, Scope.fullName])
    ]);

    if(_result.status == AuthorizationStatus.error) {
       throw PlatformException(
          code: 'ERROR_AUTHORIZATION_DENIED',
          message: _result.error.toString(),);
    }
    if(_result.status == AuthorizationStatus.cancelled) {
        throw PlatformException(
          code: 'ERROR_ABORTED_BY_USER',
          message: 'Sign in aborted by user',
        );
    }

    final AppleIdCredential appleIdCredential = _result.credential;

    OAuthProvider oAuthProvider = const OAuthProvider(providerId: "apple.com");
    final AuthCredential credential = oAuthProvider.getCredential(
      idToken: String.fromCharCodes(appleIdCredential.identityToken),
      accessToken: String.fromCharCodes(appleIdCredential.authorizationCode),
    );

    final FirebaseUser _user = (await _auth.signInWithCredential(credential)).user;

    if (_user == null) throw Exception('Firebase user is null');

    return UserEntity(email: _user.email, uid: _user.uid, name: _user.displayName);
  }

  /// ユーザー情報をFireStoreに保存する処理
  Future<void> saveUserInfo(UserEntity user) async {

    CollectionReference _usersCollectionRef = Firestore.instance.collection('users');

    // ローカルにuidを保存
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    await _prefs.setString('uid', user.uid);
    await _prefs.setString('email', user.email);

    // FireStoreに保存
    try {
      final _documents = (await _usersCollectionRef.where('uid', isEqualTo: user.uid).getDocuments()).documents;

      if (_documents.length == 0) {
        await _usersCollectionRef.document('${user.uid}').setData(user.toJson());
      }
    } catch(e) {
      log(e.toString());
    }
  }
}