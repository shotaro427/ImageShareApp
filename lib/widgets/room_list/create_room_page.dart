

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_share_app/models/create_room_bloc.dart';
import 'package:provider/provider.dart';

class CreateRoomPage extends StatelessWidget {

  final _repository;

  CreateRoomPage(this._repository);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<LoadingBloc>(
          create: (_) => LoadingBloc(),
          dispose: (_, bloc) => bloc.dispose(),
        ),
        Provider<AddRoomListBloc>(
          create: (context) {
            var bloc = Provider.of<LoadingBloc>(context, listen: false);
            return AddRoomListBloc(_repository, bloc);
          },
          dispose: (_, bloc) => bloc.dispose(),
        ),
      ],
      child: Stack(
        children: <Widget>[
          Scaffold(
            appBar: AppBar(title: Text("ルーム作成"),),
            body: _InputRoomPage()
          ),
          _LoadingWidgetInCreateRoomPage()
        ],
      ),
    );
  }
}

class _InputRoomPage extends StatelessWidget {
  final _roomNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                controller: _roomNameController,
                decoration: const InputDecoration(
                    border: const UnderlineInputBorder(),
                    labelText: "ルーム名"
                ),
              ),
            ),
            SizedBox(
              height: 150,
            ),
            RaisedButton(
              child: const Text("部屋を作成"),
              onPressed: () {
                String roomName = _roomNameController.text;
                var bloc = Provider.of<AddRoomListBloc>(context, listen: false);
                bloc.pressed(roomName.toString());
              },
            )
          ],
        ),
      ),
    );
  }
}

class _LoadingWidgetInCreateRoomPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<LoadingBloc>(context);
    return StreamBuilder(
      stream: bloc.value,
      initialData: false,
      builder: (context, snapshot) {
        switch(snapshot.data) {
          case LoadingType.NOT_YET:{
            return const SizedBox.shrink();
          }
          case LoadingType.LOADING: {
            return const DecoratedBox(
              decoration: const BoxDecoration(
                  color: const Color(0x44000000)
              ),
              child: const Center(
                child: const CircularProgressIndicator(),
              )
            );
          }
          case LoadingType.COMPLETED: {
            return SimpleDialog(
              title: Text("完了しました"),
            );
          }
          default: {
            return Container();
          }
        }
//        return (snapshot.data)
//            ? const DecoratedBox(
//            decoration: const BoxDecoration(
//                color: const Color(0x44000000)
//            ),
//            child: const Center(
//              child: const CircularProgressIndicator(),
//            ))
//            : const SizedBox.shrink();
      },
    );
  }
}