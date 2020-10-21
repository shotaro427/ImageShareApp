import 'dart:developer';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_share_app/model/controllers/create_post_controller/create_post_state.dart';
import 'package:image_share_app/services/index.dart';
import 'package:state_notifier/state_notifier.dart';

final createPostController = StateNotifierProvider((ref) {
  return CreatePostController(
    ImagePickerService(),
    FilePickerService(),
  );
});

class CreatePostController extends StateNotifier<CreatePostState> {
  CreatePostController(this._imagePickerService, this._filePickerService)
      : super(const CreatePostState());

  final ImagePickerService _imagePickerService;
  final FilePickerService _filePickerService;

  Future<void> pickUpImage() async {
    state = state.copyWith(isLoading: true);
    try {
      final File pickedImage = await _imagePickerService.getImageInGallery();
      state = state.copyWith(
          isLoading: false, error: null, pickedFile: pickedImage);
    } catch (error) {
      log(error.toString());
      state = state.copyWith(isLoading: false, error: error.toString());
    }
  }

  Future<void> pickUpPdf() async {
    state = state.copyWith(isLoading: true);
    try {
      final File pickedImage = await _filePickerService.getPdfFile();
      state = state.copyWith(
          isLoading: false, error: null, pickedFile: pickedImage);
    } catch (error) {
      log(error.toString());
      state = state.copyWith(isLoading: false, error: error.toString());
    }
  }
}
