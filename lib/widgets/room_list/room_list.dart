import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_share_app/widgets/room_list/create_room_page.dart';
import 'package:image_share_app/models/room_list_bloc.dart';
import 'package:image_share_app/repositories/room_list_repository.dart';
import 'package:provider/provider.dart';


class RoomListPage extends StatelessWidget {
  final RoomListRepository _repository;

  RoomListPage(this._repository);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MultiProvider(
      providers: [
        Provider<LoadingBloc>(
          create: (_) => LoadingBloc(),
          dispose: (_, bloc) => bloc.dispose(),
        ),
        Provider<RoomListBloc>(
          create: (context) {
            var loadingBloc = Provider.of<LoadingBloc>(context, listen: false);
            return RoomListBloc(_repository, loadingBloc);
          },
          dispose: (_, bloc) => bloc.dispose(),
        )
      ],
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
          RoomListLoadingWidget()
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
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: ListTile(
                  leading: const Icon(Icons.home),
                  title: Text(
                    snapshot.data[index]["name"].toString(),
                    style: const TextStyle(fontSize: 20),),
                ),
              );
            },
            itemCount: 1,
          );
        } else {
          return Container();
        }
      },
    );
  }
}

class RoomListLoadingWidget extends StatelessWidget {
  const RoomListLoadingWidget();

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<LoadingBloc>(context);
    return StreamBuilder(
      initialData: false,
      stream: bloc.value,
      builder: (context, snapshot) {
        return (snapshot.data)
            ? const DecoratedBox(
              decoration: const BoxDecoration(
                color: const Color(0x44000000)
              ),
              child: const Center(
                child: const CircularProgressIndicator(),
              ))
            : const SizedBox.shrink();
      },
    );

  }
}