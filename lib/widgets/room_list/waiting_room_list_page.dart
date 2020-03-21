
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_share_app/models/room_list_model/room_list_model.dart';
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
    var bloc = Provider.of<RoomListBloc>(context, listen: false);
    bloc.fetchWaitingRooms();
  }

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    return _WaitingRoomListContainerWidget();
  }

  @override
  bool get wantKeepAlive => true;
}

class _WaitingRoomListContainerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<RoomListBloc>(context, listen: false);
    return StreamBuilder<List<DocumentSnapshot>>(
      stream: bloc.waitingRoomStream,
      builder: (context, snapshot) {
        // データを持っていたらリストを表示させる
        if(snapshot.hasData) {
          return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.black38),
                  ),
                ),
                child: ListTile(
                    leading: const Icon(Icons.home),
                    title: Text(
                      snapshot.data[index]["name"].toString(),
                      style: const TextStyle(fontSize: 20),),
                    onTap: () => _showConfirmLogoutDialog(context, snapshot.data[index])
                ),
              );
            },
            itemCount: snapshot.data.length,
          );
        } else {
          return Container();
        }
      },
    );
  }

  /// グループに参加するかどうかを表示する処理
  void _showConfirmLogoutDialog(BuildContext context, DocumentSnapshot document) {

    var bloc = Provider.of<RoomListBloc>(context, listen: false);

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
                        await bloc.joinRoom(document.reference);
                        _showCompletedDialog(context, document);
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
  void _showCompletedDialog(BuildContext context, DocumentSnapshot document) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('参加しました！'),
            content: const Text('この部屋に参加しました！'),
            actions: <Widget>[
              FlatButton(
                  child: const Text('OK'),
                  onPressed: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => TopImagesPage(document)))
              ),
            ],
          );
        }
    );
  }
}
