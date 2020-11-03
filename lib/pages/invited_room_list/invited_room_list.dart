import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_share_app/model/controllers/invited_room_list_controller/invited_room_list_controler.dart';
import 'package:image_share_app/pages/room_list/room_item.dart';
import 'package:image_share_app/widget/atoms/awesome_dialog.dart';

class RoomList extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final state = watch(invitedRoomListController.state);
    final groups = state.rooms;
    final isEmpty = groups == null || groups.length < 1;

    return isEmpty
        ? const Center(
            child: Text('招待されているグループはありません'),
          )
        : Padding(
            padding: const EdgeInsets.only(top: 5),
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                final onPressItem = () => showOkCancelDialog(
                      context,
                      '「${groups[index].name}」に参加します',
                      'このままグループに参加しますか？',
                      () => context
                          .read(invitedRoomListController)
                          .participate(groups[index]),
                    );
                return RoomItem(
                  groups[index],
                  onPressItem,
                );
              },
              itemCount: (groups != null) ? groups.length : 0,
            ),
          );
  }
}
