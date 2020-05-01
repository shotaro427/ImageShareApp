
import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:image_share_app/models/room_list_model/image_upload_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_share_app/repositories/image_list_repositories/image_upload_repository.dart';
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
            _LoadingWidget(),
          ]
      ),
    );
  }
}

/// 全体のPage
class _LayoutUploadImagePage extends StatelessWidget {

  final String roomId;

  _LayoutUploadImagePage(this.roomId) {
    // 広告をロード
    RewardedVideoAd.instance.load(adUnitId: "ca-app-pub-9097303817244208/3182791560", targetingInfo: targetingInfo);
  }

  /// 広告ターゲット
  static const MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    testDevices: <String>['7AC426FD-8338-4B41-947C-AEF71C81A937'],
    keywords: <String>['flutterio', 'beautiful apps'],
    contentUrl: 'https://flutter.io',
    childDirected: false,
    nonPersonalizedAds: true,
  );

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
                            await state.maybeWhen(
                              () => null,
                              success: (imageFile) => _uploadImage(context, imageFile),
                              orElse: () => null
                            );
                          },
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
                    child: setImage(state),
                  ),
                ),
                // タグ追加欄
                // Row(
                //   children: <Widget>[
                //     Padding(
                //       padding: const EdgeInsets.only(left: 20, right: 15, top: 10, bottom: 10),
                //       child: Icon(
                //         Icons.local_offer,
                //         color: Colors.grey,
                //         size: 22,
                //       ),
                //     ),
                //     const Text('タグ', style: TextStyle(color: Colors.grey),)
                //   ],
                // ),
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

  /// 画像を状態に合わせてセットする関数
  Widget setImage(ImageUploadState state) {
    return state.maybeWhen(
      // デフォルト時
          () => const Image(
        image: const AssetImage("images/image_placeholder_500_300.png"),
        fit: BoxFit.cover,
      ),
      loading: (imageFile) => Image(
        image: FileImage(imageFile),
        fit: BoxFit.scaleDown,
      ),
      success: (imageFile) => Image(
        image: FileImage(imageFile),
        fit: BoxFit.scaleDown,
      ),
      successUpload: (imageFile) => Image(
        image: FileImage(imageFile),
        fit: BoxFit.scaleDown,
      ),
      error: (_, imageFile) => Image(
        image: FileImage(imageFile),
        fit: BoxFit.scaleDown,
      ),
      // そのほかの時
      orElse: () => const Image(
        image: const AssetImage("images/image_placeholder_500_300.png"),
        fit: BoxFit.cover,
      ),
    );
  }

  /// 画像を投稿
  Future<void> _uploadImage(BuildContext context, File imageFile) async {

    // 処理を実行
    await context.read<ImageUploadStateNotifier>().uploadImage(imageFile, roomId, title: titleController.text, memo: memoController.text);

    context.read<ImageUploadState>().maybeWhen(
      () => null,
      successUpload: (_) => _showSuccessDialog(context),
      error: (message, _) => _showErrorDialog(context),
      orElse: () => null,
    );
  }

  /// エラーダイアログを表示する
  void _showErrorDialog(BuildContext context) {
    AwesomeDialog(
      context: context,
      headerAnimationLoop: false,
      tittle: 'エラー',
      desc: '投稿できませんでした。\nもう一度お確かめください',
      dialogType: DialogType.ERROR,
      animType: AnimType.SCALE,
      btnOkText: 'OK',
      btnOkOnPress: () {},
    ).show();
  }

  /// 投稿完了後に広告を表示する
  void _showSuccessDialog(BuildContext context) async {

    // RewardedVideoAd.instance.show();

    // RewardedVideoAd.instance.listener = (RewardedVideoAdEvent event, {String rewardType, int rewardAmount}) {
    //   if (event == RewardedVideoAdEvent.rewarded) {

      // }
    // };

    AwesomeDialog(
      context: context,
      headerAnimationLoop: false,
      tittle: '投稿しました。',
      desc: '投稿が完了しました。',
      dialogType: DialogType.SUCCES,
      animType: AnimType.SCALE,
      btnOkText: 'OK',
      btnOkOnPress: () => Navigator.of(context).pop(),
    ).show();
  }
}
class _LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return context.watch<ImageUploadState>().maybeWhen(
      null,
      loading: (_) => const DecoratedBox(
        decoration: BoxDecoration(
          color: Color(0x44000000),
        ),
        child: Center(child: const CircularProgressIndicator()),
      ),
      orElse: () => const SizedBox.shrink(),
    );
  }
}
