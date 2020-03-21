
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
    super.initState();
    var bloc = Provider.of<RoomListBloc>(context, listen: false);
    bloc.fetchRooms();
  }

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    return _RoomListContainerWidget();
  }

  @override
  bool get wantKeepAlive => true;
}

class _RoomListContainerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<RoomListBloc>(context, listen: false);
    return StreamBuilder<List<DocumentSnapshot>>(
      stream: bloc.roomListStream,
      builder: (context, snapshot) {
        // データを持っていたらリストを表示させる
        if(snapshot.hasData) {
          return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.black38),
                  ),
                ),
                child: ListTile(
                  leading: const Icon(Icons.home),
                  title: Text(
                    snapshot.data[index]["name"].toString(),
                    style: const TextStyle(fontSize: 20),),
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => TopImagesPage(snapshot.data[index]))),
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
}
