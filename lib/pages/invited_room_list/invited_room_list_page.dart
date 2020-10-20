import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_share_app/constants/color.dart';
import 'package:image_share_app/model/controllers/invited_room_list_controller/invited_room_list_controler.dart';
import 'package:image_share_app/pages/invited_room_list/invited_room_list.dart';
import 'package:image_share_app/pages/room_list/floating_buttons.dart';
import 'package:image_share_app/widget/atoms/loading_view.dart';

class InvitedRoomListPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final isLoading = watch(invitedRoomListController.state).isLoading;
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: const Text('招待されているグループ'),
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
