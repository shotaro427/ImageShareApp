import 'package:flutter/material.dart';
import 'package:image_share_app/constants/color.dart';
import 'package:image_share_app/pages/member_invite/invite_form.dart';

class MemberInvitePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('新しくメンバーを招待'),
      ),
      body: InviteForm(_key),
      backgroundColor: backgroundColor,
    );
  }
}
