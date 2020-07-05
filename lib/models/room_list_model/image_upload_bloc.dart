import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:image_share_app/repositories/image_list_repositories/image_upload_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:image_share_app/widgets/top_image_list/select_tag_page.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'image_upload_bloc.freezed.dart';

@freezed
abstract class ImageUploadState with _$ImageUploadState {
  const factory ImageUploadState() = _ImageUploadState;
  const factory ImageUploadState.loading({@required File file}) = Loading;
  const factory ImageUploadState.success({@required File file}) = Success;
  const factory ImageUploadState.successUpload({@required File file}) =
      SuccessUpload;
  const factory ImageUploadState.error(
      {@Default('') String message, @required File file}) = ErrorDetails;
}

/**
 * 画像を投稿するときの状態を通知するstate_notifier
 */
class ImageUploadStateNotifier extends StateNotifier<ImageUploadState> {
  final ImageUploadRepository _repository;
  ImageUploadStateNotifier(this._repository) : super(const ImageUploadState());

  /// ギャラリーを表示して画像を選択
  Future<void> pickUpImage() async {
    try {
      final _imageFile = await _repository.getImageInGallery();
      state = ImageUploadState.success(file: _imageFile);
    } catch (e) {
      log(e.toString());
      state = ImageUploadState.error(
          message: e.toString(),
          file: File('images/image_placeholder_500_300.png'));
    }
  }

  /// CloudStorageとFireStoreに保存
  Future<void> uploadImage(
    File imageFile,
    String roomId, {
    String title,
    String memo,
    List<TagState> tags,
  }) async {
    final String _timestamp = DateTime.now().millisecondsSinceEpoch.toString();

    state = ImageUploadState.loading(file: imageFile);

    try {
      await _repository.postImageWithTitle(
        roomId,
        _timestamp,
        title: title,
        memoText: memo,
        tags: tags,
      );
      await _repository.uploadImageToFireStorage(imageFile, roomId, _timestamp);
      state = ImageUploadState.successUpload(file: imageFile);
    } catch (e) {
      log(e.toString());
      state = ImageUploadState.error(
          message: e.toString(),
          file: File('images/image_placeholder_500_300.png'));
    }
  }
}
