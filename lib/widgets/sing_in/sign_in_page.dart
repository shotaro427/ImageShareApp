import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_share_app/repositories/room_list_repository.dart';
import 'package:image_share_app/widgets/sing_in/sign_in_with_input.dart';
import 'package:image_share_app/widgets/sing_in/sign_up_with_input.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'sign_in_with_input.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_share_app/widgets/room_list/room_list.dart';

/// ログイン画面
/// - Googleアカウント
/// - メールアドレスとパスワード
/// でログイン/登録が可能
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  /// AppBarのタイトル
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: SizedBox(
          width: 250,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                RaisedButton(
                  child: const Text('Googleアカウントでログイン'),
                  onPressed: () {
                    _handleSignIn()
                        .then((FirebaseUser user) =>
                        transitionNextPage(user)
                    )
                        .catchError((e) => print(e));
                  },
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  highlightElevation: 16.0,
                  highlightColor: Colors.blue,
                  onHighlightChanged: (value) {},
                ),
                RaisedButton(
                  child: const Text('メールアドレスでログイン'),
                  onPressed: () {
                    transitionSignInPage();
                  },
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  highlightElevation: 16.0,
                  highlightColor: Colors.blue,
                  onHighlightChanged: (value) {},
                ),
                RaisedButton(
                  child: const Text('メールアドレスで登録'),
                  onPressed: () {
                    transitionSignUpPage();
                  },
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
    );
  }

  /// Googleアカウントでログインするときのハンドル処理
  Future<FirebaseUser> _handleSignIn() async {
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
      print("signed in " + user.displayName);

      // ローカルにuidを保存
      final SharedPreferences _prefs = await SharedPreferences.getInstance();
      await _prefs.setString('uid', user.uid);
      await _prefs.setString('email', user.email);
      
      await Firestore.instance.collection('users').where('userId', isEqualTo: user.uid)
          .getDocuments()
          .then((docs) {
            // ユーザーが存在しなかった場合追加する
            if (docs.documents.length == 0) {
              Firestore.instance.collection('users').add({
                'email': user.email,
                'userId': user.uid
              });
            }
          }).catchError((e) => debugPrint(e.toString()));

      return user;
    } catch (e) {
      print(e);
      return null;
    }
  }

  /// Googleアカウントでのログインが完了したかどうかを判断して、次のページに遷移させる処理
  void transitionNextPage(FirebaseUser user) {
    if (user == null) return;

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (BuildContext context) => RoomListPage(RoomListRepository())
      )
    );
  }

  /// 「メールアドレスでログイン」を押下したときの遷移処理
  void transitionSignInPage() {
    Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) => SignInWithInput(),
          fullscreenDialog: true
        )
    );
  }

  /// 「メールアドレスで登録」を押下したときの遷移処理
  void transitionSignUpPage() {
    Navigator.of(context).push(
        MaterialPageRoute(
            builder: (BuildContext context) => SignUpWithInput(),
            fullscreenDialog: true
        )
    );
  }
}