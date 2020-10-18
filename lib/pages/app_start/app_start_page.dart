import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_share_app/constants/color.dart';
import 'package:image_share_app/model/controllers/app_start_controller/app_start_controller.dart';
import 'package:image_share_app/pages/app_start/buttons.dart';
import 'package:image_share_app/widget/atoms/loading_view.dart';

class AppStartPage extends ConsumerWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final isLoading = watch(appStartController.state).isLoading;
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: const Text('みんスタ'),
          ),
          body: AppStartButtons(_scaffoldKey),
          backgroundColor: backgroundColor,
          key: _scaffoldKey,
        ),
        LoadingView(isLoading),
      ],
    );
  }
}
