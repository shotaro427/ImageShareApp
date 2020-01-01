
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_share_app/repositories/room_list_repository.dart';
import 'package:image_share_app/widgets/room_list/room_list.dart';

/// メールアドレスとパスワードを入力してログインするページ
class SignInWithInput extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SignInWithInputState();
  }
}

class SignInWithInputState extends State<SignInWithInput> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // メールアドレスとパスワードを入力する箇所のController
  final emailInputController = new TextEditingController();
  final passwordInputController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _layoutBody();
  }

  Widget _layoutBody() {
    return Scaffold(
      appBar: AppBar(title: const Text("ログイン"),),
      body: Center(
        child: Form(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const SizedBox(height: 24.0),
                TextFormField(
                  controller: emailInputController,
                  decoration: const InputDecoration(
                    border: const UnderlineInputBorder(),
                    labelText: 'Email',
                  ),
                ),
                const SizedBox(height: 24.0),
                TextFormField(
                  controller: passwordInputController,
                  decoration: const InputDecoration(
                    border: const UnderlineInputBorder(),
                    labelText: 'Password',
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 24.0),
                Center(
                  child: RaisedButton(
                    child: const Text('Login'),
                    onPressed: () {
                      var email = emailInputController.text;
                      var password = passwordInputController.text;
                      // 登録
                      return _signIn(email, password)
                        .then((FirebaseUser user) => transitionNextPage(user))
                        .catchError((e) => debugPrint(e.toString()));
                      },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// メールアドレスとパスワードを使ってサインインする
  Future<FirebaseUser> _signIn(String email, String password) async {
    final FirebaseUser user = (await _auth.signInWithEmailAndPassword(
        email: email, password: password)).user;
    debugPrint("User id is ${user.uid}");
    return user;
  }

  /// 次のページに遷移させる
  void transitionNextPage(FirebaseUser user) {
    if (user == null) return;

    Navigator.push(context, MaterialPageRoute(builder: (context) =>
        RoomListPage(RoomListRepository())
    ));
  }
}