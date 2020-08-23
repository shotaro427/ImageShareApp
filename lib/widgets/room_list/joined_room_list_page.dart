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

class _RoomListWidgetState extends State<RoomListWidget>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
    Provider.of<JoinedRoomListStateNotifier>(context, listen: false)
        .fetchJoinedRooms();
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
    return RefreshIndicator(
      onRefresh:
          Provider.of<JoinedRoomListStateNotifier>(context, listen: false)
              .refresh,
      child: StateNotifierBuilder<JoinedRoomListState>(
        stateNotifier:
            Provider.of<JoinedRoomListStateNotifier>(context, listen: false),
        builder: (context, state, _) {
          return state.maybeWhen(() => const SizedBox.shrink(),
              loading: () {
                return const DecoratedBox(
                  decoration: BoxDecoration(
                    color: Color(0x44000000),
                  ),
                  child: Center(child: const CircularProgressIndicator()),
                );
              },
              success: (rooms) {
                return Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            child: Card(
                              color:
                                  Theme.of(context).bannerTheme.backgroundColor,
                              elevation: 0,
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
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) =>
                                        TopImagesPage(rooms[index]))),
                          );
                        },
                        itemCount: rooms.length,
                      ),
                    ),
                    FlatButton(
                      child: const Text('さらに読み込む'),
                      onPressed: () => context
                          .read<JoinedRoomListStateNotifier>()
                          .fetchJoinedRooms(),
                    )
                  ],
                );
              },
              orElse: () => const SizedBox.shrink());
        },
      ),
    );
  }
}
