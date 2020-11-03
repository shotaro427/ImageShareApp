import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_share_app/model/controllers/member_invite_controller/member_invite_controller.dart';
import 'package:image_share_app/widget/atoms/index.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InviteForm extends StatelessWidget {
  InviteForm(this._scaffoldKey);

  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(height: 24.0),
              TextFormField(
                controller: context.read(memberInviteController).controller,
                decoration: const InputDecoration(
                  border: const UnderlineInputBorder(),
                  labelText: '招待ID',
                  labelStyle: TextStyle(color: Colors.blueGrey),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blueGrey),
                  ),
                ),
                maxLength: 12,
                validator: (String value) {
                  if (value.length < 1) {
                    return '招待IDを入力してください';
                  } else if (value.length != 12) {
                    return '招待IDは12文字です';
                  } else {
                    return null;
                  }
                },
                cursorColor: Colors.black,
              ),
              const SizedBox(height: 24.0),
              Center(
                child: RoundRaisedButton(
                  '招待',
                  () {
                    if (_formKey.currentState.validate()) {
                      context.read(memberInviteController).invite(_scaffoldKey);
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
