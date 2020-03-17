import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_share_app/repositories/room_list_repository.dart';
import 'package:image_share_app/widgets/sing_in/sign_in_with_input.dart';
import 'package:image_share_app/widgets/sing_in/sign_up_with_input.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'sign_in_with_input.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_share_app/widgets/room_list/room_list.dart';

/// ログイン画面
/// - Googleアカウント
/// - メールアドレスとパスワード
/// でログイン/登録が可能
class SignInPage extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _isCheckSignIn(),
      builder: (BuildContext context, AsyncSnapshot<bool> isSignIn) {

        if (isSignIn.hasData && isSignIn.data) { // ログイン済の場合
          return RoomListPage(RoomListRepository());
        } else if (isSignIn.hasData && !isSignIn.data) { // ログインしていない場合
          return _SignInButtons();
        } else {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }

  Future<bool> _isCheckSignIn() async {
    bool isSignIn = false;

    await _auth.currentUser().then((FirebaseUser user) {
      debugPrint('${user.uid}');
      if (user != null) {
        isSignIn = true;
      } else {
        isSignIn = false;
      }
    }).catchError((e)  {
      debugPrint(e.toString());
      isSignIn = false;
    });

    return isSignIn;
  }
}


class _SignInButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<SignInPageModel>(
      create: (_) => SignInPageModel(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('ログイン'),
        ),
        body: Center(
          child: SizedBox(
            width: 250,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Consumer<SignInPageModel>(
                    builder: (context, model, child) {
                      return RaisedButton(
                        child: const Text('Googleアカウントでログイン'),
                        onPressed: () {
                          model.handleSignIn()
                              .then((FirebaseUser user) =>
                              _transitionNextPage(user, context)
                          )
                              .catchError((e) => print(e));
                        },
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        highlightElevation: 16.0,
                        highlightColor: Colors.blue,
                        onHighlightChanged: (value) {},
                      );
                    },
                  ),
                  RaisedButton(
                    child: const Text('メールアドレスでログイン'),
                    onPressed: () => _transitionSignInPage(context),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    highlightElevation: 16.0,
                    highlightColor: Colors.blue,
                    onHighlightChanged: (value) {},
                  ),
                  RaisedButton(
                    child: const Text('メールアドレスで登録'),
                    onPressed: () => _transitionSignUpPage(context),
                    color: Colors.white,
                    shape: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    highlightElevation: 16.0,
                    highlightColor: Colors.blue,
                    onHighlightChanged: (value) {},
                  ),
                ]
            ),
          ),
        ),
      ),
    );
  }

  /// Googleアカウントでのログインが完了したかどうかを判断して、次のページに遷移させる処理
  void _transitionNextPage(FirebaseUser user, BuildContext context) {
    if (user == null) return;

    Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (BuildContext context) => RoomListPage(RoomListRepository())
        )
    );
  }

  /// 「メールアドレスでログイン」を押下したときの遷移処理
  void _transitionSignInPage(BuildContext context) {
    Navigator.of(context).push(
        MaterialPageRoute(
            builder: (BuildContext context) => SignInWithInput(),
            fullscreenDialog: true
        )
    );
  }

  /// 「メールアドレスで登録」を押下したときの遷移処理
  void _transitionSignUpPage(BuildContext context) {
    Navigator.of(context).push(
        MaterialPageRoute(
            builder: (BuildContext context) => SignUpWithInput(),
            fullscreenDialog: true
        )
    );
  }
}

class SignInPageModel {

  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// Googleアカウントでログインするときのハンドル処理
  Future<FirebaseUser> handleSignIn() async {
    /// 現在のログインユーザー
    GoogleSignInAccount googleCurrentUser = _googleSignIn.currentUser;
    try {
      // SignInしていなかったら、SignInする
      if (googleCurrentUser == null) googleCurrentUser = await _googleSignIn.signInSilently();
      if (googleCurrentUser == null) googleCurrentUser = await _googleSignIn.signIn();
      if (googleCurrentUser == null) return null;

      GoogleSignInAuthentication googleAuth = await googleCurrentUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final FirebaseUser user = (await _auth.signInWithCredential(credential)).user;

      // User情報を保存
      await _saveUserInfo(user);

      return user;
    } catch (e) {
      return null;
    }
  }

  /// ユーザー情報をFireStoreに保存する処理
  Future<void> _saveUserInfo(FirebaseUser user) async {

    CollectionReference _usersCollectionRef = Firestore.instance.collection('user');

    // ローカルにuidを保存
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    await _prefs.setString('uid', user.uid);
    await _prefs.setString('email', user.email);

    // FireStoreに保存
    await _usersCollectionRef.where('uid', isEqualTo: user.uid)
        .getDocuments()
        .then((docs) {
          // ユーザーが存在しなかった場合追加する
          if (docs.documents.length == 0) {
            _usersCollectionRef.document('${user.uid}').setData({
              'email': user.email,
              'uid': user.uid
            });
          }
        }).catchError((e) => debugPrint(e.toString()));
  }
}
