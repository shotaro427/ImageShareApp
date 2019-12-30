import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_share_app/sing_in/sign_up_with_input.dart';
import 'sign_in_with_input.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

/// ログイン画面
/// Googleアカウントでログイン可能
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

      return user;
    } catch (e) {
      print(e);
      return null;
    }
  }

  /// Googleアカウントでのログインが完了したかどうかを判断して、次のページに遷移させる処理
  void transitionNextPage(FirebaseUser user) {
    if (user == null) return;

    Navigator.push(context, MaterialPageRoute(builder: (context) =>
        NextPage(userData: user)
    ));
  }

  /// 「メールアドレスでログイン」を押下したときの遷移処理
  void transitionSignInPage() {
    Navigator.push(context, MaterialPageRoute(builder: (context) =>
      SignInWithInput()
    ));
  }

  /// 「メールアドレスで登録」を押下したときの遷移処理
  void transitionSignUpPage() {
    Navigator.push(context, MaterialPageRoute(builder: (context) =>
        SignUpWithInput()
    ));
  }

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
                  child: Text('Googleアカウントでログイン'),
                  onPressed: () {
                    _handleSignIn()
                        .then((FirebaseUser user) =>
                        transitionNextPage(user)
                    )
                        .catchError((e) => print(e));
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  highlightElevation: 16.0,
                  highlightColor: Colors.blue,
                  onHighlightChanged: (value) {},
                ),
                RaisedButton(
                  child: Text('メールアドレスでログイン'),
                  onPressed: () {
                    transitionSignInPage();
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  highlightElevation: 16.0,
                  highlightColor: Colors.blue,
                  onHighlightChanged: (value) {},
                ),
                RaisedButton(
                  child: Text('メールアドレスで登録'),
                  onPressed: () {
                    transitionSignUpPage();
                  },
                  color: Colors.white,
                  shape: OutlineInputBorder(
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
}

class NextPage extends StatefulWidget {
  FirebaseUser userData;

  NextPage({Key key, this.userData}) : super(key: key);

  @override
  _NextPageState createState() => _NextPageState(userData);
}

class _NextPageState extends State<NextPage> {
  String email;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  _NextPageState(FirebaseUser userData) {
    this.email = userData.email;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ユーザー情報表示"),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(this.email,
                style: const TextStyle(
                  fontSize: 24,
                ),
              ),
            ]),
      ),
    );
  }
}