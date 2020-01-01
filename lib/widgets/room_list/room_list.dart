import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
            ),
            body: RoomListWidget(),
          )
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
      stream: bloc.value,
      builder: (context, snapshot) {
        if(snapshot.hasData) {
          return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(snapshot.data[index]["name"].toString()),
              );
            },
            itemCount: 1,
          );
        } else {
          return const Center(
            child: const CircularProgressIndicator(),
          );
        }
      },
    );
  }
}