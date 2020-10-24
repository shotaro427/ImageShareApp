import 'dart:developer';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_share_app/model/controllers/create_post_controller/create_post_state.dart';
import 'package:image_share_app/services/index.dart';
import 'package:state_notifier/state_notifier.dart';

final createPostController = StateNotifierProvider((ref) {
  return CreatePostController(
    FilePickerService(),
  );
});

class CreatePostController extends StateNotifier<CreatePostState> {
  CreatePostController(this._filePickerService)
      : super(const CreatePostState());

  final FilePickerService _filePickerService;

  Future<void> pickUpImage() async {
    state = state.copyWith(isLoading: true);
    try {
      final List<File> _pickedImages = await _filePickerService.getImageFile();
      state = state.copyWith(
          isLoading: false, error: null, pickedFiles: _pickedImages);
    } catch (error) {
      log(error.toString());
      state = state.copyWith(isLoading: false, error: error.toString());
    }
  }

  Future<void> pickUpPdf() async {
    state = state.copyWith(isLoading: true);
    try {
      final List<File> _pickedPdfs = await _filePickerService.getPdfFile();
      state = state.copyWith(
          isLoading: false, error: null, pickedFiles: _pickedPdfs);
    } catch (error) {
      log(error.toString());
      state = state.copyWith(isLoading: false, error: error.toString());
    }
  }

  void switchInputTagMode() {
    state = state.copyWith(isInputTag: !state.isInputTag);
  }
}
