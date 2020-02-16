
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditingProfilePage extends StatelessWidget {

  final TextEditingController _nickNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: const Text('編集'),),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: TextFormField(
            controller: _nickNameController,
            decoration: const InputDecoration(
              border: const UnderlineInputBorder(),
              labelText: 'ニックネーム',
            ),
            obscureText: true,
          ),
        ),
      ),
    );
  }
}