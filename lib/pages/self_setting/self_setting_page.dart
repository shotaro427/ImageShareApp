import 'package:flutter/material.dart';
import 'package:image_share_app/constants/color.dart';
import 'package:image_share_app/pages/self_setting/self_setting.dart';

class SelfSettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('設定'),
      ),
      body: SelfSetting(),
      backgroundColor: backgroundColor,
    );
  }
}
