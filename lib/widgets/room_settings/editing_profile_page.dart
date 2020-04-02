
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:image_share_app/models/room_settings/editing_profile_bloc.dart';
import 'package:image_share_app/repositories/room_settings_repositories/editing_profile_repository.dart';
import 'package:provider/provider.dart';

class EditingProfilePage extends StatelessWidget {

  final String name;

  EditingProfilePage(this.name);

  @override
  Widget build(BuildContext context) {
    return StateNotifierProvider<EditingProfileStateNotifier, EditingProfileState>(
      create: (_) => EditingProfileStateNotifier(EditingProfileRepository()),
      child: Stack(
        children: <Widget>[
          GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
            child: Scaffold(
                appBar: AppBar(title: const Text('編集'),),
                body: _EditingProfileWidget(name)
            ),
          ),
          _LoadingWidget(),
        ],
      ),
    );
  }
}

class _EditingProfileWidget extends StatelessWidget {

  final String name;
  final TextEditingController _nickNameController = TextEditingController();

  _EditingProfileWidget(this.name) {
    _nickNameController.text = name;
  }

  @override
  Widget build(BuildContext context) {
    return StateNotifierBuilder<EditingProfileState>(
      stateNotifier: context.read<EditingProfileStateNotifier>(),
      builder: (context, state, _) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: _nickNameController,
                decoration: const InputDecoration(
                  border: const UnderlineInputBorder(),
                  labelText: 'ニックネーム',
                ),
              ),
              const SizedBox(height: 30,),
              FlatButton(
                child: const Text('編集'),
                onPressed: () async {
                  final String _name = _nickNameController.text;
                  if (_name != null && _name.isNotEmpty) {
                    await context.read<EditingProfileStateNotifier>().editingName(_name);
                  }

                  showResultDialog(context, state);

                },
                color: Colors.white,
                shape: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                highlightColor: Colors.blue,
              )
            ],
          ),
        );
      },
    );
  }

  /// 編集ボタンを押した後の挙動の処理
  void showResultDialog(BuildContext context, EditingProfileState state) {
    state.maybeWhen(
            () => null,
        success: () => Navigator.of(context).pop(),
        error: (_) => showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('エラー'),
                      content: const Text('名前を変更できませんでした。\nもう一度お確かめください'),
                      actions: <Widget>[
                        FlatButton(
                          child: const Text('OK'),
                          onPressed: () => Navigator.of(context).pop(),
                        )
                      ],
                    );
                  }
              ),
        orElse: () => null
    );
  }
}

class _LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return context.watch<EditingProfileState>().maybeWhen(
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
