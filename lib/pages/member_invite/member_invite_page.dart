import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_share_app/constants/color.dart';
import 'package:image_share_app/model/controllers/member_invite_controller/member_invite_controller.dart';
import 'package:image_share_app/pages/member_invite/invite_form.dart';
import 'package:image_share_app/widget/atoms/loading_view.dart';

class MemberInvitePage extends ConsumerWidget {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final isLoading = watch(memberInviteController.state).isLoading;
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: const Text('新しくメンバーを招待'),
          ),
          body: InviteForm(_key),
          backgroundColor: backgroundColor,
          key: _key,
        ),
        LoadingView(isLoading),
      ],
    );
  }
}
