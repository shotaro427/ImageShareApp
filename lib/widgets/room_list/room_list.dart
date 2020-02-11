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
          DefaultTabController(
            length: 2,
            child: Scaffold(
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
                bottom: const TabBar(
                  tabs: <Widget>[
                    Tab(text: 'ルーム',),
                    Tab(text: '招待ルーム',)
                  ],
                ),
              ),
              body: TabBarView(
                children: <Widget>[
                  _RoomListWidget(),
                  _WaitingRoomListWidget()
                ],
              ),
            ),
          ),
          CommonLoadingWidget<RoomListBloc>(isShowDialog: false,)
        ],
      ),
    );
  }
}

class _RoomListWidget extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _RoomListWidgetState();
}

class _RoomListWidgetState extends State<_RoomListWidget> with AutomaticKeepAliveClientMixin {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var bloc = Provider.of<RoomListBloc>(context, listen: false);
    bloc.fetchRooms();
  }

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    // TODO: implement build
    return _RoomListContainerWidget();
  }

  @override
  // TODO: implement wantKeepAlive
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

class _WaitingRoomListWidget extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _WaitingRoomListWidgetState();
}

class _WaitingRoomListWidgetState extends State<_WaitingRoomListWidget> with AutomaticKeepAliveClientMixin {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var bloc = Provider.of<RoomListBloc>(context, listen: false);
    bloc.fetchWaitingRooms();
  }

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    // TODO: implement build
    return _WaitingRoomListContainerWidget();
  }

  @override
  // TODO: implement wantKeepAlive
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
                  onTap: null,
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