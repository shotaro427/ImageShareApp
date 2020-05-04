
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:image_share_app/Entities/image_entity/image_entity.dart';
import 'package:image_share_app/Entities/room_entity/room_info_entity.dart';
import 'package:image_share_app/models/image_detail/image_detail_bloc.dart';
import 'package:image_share_app/repositories/image_detail/image_detail_repository.dart';
import 'package:image_share_app/widgets/image_detail/image_detail_view_page.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

class ImageDetailPage extends StatelessWidget {

  final ImageEntity _imageEntity;
  final RoomInfoEntity _roomInfoEntity;

  ImageDetailPage(this._imageEntity, this._roomInfoEntity);

  @override
  Widget build(BuildContext context) {
    return StateNotifierProvider<ImageDetailStateNotifier, ImageDetailState>(
      create: (_) => ImageDetailStateNotifier(_imageEntity, _roomInfoEntity, ImageDetailRepository()),
      child: Stack(
        children: <Widget>[
          Scaffold(
            appBar: AppBar(
              title: const Text('詳細'),
              actions: <Widget>[
                Builder(
                  builder: (BuildContext context) {
                    return IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => _showDeleteConfirmDialog(context),
                    );
                  },
                )
              ],
            ),
            body: _LayoutDetailImage(_imageEntity),
          ),
          _LoadingWidget(),
        ],
      ),
    );
  }

  void _showDeleteConfirmDialog(BuildContext context) {
    final ImageDetailStateNotifier _notifier = context.read<ImageDetailStateNotifier>();
    AwesomeDialog(
      context: context,
      headerAnimationLoop: false,
      tittle: '削除しますか',
      desc: '本当に削除しますか？\n※復元できません。',
      dialogType: DialogType.WARNING,
      animType: AnimType.SCALE,
      btnOkText: 'キャンセル',
      btnCancelText: 'OK',
      btnOkColor: Colors.red,
      btnCancelColor: const Color(0xFF00CA71),
      btnOkOnPress: () {},
      btnCancelOnPress: () async {
        await _notifier.deleteImage();
        _showDeletedDialog(context);
      },
    ).show();
  }

  void _showDeletedDialog(BuildContext context) {
    AwesomeDialog(
      context: context,
      headerAnimationLoop: false,
      tittle: '削除しました',
      desc: '削除が完了しました。',
      dialogType: DialogType.SUCCES,
      animType: AnimType.SCALE,
      btnOkText: 'OK',
      btnOkOnPress: () => Navigator.of(context).pop(),
    ).show();
  }
}

class _LayoutDetailImage extends StatelessWidget {

  final ImageEntity _entity;

  _LayoutDetailImage(this._entity);

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
        child: Column(
          children: <Widget>[
            Flexible(
              flex: 1,
              child: Container(
                height: 300,
                child: GestureDetector(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ImageDetailViewPage(_entity.originalUrl, _entity.title))),
                  child: Image(
                    fit: BoxFit.contain,
                    width: MediaQuery.of(context).size.width,
                    image: (_entity.originalUrl != null) ? NetworkImage(_entity.originalUrl) : Image.memory(kTransparentImage),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: const [
                      const BoxShadow(
                        color: Colors.black,
                        blurRadius: 20,
                        spreadRadius: 5,
                        offset: const Offset(0, 10,),
                      ),
                    ],
                    color: Colors.white
                ),
                child: StateNotifierBuilder<ImageDetailState>(
                  stateNotifier: context.read<ImageDetailStateNotifier>(),
                  builder: (context, state, _) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Center(
                          child: const SizedBox(
                            width: 60,
                            height: 3,
                            child: const DecoratedBox(
                              decoration: const BoxDecoration(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Flexible(
                                child: TextFormField(
                                  style: const TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black
                                  ),
                                  controller: context.read<ImageDetailStateNotifier>().titleController,
                                  decoration: const InputDecoration.collapsed(
                                    hintStyle: TextStyle(
                                      color: Colors.grey,
                                    ),
                                    hintText: 'タイトル',
                                  ),
                                  // 編集モードのときはTextFormFieldの編集を可能にする
                                  enabled: state.maybeWhen(
                                      () => false,
                                      editing: (_) => true,
                                      orElse: () => false
                                  ),
                                ),
                              ),
                              Row(
                                children: <Widget>[
                                  OutlineButton(
                                    child: state.maybeWhen(
                                        () => const Text('編集'),
                                        editing: (_) => const Text('保存'),
                                        orElse: () => const Text('編集')
                                    ),
                                    onPressed: () {
                                      final bool mode = state.maybeWhen(
                                          () => false,
                                          editing: (_) => true,
                                          orElse: () => false
                                      );
                                      context.read<ImageDetailStateNotifier>().switchingMode(!mode, withSave: true);
                                    },
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5),),
                                    borderSide: const BorderSide(
                                      width: 2,
                                      color: Colors.black26
                                    ),
                                  ),
                                  Visibility(
                                    child: IconButton(
                                      icon: const Icon(Icons.close),
                                      onPressed: () => context.read<ImageDetailStateNotifier>().switchingMode(false),
                                    ),
                                    visible: state.maybeWhen(
                                        () => false,
                                        editing: (_) => true,
                                        orElse: () => false
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 25,),
                        // Row(
                        //   crossAxisAlignment: CrossAxisAlignment.start,
                        //   children: <Widget>[
                        //     Column(
                        //       children: <Widget>[
                        //         Icon(Icons.local_offer, color: Colors.grey,),
                        //         const Text(
                        //           'タグ', style: TextStyle(color: Colors.grey),)
                        //       ],
                        //     )
                        //   ],
                        // ),
                        const SizedBox(height: 15,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Icon(Icons.note, color: Colors.grey,),
                                const Text(
                                  'メモ', style: TextStyle(color: Colors.grey),)
                              ],
                            ),
                            Flexible(
                              child: Container(
                                padding: const EdgeInsets.only(left: 30),
                                child: TextFormField(
                                  style: const TextStyle(color: Colors.black),
                                  controller: context.read<ImageDetailStateNotifier>().memoController,
                                  decoration: InputDecoration.collapsed(
                                    hintStyle: TextStyle(
                                      color: state.maybeWhen(
                                          () => Colors.transparent,
                                          editing: (_) => Colors.grey,
                                          orElse: () => Colors.transparent
                                      ),
                                    ),
                                    hintText: 'メモを書き込めます',
                                  ),
                                  // 編集モードのときはTextFormFieldの編集を可能にする
                                  enabled: state.maybeWhen(
                                      () => false,
                                      editing: (_) => true,
                                      orElse: () => false
                                  ),
                                  keyboardType: TextInputType.multiline,
                                  maxLines: null,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  }
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return context.watch<ImageDetailState>().maybeWhen(
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
