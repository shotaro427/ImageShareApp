import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_share_app/constants/color.dart';
import 'package:image_share_app/model/controllers/self_editing_controller/self_editing_controller.dart';
import 'package:image_share_app/pages/self_editing/editing_form.dart';
import 'package:image_share_app/widget/atoms/loading_view.dart';

enum EditType {
  name,
  email,
  id,
}

class SelfEditingPage extends ConsumerWidget {
  SelfEditingPage(this._type);
  final EditType _type;
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final isLoading = watch(selfEditingController.state).isLoading;
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: Text(_appBarTitle()),
          ),
          body: EditingForm(_key, _type),
          backgroundColor: backgroundColor,
          key: _key,
        ),
        LoadingView(isLoading),
      ],
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
