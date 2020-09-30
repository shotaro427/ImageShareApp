import 'package:flutter/material.dart';
import 'package:image_share_app/constants/color.dart';
import 'package:image_share_app/pages/app_start/buttons.dart';

class AppStartPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('みんスタ'),
      ),
      body: AppStartButtons(_scaffoldKey),
      backgroundColor: backgroundColor,
      key: _scaffoldKey,
    );
  }
}
