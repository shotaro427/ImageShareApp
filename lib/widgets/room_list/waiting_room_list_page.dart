
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
  Widget build(BuildContext parentContext) {
    return RefreshIndicator(
      onRefresh: parentContext.read<WaitingRoomListStateNotifier>().fetchWaitingRooms,
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
                  return Container(
                    margin: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      border: const Border(
                        bottom: const BorderSide(color: Colors.black38),
                      ),
                    ),
                    child: Builder(
                      builder: (context) {
                        return ListTile(
                          leading: const Icon(Icons.home),
                          title: Text(
                            rooms[index].name,
                            style: const TextStyle(fontSize: 20),
                          ),
                          onTap: () async {
                            final _result = await _showConfirmJoinRoomDialog(context, rooms[index], context.read<WaitingRoomListStateNotifier>());

                            if(_result != null && _result) {
                              await context.read<WaitingRoomListStateNotifier>().joinRoom(rooms[index].roomId);
                              Navigator.of(parentContext).push(MaterialPageRoute(builder: (context) => TopImagesPage(rooms[index])));
                            }
                          }
                        );
                      }
                    ),
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
  Future<bool> _showConfirmJoinRoomDialog(BuildContext parentContext, RoomInfoEntity room, WaitingRoomListStateNotifier notifier) {

    return showDialog<bool>(
      context: parentContext,
      builder: (context) {
        return AlertDialog(
          title: const Text('招待されています'),
          content: const Text(
            'この部屋に参加しますか?',
          ),
          actions: <Widget>[
            FlatButton(
              child: const Text(('キャンセル')),
              onPressed: () => Navigator.of(context).pop(false),
            ),
            FlatButton(
              child: const Text('OK'),
              onPressed: () async {
                Navigator.of(context).pop(true);
              }
            ),
          ],
        );
      }
    );
  }
}
