import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_share_app/constants/color.dart';
import 'package:image_share_app/model/controllers/room_list_controller/room_list_controller.dart';
import 'package:image_share_app/pages/room_list/floating_buttons.dart';
import 'package:image_share_app/pages/room_list/room_list.dart';
import 'package:image_share_app/widget/atoms/loading_view.dart';

class RoomListPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final isLoading = watch(roomListController.state).isLoading;
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: const Text('グループ'),
          ),
          body: RoomList(),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          floatingActionButton: FloatingButtons(),
          backgroundColor: backgroundColor,
        ),
        LoadingView(isLoading),
      ],
    );
  }
}
