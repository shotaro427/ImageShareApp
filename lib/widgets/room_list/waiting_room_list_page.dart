import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:image_share_app/Entities/room_entity/room_info_entity.dart';
import 'package:image_share_app/models/room_list_model/waiting_room_list_model.dart';
import 'package:image_share_app/widgets/top_image_list/top_image_list.dart';
import 'package:provider/provider.dart';

/// 招待されているルーム一覧
class WaitingRoomListWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _WaitingRoomListWidgetState();
}

class _WaitingRoomListWidgetState extends State<WaitingRoomListWidget>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
    context.read<WaitingRoomListStateNotifier>().fetchWaitingRooms();
  }

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    return WaitingRoomListContainerWidget();
  }

  @override
  bool get wantKeepAlive => true;
}

class WaitingRoomListContainerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext parentContext) {
    return RefreshIndicator(
      onRefresh:
          parentContext.read<WaitingRoomListStateNotifier>().fetchWaitingRooms,
      child: StateNotifierBuilder<WaitingRoomListState>(
        stateNotifier: parentContext.read<WaitingRoomListStateNotifier>(),
        builder: (context, state, _) {
          return context.read<WaitingRoomListState>().maybeWhen(
                () => const SizedBox.shrink(),
                loading: () {
                  return const DecoratedBox(
                    decoration: BoxDecoration(
                      color: Color(0x44000000),
                    ),
                    child: Center(child: const CircularProgressIndicator()),
                  );
                },
                success: (rooms) {
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        child: Card(
                          color: Theme.of(context).bannerTheme.backgroundColor,
                          elevation: 10,
                          margin: const EdgeInsets.all(5),
                          child: SizedBox(
                            height: 65,
                            child: Row(
                              children: [
                                const Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, right: 10),
                                  child: const Icon(Icons.group),
                                ),
                                Text(
                                  rooms[index].name,
                                  style: const TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                        ),
                        onTap: () => _showConfirmJoinRoomDialog(
                            context,
                            parentContext,
                            rooms[index],
                            context.read<WaitingRoomListStateNotifier>()),
                      );
                    },
                    itemCount: rooms.length,
                  );
                },
                orElse: () => const SizedBox.shrink(),
              );
        },
      ),
    );
  }

  /// グループに参加するかどうかを表示する処理
  void _showConfirmJoinRoomDialog(
      BuildContext context,
      BuildContext parentContext,
      RoomInfoEntity room,
      WaitingRoomListStateNotifier notifier) {
    AwesomeDialog(
      context: context,
      headerAnimationLoop: false,
      tittle: '招待されています',
      desc: 'このグループに参加しますか？',
      dialogType: DialogType.INFO,
      animType: AnimType.SCALE,
      btnOkText: 'OK',
      btnCancelText: 'キャンセル',
      btnCancelOnPress: () {},
      btnOkOnPress: () async {
        await context
            .read<WaitingRoomListStateNotifier>()
            .joinRoom(room.roomId);
        Navigator.of(parentContext)
            .push(MaterialPageRoute(builder: (context) => TopImagesPage(room)));
      },
    ).show();
  }
}
