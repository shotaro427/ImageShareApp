
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_share_app/repositories/room_list_repository.dart';
import 'package:image_share_app/widgets/room_list/room_list.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'sign_in_page_model.freezed.dart';

@freezed
abstract class SignInState with _$SignInState {
  const factory SignInState() = _SignInState;
  const factory SignInState.loading() = Loading;
  const factory SignInState.success({@Default(false) bool isCompleted}) = Success;
  const factory SignInState.error({@Default('') String message}) = ErrorDetails;
}

class SignInStateNotifier extends StateNotifier<SignInState> {

  FirebaseUser user;

  SignInStateNotifier(): super(const SignInState());

  /// Googleアカウントでログインするときのハンドル処理
  Future<void> handleSignIn() async {

    state = const SignInState.loading();

    try {
      final GoogleSignIn _googleSignIn = GoogleSignIn();
      final FirebaseAuth _auth = FirebaseAuth.instance;

      // 現在のログインユーザー
      GoogleSignInAccount googleCurrentUser = _googleSignIn.currentUser;

      // SignInしていなかったら、SignInする
      if (googleCurrentUser == null) googleCurrentUser = await _googleSignIn.signInSilently();
      if (googleCurrentUser == null) googleCurrentUser = await _googleSignIn.signIn();
      if (googleCurrentUser == null) return null;

      GoogleSignInAuthentication googleAuth = await googleCurrentUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final FirebaseUser _user = (await _auth.signInWithCredential(credential)).user;

      // User情報を保存
      await _saveUserInfo(_user);
      user = _user;

      // 状態を更新
      state = const SignInState.success(isCompleted: true);
    } catch (e) {
      // 状態を更新
      state = SignInState.error(message: e.toString());
    }
  }

  /// ユーザー情報をFireStoreに保存する処理
  Future<void> _saveUserInfo(FirebaseUser user) async {

    CollectionReference _usersCollectionRef = Firestore.instance.collection('users');

    // ローカルにuidを保存
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    await _prefs.setString('uid', user.uid);
    await _prefs.setString('email', user.email);

    // FireStoreに保存
    await _usersCollectionRef.where('uid', isEqualTo: user.uid)
        .getDocuments()
        .then((docs) {
          debugPrint(docs.metadata.toString());
      // ユーザーが存在しなかった場合追加する
      if (docs.documents.length == 0) {
        _usersCollectionRef.document('${user.uid}').setData({
          'email': user.email,
          'uid': user.uid
        });
      }
    }).catchError((e) => debugPrint(e.toString()));
  }

  /// Googleアカウントでのログインが完了したかどうかを判断して、次のページに遷移させる処理
  void transitionNextPage(BuildContext context) {
    if (user == null) return;

    Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (BuildContext context) => RoomListPage(RoomListRepository())
        )
    );
  }
}
