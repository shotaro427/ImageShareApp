
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
            appBar: AppBar(title: const Text("投稿"),),
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

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<ImageUploadBloc>(context, listen: false);
    return Center(
      child: StreamBuilder(
        stream: bloc.value,
        builder: (context, snapshot) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text("画像を投稿", style: TextStyle(fontSize: 22),),
              SizedBox(
                height: 200,
                child: (snapshot.hasData)
                  ? Image.file(snapshot.data)
                  : Image.asset("images/image_placeholder.png")
              ),
              RaisedButton(
                child: const Text("画像を選択する"),
                onPressed: () {
                  // TODO 画像を選択させる処理の追加
                  var bloc = Provider.of<ImageUploadBloc>(context, listen: false);
                  bloc.pickUpImage();
                },
              ),
              RaisedButton(
                child: const Text("画像をアップロードする"),
                onPressed: (!snapshot.hasData)
                  ? null
                  :  () {
                      // 画像をアップロードする処理
                      if (snapshot.hasData) {
                        var bloc = Provider.of<ImageUploadBloc>(context, listen: false);
                        bloc.uploadImage(snapshot.data, roomId);
                      }
                    }
              ),
            ],
          );
        },
      ),
    );
  }
}
