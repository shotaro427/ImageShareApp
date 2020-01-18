

import 'dart:async';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_share_app/widgets/commont_widgets/common_loading_widget.dart';

/// 画像のアップロード
/// ライブラリーなどから画像を取得する
/// ためのBLoC
class ImageUploadBloc extends AbstractLoadingBloc {

  final ImageUploadRepository _repository;

  ImageUploadBloc(this._repository);

  /// 選択された画像を発行
  final _valueController = StreamController<File>();
  Stream<File> get value => _valueController.stream;

  final _loadingController = StreamController<LoadingType>();
  Stream<LoadingType> get loadingValue => _loadingController.stream;

  /// ImagePickerから画像を取得
  void pickUpImage() async {
    _valueController.sink.add(await _repository.getImageInGallery());
  }

  /// FireStorageに画像をアップロード
  void uploadImage(File file, String roomId) async {
    _loadingController.sink.add(LoadingType.LOADING);
    _repository.uploadImageToFireStorage(file, roomId);
    _loadingController.sink.add(LoadingType.COMPLETED);
  }

  void dispose() {
    _valueController.close();
    _loadingController.close();
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