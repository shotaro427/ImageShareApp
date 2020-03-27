
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import "package:image_share_app/models/image_upload_bloc.dart";
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class ImageUploadPage extends StatelessWidget {

  final String roomId;

  ImageUploadPage(this.roomId);

  @override
  Widget build(BuildContext context) {
    return StateNotifierProvider<ImageUploadStateNotifier, ImageUploadState>(
      create: (_) => ImageUploadStateNotifier(ImageUploadRepository()),
      child: Stack(
          children: <Widget>[
            Scaffold(
              appBar: AppBar(
                title: const Text("投稿"),
                elevation: 0,
              ),
              body: _LayoutUploadImagePage(roomId),
            ),
            // TODO: ローディングのWidgetを追加
            _LoadingWidget(),
          ]
      ),
    );
  }
}

/// 全体のPage
class _LayoutUploadImagePage extends StatelessWidget {

  final String roomId;

  _LayoutUploadImagePage(this.roomId);

  final TextEditingController titleController = TextEditingController();
  final TextEditingController memoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: SingleChildScrollView(
        child: StateNotifierBuilder<ImageUploadState>(
          stateNotifier: context.read<ImageUploadStateNotifier>(),
          builder: (context, state, _) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                // タイトル入力欄
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    color: Theme
                        .of(context)
                        .primaryColor,
                  ),
                  child: Row(
                    children: <Widget>[
                      // タイトル入力欄
                      Flexible(
                        child: TextFormField(
                          style: const TextStyle(color: Colors.white),
                          controller: titleController,
                          autofocus: true,
                          cursorColor: Theme
                              .of(context)
                              .primaryTextTheme
                              .title
                              .color,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'タイトル',
                            hintStyle: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      // 投稿ボタン
                      IconButton(
                          icon: Icon(
                            Icons.send,
                            color: state.maybeWhen(
                                () => Colors.grey,
                                success: (_) => Colors.white,
                                orElse: () => Colors.grey
                            ),
                            size: 30,
                          ),
                          onPressed: () async {
                            state.maybeWhen(
                                () => null,
                                success: (imageFile) async => await context.read<ImageUploadStateNotifier>().uploadImage(imageFile, roomId, title: titleController.text, memo: memoController.text),
                                orElse: () => null
                            );
                          }
                      ),
                    ],
                  ),
                ),
                // アップロードする画像を表示するWidget
                GestureDetector(
                  onTap: () => context.read<ImageUploadStateNotifier>().pickUpImage(),
                  child: Container(
                    height: 250,
                    padding: const EdgeInsets.all(5),
                    child: state.maybeWhen(
                        // デフォルト時
                        () => const Image(
                          image: const AssetImage("images/image_placeholder_500_300.png"),
                          fit: BoxFit.cover,
                        ),
                        //　画像選択が成功したとき
                        success: (imageFile) => Image(
                          image: FileImage(imageFile),
                          fit: BoxFit.scaleDown,
                        ),
                        // そのほかの時
                        orElse: () => const Image(
                          image: const AssetImage("images/image_placeholder_500_300.png"),
                          fit: BoxFit.cover,
                        ),
                    ),
                  ),
                ),
                // タグ追加欄
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 15, top: 10, bottom: 10),
                      child: Icon(
                        Icons.local_offer,
                        color: Colors.grey,
                        size: 22,
                      ),
                    ),
                    const Text('タグ', style: TextStyle(color: Colors.grey),)
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Divider(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                // メモ入力画面
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 15, top: 13),
                      child: Icon(
                        Icons.note,
                        color: Colors.grey,
                        size: 22,
                      ),
                    ),
                    Flexible(
                      child: TextFormField(
                        controller: memoController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'メモ',
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 14
                          ),
                        ),
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
class _LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return context.watch<ImageUploadState>().maybeWhen(
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
