

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddMemberPage extends StatelessWidget {

  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("メンバー招待"),),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(
              hintText: "招待したい人のメールアドレス"
            ),
          ),
        ),
      ),
    );
  }
}