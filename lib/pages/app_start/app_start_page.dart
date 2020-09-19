import 'package:flutter/material.dart';
import 'package:image_share_app/constants/color.dart';
import 'package:image_share_app/pages/app_start/buttons.dart';

class AppStartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('みんスタ'),
      ),
      body: AppStartButtons(),
      backgroundColor: backgroundColor,
    );
  }
}
