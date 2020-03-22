

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:image_share_app/models/room_list_model/create_room_bloc.dart';
import 'package:image_share_app/repositories/room_list_repository/create_room_repository.dart';
import 'package:provider/provider.dart';

class CreateRoomPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StateNotifierProvider<CreateRoomStateNotifier, CreateRoomState>(
      create: (_) => CreateRoomStateNotifier(CreateRoomRepository()),
      child: Stack(
        children: <Widget>[
          GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
            child: Scaffold(
              appBar: AppBar(title: const Text("ルーム作成"),),
              body: _InputRoomPage()
            ),
          ),
        ],
      ),
    );
  }
}

class _InputRoomPage extends StatelessWidget {
  final _roomNameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller: _roomNameController,
                decoration: const InputDecoration(
                    border: const UnderlineInputBorder(),
                    labelText: "ルーム名"
                ),
                validator: (text) {
                  if (text.isEmpty) {
                    return 'グループ名を入力してください';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(
              height: 125,
            ),
            RaisedButton(
              child: const Text("部屋を作成"),
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
              onPressed: () async => await _createRoom(context, _roomNameController.text),
            )
          ],
        ),
      ),
    );
  }

  void _createRoom(BuildContext context, String roomName) async {
    if (_formKey.currentState.validate()) {
      String roomName = _roomNameController.text;
      await context.read<CreateRoomStateNotifier>().createRoom(roomName);
    }
  }
}
