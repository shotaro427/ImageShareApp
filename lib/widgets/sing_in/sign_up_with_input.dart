import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_share_app/repositories/room_list_repository.dart';
import 'package:image_share_app/widgets/room_list/room_list.dart';

class SignUpWithInput extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SigUpWithInputState();
  }
}

class SigUpWithInputState extends State<SignUpWithInput> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final emailInputController = new TextEditingController();
  final passwordInputController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _layoutBody();
  }

  Widget _layoutBody() {
    return Scaffold(
      appBar: AppBar(title: Text("登録"),),
      body: Center(
        child: Form(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(height: 24.0),
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
                    child: const Text('SingUp'),
                    onPressed: () {
                      var email = emailInputController.text;
                      var password = passwordInputController.text;
                      // 登録
                      return _signUp(email, password)
                          .then((FirebaseUser user) => transitionNextPage(user))
                          .catchError((e) => print(e));
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

  Future<FirebaseUser> _signUp(String email, String password) async {
    AuthResult result = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    FirebaseUser user = result.user;
    return user;
  }

  void transitionNextPage(FirebaseUser user) {
    if (user == null) return;

    Navigator.push(context, MaterialPageRoute(builder: (context) =>
        RoomListPage(RoomListRepository())
    ));
  }
}