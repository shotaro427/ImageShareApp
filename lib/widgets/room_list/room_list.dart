import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_share_app/widgets/commont_widgets/common_loading_widget.dart';
import 'package:image_share_app/widgets/room_list/create_room_page.dart';
import 'package:image_share_app/models/room_list_bloc.dart';
import 'package:image_share_app/repositories/room_list_repository.dart';
import 'package:provider/provider.dart';
import 'package:image_share_app/widgets/top_image_list/top_image_list.dart';


class RoomListPage extends StatelessWidget {
  final RoomListRepository _repository;

  RoomListPage(this._repository);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Provider<RoomListBloc>(
      create: (context) => RoomListBloc(_repository),
      dispose: (_, bloc) => bloc.dispose(),
      child: Stack(
        children: <Widget>[
          Scaffold(
            appBar: AppBar(
              title: const Text("ルーム一覧"),
              actions: <Widget>[
                IconButton(
                  icon: const Icon(Icons.add),
                  tooltip: "ルームを追加",
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return CreateRoomPage(_repository);
                    }));
                    debugPrint("ルームを追加");
                  },
                )
              ],
            ),
            body: RoomListWidget(),
          ),
          CommonLoadingWidget<RoomListBloc>(isShowDialog: false,)
        ],
      ),
    );
  }
}

class RoomListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var bloc = Provider.of<RoomListBloc>(context, listen: false);
    bloc.fetchRooms();
    return StreamBuilder<List<DocumentSnapshot>>(
      stream: bloc.roomListStream,
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
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return TopImagesPage(snapshot.data[index]);
                  })),
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