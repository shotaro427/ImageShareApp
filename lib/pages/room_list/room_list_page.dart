import 'package:flutter/material.dart';
import 'package:image_share_app/constants/color.dart';
import 'package:image_share_app/pages/room_list/floating_buttons.dart';
import 'package:image_share_app/pages/room_list/room_list.dart';

class RoomListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('グループ'),
      ),
      body: RoomList(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingButtons(),
      backgroundColor: backgroundColor,
    );
  }
}
