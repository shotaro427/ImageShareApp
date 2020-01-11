
import 'dart:io';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ImageUploadPage extends StatelessWidget {
  const ImageUploadPage({Key key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Provider<ImageUploadBloc>(
      create: (context) => ImageUploadBloc(ImageUploadRepository()),
      dispose: (context, bloc) => bloc.dispose(),
      child: Scaffold(
        appBar: AppBar(title: const Text("投稿"),),
        body: _LayoutUploadImagePage(),
      ),
    );
  }
}

class _LayoutUploadImagePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<ImageUploadBloc>(context, listen: false);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text("画像を投稿", style: TextStyle(fontSize: 22),),
          StreamBuilder<File>(
            stream: bloc.value,
            builder: (context, snapshot) {
              return SizedBox(
                width: MediaQuery.of(context).size.width,
                child: (snapshot.hasData)
                  ? Image.file(snapshot.data)
                  : Image.asset("images/image_placeholder.png")
              );
            },
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
            onPressed: () {
              // TODO 画像をFireStorageにアップロードする処理の追加
            },
          )
        ],
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
  void uploadImage() async {

  }

  void dispose() {
    _valueController.close();
  }
}

class ImageUploadRepository {

  Future<File> getImageInGallery() async {

    return await ImagePicker.pickImage(source: ImageSource.gallery);
  }

}