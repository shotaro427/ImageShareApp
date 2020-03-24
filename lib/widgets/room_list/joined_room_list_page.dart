
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:image_share_app/models/room_list_model/room_list_model.dart';
import 'package:image_share_app/widgets/top_image_list/top_image_list.dart';
import 'package:provider/provider.dart';

/// すでに参加しているルーム一覧
class RoomListWidget extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _RoomListWidgetState();
}

class _RoomListWidgetState extends State<RoomListWidget> with AutomaticKeepAliveClientMixin {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<JoinedRoomListStateNotifier>().fetchJoinedRooms();
  }

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    return RoomListContainerWidget();
  }

  @override
  bool get wantKeepAlive => true;
}

class RoomListContainerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StateNotifierBuilder<JoinedRoomListState>(
      stateNotifier: context.read<JoinedRoomListStateNotifier>(),
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
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => TopImagesPage(rooms[index]))),
                    ),
                  );
                },
                itemCount: rooms.length,
              );
            },
            orElse: () => const SizedBox.shrink()
        );
      },
    );
  }
}
