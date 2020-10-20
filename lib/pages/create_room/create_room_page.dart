import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_share_app/constants/color.dart';
import 'package:image_share_app/model/controllers/create_room_controller/create_room_controller.dart';
import 'package:image_share_app/pages/create_room/form.dart';
import 'package:image_share_app/widget/atoms/loading_view.dart';

class CreateRoomPage extends ConsumerWidget {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final isLoading = watch(createRoomController.state).isLoading;
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: const Text('新しくグループを作る'),
          ),
          body: CreateRoomForm(_key),
          backgroundColor: backgroundColor,
          key: _key,
        ),
        LoadingView(isLoading),
      ],
    );
  }
}
