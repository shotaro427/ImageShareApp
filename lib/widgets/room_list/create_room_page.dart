import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:image_share_app/models/room_list_model/create_room_bloc.dart';
import 'package:image_share_app/repositories/room_list_repository/create_room_repository.dart';
import 'package:image_share_app/widgets/top_image_list/top_image_list.dart';
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
                appBar: AppBar(
                  title: const Text("ルーム作成"),
                ),
                body: _InputRoomPage()),
          ),
          _LoadingWidget(),
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
                    border: const UnderlineInputBorder(), labelText: "ルーム名"),
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
              onPressed: () async =>
                  await _createRoom(context, _roomNameController.text),
            )
          ],
        ),
      ),
    );
  }

  void _createRoom(BuildContext context, String roomName) async {
    if (_formKey.currentState.validate()) {
      String roomName = _roomNameController.text;
      Provider.of<CreateRoomStateNotifier>(context, listen: false)
          .createRoom(roomName);

      Provider.of<CreateRoomState>(context, listen: false).maybeWhen(
        null,
        success: (entity) => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => TopImagesPage(entity))),
        error: (_) => _showErrorDialog(context),
        orElse: () => null,
      );
    }
  }

  void _showErrorDialog(BuildContext context) {
    AwesomeDialog(
      context: context,
      headerAnimationLoop: false,
      tittle: 'エラー',
      desc: 'グループを作成できませんでした。\n通信状況などを確認してから、もう一度お試しください',
      dialogType: DialogType.ERROR,
      animType: AnimType.SCALE,
      btnOkText: 'OK',
      btnOkOnPress: () {},
    ).show();
  }
}

class _LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider.of<CreateRoomState>(context).maybeWhen(
      null,
      loading: () => const DecoratedBox(
        decoration: BoxDecoration(
          color: Color(0x44000000),
        ),
        child: Center(child: const CircularProgressIndicator()),
      ),
      orElse: () => const SizedBox.shrink(),
    );
  }
}
