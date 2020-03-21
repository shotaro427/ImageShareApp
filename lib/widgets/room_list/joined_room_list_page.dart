
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:image_share_app/models/room_list_model/room_list_model.dart';
import 'package:provider/provider.dart';

/// すでに参加しているルーム一覧
//class RoomListWidget extends StatefulWidget {
//
//  @override
//  State<StatefulWidget> createState() => _RoomListWidgetState();
//}
//
//class _RoomListWidgetState extends State<RoomListWidget> with AutomaticKeepAliveClientMixin {
//
//  @override
//  void initState() {
//    // TODO: implement initState
//    super.initState();
//    context.read<JoinedRoomListStateNotifier>().fetchJoinedRooms();
//  }
//
//  @override
//  // ignore: must_call_super
//  Widget build(BuildContext context) {
//    return RoomListContainerWidget();
//  }
//
//  @override
//  bool get wantKeepAlive => true;
//}

class RoomListContainerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    context.read<JoinedRoomListStateNotifier>().fetchJoinedRooms();
    return StateNotifierBuilder<JoinedRoomListState>(
      stateNotifier: context.read<JoinedRoomListStateNotifier>(),
      builder: (context, state, _) {
        return state.maybeWhen(
            () => Container(),
            success: (rooms) {
              return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                        border: const Border(
                            bottom: const BorderSide(color: Colors.black)
                        )
                    ),
                    child: ListTile(
                      leading: const Icon(Icons.home),
                      title: Text(
                        rooms[index].name,
                        style: const TextStyle(fontSize: 20),
                      ),
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const Placeholder())),
                    ),
                  );
                },
                itemCount: rooms.length,
              );
            },
            orElse: () => Container()
        );
      },
    );
  }
}
