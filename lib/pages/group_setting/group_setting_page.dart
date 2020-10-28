import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_share_app/pages/group_setting/group_setting.dart';

class GroupSettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: const Text('設定'),
          ),
          body: GroupSetting(),
        ),
      ],
    );
  }
}
