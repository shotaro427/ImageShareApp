import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_share_app/model/controllers/room_list_controller/room_list_controller.dart';
import 'package:image_share_app/model/entities/room.entity.dart';
import 'package:image_share_app/pages/room_list/room_item.dart';

class RoomList extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final state = watch(roomListController.state);
    final groups = state.rooms;
    final isEmpty = groups != null && groups.length < 1;

    final onPressItem = (RoomState room) {
      context.read(roomStore).updateRoom(room);
      Navigator.of(context).pushNamed('postTop');
    };

    return state.isLoading
        ? const Center(child: CircularProgressIndicator())
        : isEmpty
            ? const Center(
                child: Text('グループに参加していません'),
              )
            : Padding(
                padding: const EdgeInsets.only(top: 5),
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) => RoomItem(
                    groups[index],
                    () => onPressItem(groups[index]),
                  ),
                  itemCount: (groups != null) ? groups.length : 0,
                ),
              );
  }
}
