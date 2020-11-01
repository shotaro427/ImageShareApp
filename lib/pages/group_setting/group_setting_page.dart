import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_share_app/constants/color.dart';
import 'package:image_share_app/model/controllers/group_setting/group_setting_controller.dart';
import 'package:image_share_app/pages/group_setting/group_setting.dart';
import 'package:image_share_app/widget/atoms/loading_view.dart';

class GroupSettingPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final isLoading = watch(groupSettingController.state).isLoading;
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: const Text('設定'),
          ),
          body: GroupSetting(),
          backgroundColor: backgroundColor,
        ),
        LoadingView(isLoading),
      ],
    );
  }
}
