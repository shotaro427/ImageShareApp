
import 'dart:io';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_share_app/widgets/commont_widgets/common_loading_widget.dart';
import 'package:provider/provider.dart';
import 'package:firebase_storage/firebase_storage.dart';


class ImageUploadPage extends StatelessWidget {

  final String roomId;

  ImageUploadPage(this.roomId);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MultiProvider(
      providers: [
        Provider<LoadingBloc>(
          create: (_) => LoadingBloc(),
          dispose: (_, bloc) => bloc.dispose(),
        ),
        Provider<ImageUploadBloc>(
          create: (context) {
            var bloc = Provider.of<LoadingBloc>(context, listen: false);
            return ImageUploadBloc(ImageUploadRepository(), bloc);
          },
          dispose: (_, bloc) => bloc.dispose(),
        ),
      ],
      child: Stack(
        children: <Widget>[
          Scaffold(
            appBar: AppBar(title: const Text("投稿"),),
            body: _LayoutUploadImagePage(roomId),
          ),
          CommonLoadingWidget<LoadingBloc>()
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

/// インジケータ用のWidgetクラス
class _LoadingWidgetInCreateRoomPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<LoadingBloc>(context);
    return StreamBuilder(
      stream: bloc.value,
      initialData: false,
      builder: (context, snapshot) {
        switch(snapshot.data) {
          case LoadingType.NOT_YET:{
            return const SizedBox.shrink();
          }
          case LoadingType.LOADING: {
            return const DecoratedBox(
                decoration: const BoxDecoration(
                    color: const Color(0x44000000)
                ),
                child: const Center(
                  child: const CircularProgressIndicator(),
                )
            );
          }
          case LoadingType.COMPLETED: {
            return AlertDialog(
              title: const Text("完了しました"),
              content: const Text("アップロードが完了しました。"),
              actions: <Widget>[
                FlatButton(
                  child: const Text("OK"),
                  // TODO TOP画面に遷移させる
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            );
          }
          default: {
            return Container();
          }
        }
      },
    );
  }
}

/// 画像のアップロード
/// ライブラリーなどから画像を取得する
/// ためのBLoC
class ImageUploadBloc {

  final ImageUploadRepository _repository;
  final LoadingBloc _loadingBloc;

  ImageUploadBloc(this._repository, this._loadingBloc);

  /// 選択された画像を発行
  final _valueController = StreamController<File>();
  Stream<File> get value => _valueController.stream;

  /// ImagePickerから画像を取得
  void pickUpImage() async {
    _valueController.sink.add(await _repository.getImageInGallery());
  }

  /// FireStorageに画像をアップロード
  void uploadImage(File file, String roomId) async {
    _repository.uploadImageToFireStorage(file, roomId);
    _loadingBloc.loading(LoadingType.COMPLETED);
  }

  void dispose() {
    _valueController.close();
  }
}

// ローディングクラス
class LoadingBloc extends AbstractLoadingBloc {
  LoadingBloc() {
    loading(LoadingType.NOT_YET);
  }

  final _valueController = StreamController<LoadingType>();

  Stream<LoadingType> get value => _valueController.stream;

  loading(LoadingType isLoading) {
    _valueController.sink.add(isLoading);
  }

  void dispose() {
    _valueController.close();
  }
}

class ImageUploadRepository {

  /// ユーザーのローカルから画像を選択させて、取得する
  Future<File> getImageInGallery() async {

    return await ImagePicker.pickImage(source: ImageSource.gallery);
  }

  Future uploadImageToFireStorage(File file, String roomId) async {
    int timestamp = DateTime.now().millisecondsSinceEpoch;

    final StorageReference _ref = FirebaseStorage()
        .ref()
        .child("roomImages")
        .child(roomId)
        .child(timestamp.toString());

    _ref.putFile(
      file,
      StorageMetadata(
        contentType: "image/jpeg",
      )
    );

  }

}