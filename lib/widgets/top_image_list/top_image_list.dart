
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TopImagesPage extends StatelessWidget {

  final DocumentSnapshot roomInfo;

  TopImagesPage(this.roomInfo);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: const Text("一覧"),),
      body: Center(
        child: Text(roomInfo["name"].toString()),
      ),
    );
  }
}