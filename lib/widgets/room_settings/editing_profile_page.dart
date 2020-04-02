
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:image_share_app/models/editing_profile_bloc.dart';
import 'package:image_share_app/widgets/commont_widgets/common_loading_widget.dart';
import 'package:provider/provider.dart';

class EditingProfilePage extends StatelessWidget {

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
                body: _EditingProfileWidget()
            ),
          ),
          // TODO: implement Loading Widget
        ],
      ),
    );
//    // TODO: implement build
//    return Provider<EditingProfileBloc>(
//      create: (_) => EditingProfileBloc(EditingProfileRepository()),
//      dispose: (_, bloc) => bloc.dispose(),
//      child: Stack(
//        children: <Widget>[
//          GestureDetector(
//            onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
//            child: Scaffold(
//              appBar: AppBar(title: const Text('編集'),),
//              body: _EditingProfileWidget()
//            ),
//          ),
//          CommonLoadingWidget<EditingProfileBloc>(dialogTitle: '名前の変更',)
//        ],
//      ),
//    );
  }
}

class _EditingProfileWidget extends StatelessWidget {

  final TextEditingController _nickNameController = TextEditingController();

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

//    final EditingProfileBloc _bloc = Provider.of<EditingProfileBloc>(context, listen: false);
//    return Padding(
//      padding: const EdgeInsets.all(20),
//      child: Column(
//        mainAxisAlignment: MainAxisAlignment.center,
//        children: <Widget>[
//          TextFormField(
//            controller: _nickNameController,
//            decoration: const InputDecoration(
//              border: const UnderlineInputBorder(),
//              labelText: 'ニックネーム',
//            ),
//          ),
//          const SizedBox(height: 30,),
//          FlatButton(
//            child: const Text('編集'),
//            onPressed: () {
//              final String _name = _nickNameController.text;
//              if (_name != null && _name.isNotEmpty) {
//                _bloc.editingName(_name);
//              }
//            },
//            color: Colors.white,
//            shape: const OutlineInputBorder(
//              borderRadius: BorderRadius.all(Radius.circular(10.0)),
//            ),
//            highlightColor: Colors.blue,
//          )
//        ],
//      ),
//    );
  }

  void showResultDialog(BuildContext context, EditingProfileState state) {
    state.maybeWhen(
            () => null,
        success: () {
              Scaffold.of(context).showSnackBar(const SnackBar(content: const Text('名前を変更しました'),),);
        },
        error: (_) {
              showDialog(
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
              );
        },
        orElse: () => null
    );
  }
}
