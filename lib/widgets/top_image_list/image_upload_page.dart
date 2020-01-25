
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
    // TODO: implement build
    return Provider<ImageUploadBloc>(
      create: (context) => ImageUploadBloc(ImageUploadRepository()),
      dispose: (_, bloc) => bloc.dispose(),
      child: Stack(
        children: <Widget>[
          Scaffold(
            appBar: AppBar(
              title: const Text("投稿"),
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
    return SingleChildScrollView(
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
                  child: TextFormField(
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
                // アップロードする画像を表示するWidget
                Container(
                  height: 300,
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
                // 「画像を選択する」ボタン
                RaisedButton(
                  child: const Text("画像を選択する"),
                  onPressed: () {
                    // TODO 画像を選択させる処理の追加
                    var bloc = Provider.of<ImageUploadBloc>(context, listen: false);
                    bloc.pickUpImage();
                  },
                ),
                Container(
                  margin: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: const BorderRadius.all(Radius.circular(5.0))),
                  child: TextFormField(
                    controller: memoController,
                    decoration: const InputDecoration(
                        border: const UnderlineInputBorder(),
                        hintText: 'メモ',
                    ),
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                  ),
                ),
                // 「画像をアップロードする」ボタン
                RaisedButton(
                    child: const Text("画像をアップロードする"),
                    onPressed: (!snapshot.hasData)
                        ? null
                        : () {
                      // 画像をアップロードする処理
                      if (snapshot.hasData) {
                        var bloc = Provider.of<ImageUploadBloc>(
                            context, listen: false);
                        bloc.uploadImage(snapshot.data, roomId, title: titleController.text, memoText: memoController.text);
                      }
                    }
                ),
              ],
            );
          }
        )
    );
  }
}
