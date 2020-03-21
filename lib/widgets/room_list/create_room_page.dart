

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_share_app/models/create_room_bloc.dart';
import 'package:image_share_app/repositories/room_list_repository/joined_room_list_repository.dart';
import 'package:image_share_app/widgets/commont_widgets/common_loading_widget.dart';
import 'package:provider/provider.dart';

class CreateRoomPage extends StatelessWidget {

  final RoomListRepository _repository;

  CreateRoomPage(this._repository);

  @override
  Widget build(BuildContext context) {
    return Provider<AddRoomListBloc>(
      create: (context) => AddRoomListBloc(_repository),
      dispose: (_, bloc) => bloc.dispose(),
      child: Stack(
        children: <Widget>[
          GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
            child: Scaffold(
              appBar: AppBar(title: const Text("ルーム作成"),),
              body: _InputRoomPage()
            ),
          ),
          CommonLoadingWidget<AddRoomListBloc>(dialogTitle: "ルーム作成",)
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
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                controller: _roomNameController,
                decoration: const InputDecoration(
                    border: const UnderlineInputBorder(),
                    labelText: "ルーム名"
                ),
              ),
            ),
            const SizedBox(
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