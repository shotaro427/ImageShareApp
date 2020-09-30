import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_share_app/pages/room_list/room_item.dart';

class RoomList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) => RoomItem(),
        itemCount: 10,
      ),
    );
  }
}
