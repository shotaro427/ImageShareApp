import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_share_app/model/controllers/self_editing_controller/self_editing_controller.dart';
import 'package:image_share_app/pages/self_editing/self_editing_page.dart';
import 'package:image_share_app/widget/atoms/index.dart';

class EditingForm extends ConsumerWidget {
  EditingForm(this._scaffoldKey, this._type);

  final _formKey = GlobalKey<FormState>();
  final EditType _type;
  final GlobalKey<ScaffoldState> _scaffoldKey;

  void onPress(BuildContext context) async {
    final controller = context.read(selfEditingController);
    final value = controller.editController(_type).text;
    await controller.validate(value, _type);

    if (_formKey.currentState.validate()) {
      await controller.saveUserInfo(_type, _scaffoldKey);
    }
  }

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final validator = watch(selfEditingController.state).validate;
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
                controller:
                    context.read(selfEditingController).editController(_type),
                decoration: InputDecoration(
                  border: const UnderlineInputBorder(),
                  labelText:
                      context.read(selfEditingController).formContent(_type),
                  labelStyle: const TextStyle(color: Colors.blueGrey),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blueGrey),
                  ),
                ),
                maxLength: 12,
                validator: (String value) => validator,
                cursorColor: Colors.black,
              ),
              const SizedBox(height: 24.0),
              Center(
                child: RoundRaisedButton(
                  '変更',
                  () => onPress(context),
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
