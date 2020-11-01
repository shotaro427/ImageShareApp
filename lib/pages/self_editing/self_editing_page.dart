import 'package:flutter/material.dart';
import 'package:image_share_app/constants/color.dart';
import 'package:image_share_app/pages/self_editing/editing_form.dart';

enum EditType {
  name,
  email,
  id,
}

class SelfEditingPage extends StatelessWidget {
  SelfEditingPage(this._type);
  final EditType _type;
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarTitle()),
      ),
      body: EditingForm(_key, _type),
      backgroundColor: backgroundColor,
    );
  }

  String _appBarTitle() {
    switch (_type) {
      case EditType.name:
        return '名前を変更';
      case EditType.email:
        return 'メールアドレスを変更';
      case EditType.id:
        return 'IDを変更';
      default:
        return '';
    }
  }
}
