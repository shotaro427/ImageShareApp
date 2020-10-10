import 'package:flutter/material.dart';
import 'package:image_share_app/constants/color.dart';
import 'package:image_share_app/pages/invited_room_list/invited_room_list.dart';
import 'package:image_share_app/pages/room_list/floating_buttons.dart';

class InvitedRoomListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('招待されているグループ'),
      ),
      body: RoomList(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingButtons(),
      backgroundColor: backgroundColor,
    );
  }
}
