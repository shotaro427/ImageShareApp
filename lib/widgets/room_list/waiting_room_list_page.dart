
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

class _WaitingRoomListWidgetState extends State<WaitingRoomListWidget> with AutomaticKeepAliveClientMixin {

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
  Widget build(BuildContext context) {
    return StateNotifierBuilder<WaitingRoomListState>(
      stateNotifier: context.read<WaitingRoomListStateNotifier>(),
      builder: (context, state, _) {
        return state.maybeWhen(
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
                return Container(
                  margin: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                    border: const Border(
                      bottom: const BorderSide(color: Colors.black38),
                    ),
                  ),
                  child: ListTile(
                    leading: const Icon(Icons.home),
                    title: Text(
                      rooms[index].name,
                      style: const TextStyle(fontSize: 20),
                    ),
                    onTap: () => _showConfirmJoinRoomDialog(context, rooms[index]),
                  ),
                );
              },
              itemCount: rooms.length,
            );
          },
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }

  /// グループに参加するかどうかを表示する処理
  void _showConfirmJoinRoomDialog(BuildContext context, RoomInfoEntity room) {

    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Center(
                child: const Text('招待されています')
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: const Text(
                    'この部屋に参加しますか?',
                    textAlign: TextAlign.center,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FlatButton(
                      child: const Text('OK'),
                      onPressed: () async {
                        await Navigator.of(context).pop();
                        await context.read<WaitingRoomListStateNotifier>().joinRoom(room.roomId);
                        _showCompletedDialog(context, room);
                      },
                    ),
                    const SizedBox(
                      height: 20,
                      width: 1,
                      child: const DecoratedBox(
                        decoration: const BoxDecoration(
                          color: Colors.black
                        ),
                      )
                    ),
                    FlatButton(
                      child: const Text(('Cancel')),
                      onPressed: () => Navigator.of(context).pop(),
                    )
                  ],
                )
              ],
            ),
          );
        }
    );
  }

  /// グループに参加したことを表示する処理
  void _showCompletedDialog(BuildContext context, RoomInfoEntity room) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('参加しました！'),
            content: const Text('この部屋に参加しました！'),
            actions: <Widget>[
              FlatButton(
                  child: const Text('OK'),
                  onPressed: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => TopImagesPage(room)))
              ),
            ],
          );
        }
    );
  }
}
