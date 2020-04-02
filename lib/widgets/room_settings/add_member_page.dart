
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_share_app/Entities/room_entity/room_info_entity.dart';
import 'package:provider/provider.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:image_share_app/models/room_settings/add_member_bloc.dart';
import 'package:image_share_app/repositories/room_settings_repositories/add_member_repository.dart';

class AddMemberPage extends StatelessWidget {

  final RoomInfoEntity _roomInfoEntity;

  AddMemberPage(this._roomInfoEntity);

  @override
  Widget build(BuildContext context) {
    return StateNotifierProvider<AddMemberStateNotifier, AddMemberState>(
      create: (_) => AddMemberStateNotifier(AddMemberRepository()),
      child: Stack(
        children: <Widget>[
          Scaffold(
            appBar: AppBar(title: const Text("メンバー招待"),),
            body: Center(child: _AddMemberLayout(_roomInfoEntity))
          ),
          _LoadingWidget(),
        ],
      ),
    );
  }
}

class _AddMemberLayout extends StatelessWidget {

  final TextEditingController _emailController = TextEditingController();
  final RoomInfoEntity _roomInfoEntity;

  _AddMemberLayout(this._roomInfoEntity);

  @override
  Widget build(BuildContext context) {
    return StateNotifierBuilder<AddMemberState>(
      stateNotifier: context.read<AddMemberStateNotifier>(),
      builder: (context, state, _) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                    hintText: "招待したい人のメールアドレス"
                ),
              ),
              RaisedButton(
                child: const Text("招待"),
                onPressed: () async {
                  await context.read<AddMemberStateNotifier>().inviteUser(_emailController.text, _roomInfoEntity);

                  state.maybeWhen(
                          () => null,
                      success: () {
                        Scaffold.of(context).showSnackBar(
                          const SnackBar(content: const Text('招待しました'),),
                        );
                      },
                      error: (_) => _showErrorDialog(context),
                      orElse: () => null
                  );
                },
              )
            ],
          ),
        );
      }
    );
  }

  void _showErrorDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('エラー'),
            content: const Text('招待できませんでした。\nもう一度お確かめください'),
            actions: <Widget>[
              FlatButton(
                child: const Text('OK'),
                onPressed: () => Navigator.of(context).pop(),
              )
            ],
          );
        }
    );
  }
}

class _LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return context.watch<AddMemberState>().maybeWhen(
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
