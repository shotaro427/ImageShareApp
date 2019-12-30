import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class NextPage extends StatefulWidget {
  FirebaseUser userData;

  NextPage({Key key, this.userData}) : super(key: key);

  @override
  _NextPageState createState() => _NextPageState(userData);
}

class _NextPageState extends State<NextPage> {
  String email;

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