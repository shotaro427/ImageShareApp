import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_share_app/pages/self_editing/self_editing_page.dart';
import 'package:image_share_app/widget/atoms/index.dart';

class EditingForm extends StatelessWidget {
  EditingForm(this._scaffoldKey, this._type);

  final _formKey = GlobalKey<FormState>();
  final EditType _type;
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
                // controller: // TODO add editing controller
                decoration: InputDecoration(
                  border: const UnderlineInputBorder(),
                  labelText: _formContent(),
                  labelStyle: const TextStyle(color: Colors.blueGrey),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blueGrey),
                  ),
                ),
                maxLength: 12,
                validator: (String value) =>
                    value.length < 1 ? _formContent() + 'を入力してください' : null,
                cursorColor: Colors.black,
              ),
              const SizedBox(height: 24.0),
              Center(
                child: RoundRaisedButton(
                  '変更',
                  () {
                    if (_formKey.currentState.validate()) {
                      // TODO add confirm method
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

  String _formContent() {
    switch (_type) {
      case EditType.name:
        return '名前';
      case EditType.email:
        return 'メールアドレス';
      case EditType.id:
        return 'ID';
      default:
        return '';
    }
  }
}
