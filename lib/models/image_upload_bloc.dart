
import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_share_app/widgets/commont_widgets/common_loading_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'image_upload_bloc.freezed.dart';

@freezed
abstract class ImageUploadState with _$ImageUploadState {
  const factory ImageUploadState() = _ImageUploadState;
  const factory ImageUploadState.loading() = Loading;
  const factory ImageUploadState.success() = Success;
  const factory ImageUploadState.error({@Default('') String message}) = ErrorDetails;
}

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
  void uploadImage(File file, String roomId, {String title, String memoText}) async {
    int _timestamp = DateTime.now().millisecondsSinceEpoch;
    
    _loadingController.sink.add(LoadingType.LOADING);
    await _repository.postImageWithTitle(roomId, _timestamp, title: title, memoText: memoText);
    await _repository.uploadImageToFireStorage(file, roomId, _timestamp);
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

  /// FireStorageに画像をアップロードする
  Future uploadImageToFireStorage(File file, String roomId, int timestamp) async {

    final ImageProperties _properties = await FlutterNativeImage.getImageProperties(file.path);
    File compressedFile = await FlutterNativeImage.compressImage(file.path, targetHeight: 200, targetWidth: (_properties.width / _properties.height * 200).round());

    log(roomId);

    final StorageReference _ref = FirebaseStorage.instance
        .ref()
        .child("roomImages")
        .child(roomId)
        .child(timestamp.toString());

    final StorageReference _thumbnailsRef = FirebaseStorage.instance
        .ref()
        .child("roomImages")
        .child(roomId)
        .child('thumbnails')
        .child(timestamp.toString() + '_200x200');

    await _ref.putFile(
        file,
        StorageMetadata(
          contentType: "image/jpeg",
        )
    );

    await _thumbnailsRef.putFile(
      compressedFile,
      StorageMetadata(
        contentType: "image/jpeg",
      )
    );
  }

  /// firestoreに投稿情報を保存する
  Future postImageWithTitle(
      String roomId,
      int timestamp,
      {
        String title,
        String memoText
      }) async {

    String _title = "名無し";
    String _memoText = "";
    
    if (title != null && title.isNotEmpty) { _title = title; }
    if (memoText != null) { _memoText = memoText; }

    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    final _uid = _prefs.getString('uid');

    final _ref = await Firestore.instance.collection("rooms/${roomId}/images").add({
      'title': _title,
      'memo': _memoText,
      'created_at': timestamp.toString(),
      'updated_at': timestamp.toString(),
      'created_user_uid': _uid
    });

    await _ref.updateData({
      'image_id': _ref.documentID
    });
  }
}