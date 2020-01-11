
import 'dart:io';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:firebase_storage/firebase_storage.dart';


class ImageUploadPage extends StatelessWidget {

  final String roomId;

  ImageUploadPage(this.roomId);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Provider<ImageUploadBloc>(
      create: (context) => ImageUploadBloc(ImageUploadRepository()),
      dispose: (context, bloc) => bloc.dispose(),
      child: Scaffold(
        appBar: AppBar(title: const Text("投稿"),),
        body: _LayoutUploadImagePage(roomId),
      ),
    );
  }
}

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

class ImageUploadBloc {

  final ImageUploadRepository _repository;

  ImageUploadBloc(this._repository);

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