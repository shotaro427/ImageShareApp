import 'package:flutter/material.dart';
import 'package:image_share_app/pages/self_setting/self_header.dart';
import 'package:image_share_app/pages/self_setting/self_settings_list.dart';

class SelfSetting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SelfHeader(),
        SelfSettingsList(),
      ],
    );
  }
}
