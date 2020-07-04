import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddTagPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('タグ追加'),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(
                border: const UnderlineInputBorder(),
                labelText: 'タグ',
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            FlatButton(
              child: const Text('追加'),
              onPressed: () {},
              color: Colors.white,
              shape: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              highlightColor: Colors.blue,
            )
          ],
        ),
      ),
    );
  }
}
