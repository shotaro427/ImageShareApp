

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_share_app/models/add_member_bloc.dart';

class AddMemberPage extends StatelessWidget {

  final DocumentReference _roomRef;

  AddMemberPage(this._roomRef);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("メンバー招待"),),
      body: Center(child: _AddMemberLayout(_roomRef))
    );
  }
}

class _AddMemberLayout extends StatelessWidget {

  final TextEditingController _emailController = TextEditingController();
  final DocumentReference _roomRef;
  final bloc = AddMemberBloc();

  _AddMemberLayout(this._roomRef);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(
                hintText: "招待したい人のメールアドレス"
            ),
          ),
          RaisedButton(
            child: const Text("招待"),
            onPressed: () => bloc.inviteUser(_emailController.text, _roomRef),
          )
        ],
      ),
    );
  }
}