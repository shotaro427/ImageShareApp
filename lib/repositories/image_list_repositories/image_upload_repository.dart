
import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ImageUploadRepository {

  /// ユーザーのローカルから画像を選択させて、取得する
  Future<File> getImageInGallery() async {

    return await ImagePicker.pickImage(source: ImageSource.gallery);
  }

  /// FireStorageに画像をアップロードする
  Future uploadImageToFireStorage(File file, String roomId, String timestamp) async {

    final ImageProperties _properties = await FlutterNativeImage.getImageProperties(file.path);
    File compressedFile = await FlutterNativeImage.compressImage(file.path, targetHeight: 200, targetWidth: (_properties.width / _properties.height * 200).round());

    log(roomId);

    final StorageReference _ref = FirebaseStorage.instance
        .ref()
        .child("roomImages/${roomId}/${timestamp}");

    final StorageReference _thumbnailsRef = FirebaseStorage.instance
        .ref()
        .child('roomImages/${roomId}/thumbnails/${timestamp}_200x200');

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
      String timestamp,
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

    final _ref = await Firestore.instance.collection('rooms/${roomId}/images').add({
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