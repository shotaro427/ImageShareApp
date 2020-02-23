
import "package:image_share_app/models/image_upload_bloc.dart";
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_share_app/widgets/commont_widgets/common_loading_widget.dart';
import 'package:provider/provider.dart';


class ImageUploadPage extends StatelessWidget {

  final String roomId;

  ImageUploadPage(this.roomId);

  @override
  Widget build(BuildContext context) {
    return Provider<ImageUploadBloc>(
      create: (context) => ImageUploadBloc(ImageUploadRepository()),
      dispose: (_, bloc) => bloc.dispose(),
      child: Stack(
        children: <Widget>[
          Scaffold(
            appBar: AppBar(
              title: const Text("投稿・編集"),
              elevation: 0,
            ),
            body: _LayoutUploadImagePage(roomId),
          ),
          CommonLoadingWidget<ImageUploadBloc>(dialogTitle: "画像のアップロード",)
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
    var bloc = Provider.of<ImageUploadBloc>(context, listen: false);
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: SingleChildScrollView(
        child: StreamBuilder(
          stream: bloc.value,
          builder: (context, snapshot) {
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
                              hintStyle: TextStyle(
                                  color: Colors.white
                              )
                          ),
                        ),
                      ),
                      // 投稿ボタン
                      IconButton(
                        icon: Icon(
                          Icons.send,
                          color: (!snapshot.hasData) ? Colors.grey : Colors.white,
                          size: 30,
                        ),
                        onPressed: (!snapshot.hasData)
                            ? null
                            : () {
                          // 画像をアップロードする処理
                          if (snapshot.hasData) {
                            var bloc = Provider.of<ImageUploadBloc>(context, listen: false);
                            bloc.uploadImage(snapshot.data, roomId,
                                title: titleController.text,
                                memoText: memoController.text);
                          }
                        }
                      ),
                    ],
                  ),
                ),
                // アップロードする画像を表示するWidget
                GestureDetector(
                  onTap: () => Provider.of<ImageUploadBloc>(context, listen: false).pickUpImage(),
                  child: Container(
                    height: 250,
                    child: (snapshot.hasData)
                        ? Image(
                      image: FileImage(snapshot.data),
                      fit: BoxFit.scaleDown,
                    )
                        : const Image(
                      image: const AssetImage("images/image_placeholder_500_300.png"),
                      fit: BoxFit.cover,
                    ),
                    padding: const EdgeInsets.all(5),
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
          }
        )
      ),
    );
  }
}
