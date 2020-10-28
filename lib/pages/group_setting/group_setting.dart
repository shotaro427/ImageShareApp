import 'package:flutter/material.dart';
import 'package:image_share_app/pages/group_setting/group_header.dart';
import 'package:image_share_app/pages/group_setting/member_list.dart';

class GroupSetting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GroupHeader(),
        MemberList(),
      ],
    );
  }
}
