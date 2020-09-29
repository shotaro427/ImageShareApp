import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_share_app/model/controllers/create_room_controller/create_room_controller.dart';
import 'package:image_share_app/widget/atoms/index.dart';

class CreateRoomForm extends ConsumerWidget {
  CreateRoomForm(this._scaffoldKey);

  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final isLoading = watch(createRoomController.state).isLoading;
    return isLoading
        ? const Center(child: CircularProgressIndicator())
        : Center(
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    const SizedBox(height: 24.0),
                    TextFormField(
                      controller: context
                          .read(createRoomController)
                          .nameInputController,
                      decoration: const InputDecoration(
                        border: const UnderlineInputBorder(),
                        labelText: 'メールアドレス',
                        labelStyle: TextStyle(color: Colors.blueGrey),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: const BorderSide(color: Colors.blueGrey),
                        ),
                      ),
                      maxLength: 20,
                      validator: (String value) =>
                          value.length < 1 ? '名前を入力してください' : null,
                      cursorColor: Colors.black,
                    ),
                    const SizedBox(height: 24.0),
                    Center(
                      child: RoundRaisedButton(
                        'グループ作成',
                        () {
                          if (_formKey.currentState.validate()) {
                            context
                                .read(createRoomController)
                                .createRoom(_scaffoldKey);
                          }
                        },
                        background: Colors.blue,
                        textColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
