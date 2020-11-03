import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_share_app/constants/color.dart';
import 'package:image_share_app/model/controllers/self_setting_controller/self_setting_controller.dart';
import 'package:image_share_app/pages/self_setting/self_setting.dart';
import 'package:image_share_app/widget/atoms/loading_view.dart';

class SelfSettingPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final isLoading = watch(selfSettingController.state).isLoading;
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: const Text('設定'),
          ),
          body: SelfSetting(),
          backgroundColor: backgroundColor,
        ),
        LoadingView(isLoading),
      ],
    );
  }
}
