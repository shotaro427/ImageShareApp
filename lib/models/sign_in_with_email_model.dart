
import 'dart:js';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_share_app/repositories/room_list_repository.dart';
import 'package:image_share_app/widgets/room_list/room_list.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:state_notifier/state_notifier.dart';
part 'sign_in_with_email_model.freezed.dart';

@freezed
abstract class SignInWithEmailState with _$SignInWithEmailState {
  const factory SignInWithEmailState() = _SignInWithEmailState;
  const factory SignInWithEmailState.loading() = Loading;
  const factory SignInWithEmailState.success({@Default(false) bool isCompleted}) = Success;
  const factory SignInWithEmailState.error({@Default('') String message}) = ErrorDetails;
}

class SignInWithEmailStateNotifier extends StateNotifier<SignInWithEmailState> {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  SignInWithEmailStateNotifier(): super(const SignInWithEmailState());

  /// メールアドレスとパスワードを使ってサインインする
  Future<FirebaseUser> signIn(String email, String password) async {
    final FirebaseUser user = (await _auth.signInWithEmailAndPassword(
        email: email, password: password)).user;

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
    }).catchError((e) => debugPrint(e.toString()));

    debugPrint("User id is ${user.uid}");
    return user;
  }

  /// ローカルにユーザー情報を保存する関数

  /// 次のページに遷移させる
  void transitionNextPage(FirebaseUser user, BuildContext context) {
    if (user == null) return;

    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
            builder: (BuildContext context) => RoomListPage(RoomListRepository())
        ),
        ModalRoute.withName("/home")
    );
  }
}

