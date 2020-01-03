
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TopImagesPage extends StatelessWidget {

  final DocumentSnapshot roomInfo;

  TopImagesPage(this.roomInfo);

  final List<IconData> icons = [
    Icons.access_alarm,
    Icons.arrow_back_ios,
    Icons.account_balance_wallet,
    Icons.center_focus_weak,
    Icons.blur_on,
    Icons.dashboard,
    Icons.phone,
    Icons.tap_and_play,
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text(roomInfo["name"].toString()),),
      body: GridView.builder(
        itemCount: icons.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        ),
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
            border: Border.all(color: Colors.black45),
            ),
            child: Icon(icons[index], size: 50),
          );
        },
      )
    );
  }
}