
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditingProfilePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        appBar: AppBar(title: const Text('編集'),),
        body: _EditingProfileWidget()
      ),
    );
  }
}

class _EditingProfileWidget extends StatelessWidget {

  final TextEditingController _nickNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextFormField(
            controller: _nickNameController,
            decoration: const InputDecoration(
              border: const UnderlineInputBorder(),
              labelText: 'ニックネーム',
            ),
            obscureText: true,
          ),
          const SizedBox(height: 30,),
          FlatButton(
            child: const Text('編集'),
            onPressed: () {

            },
            color: Colors.white,
            shape: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            highlightColor: Colors.blue,
          )
        ],
      ),
    );
  }
}