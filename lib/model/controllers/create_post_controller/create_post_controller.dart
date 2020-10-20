import 'dart:developer';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_share_app/model/controllers/create_post_controller/create_post_state.dart';
import 'package:image_share_app/services/index.dart';
import 'package:state_notifier/state_notifier.dart';

final createPostController = StateNotifierProvider((ref) {
  return CreatePostController(ImagePickerService());
});

class CreatePostController extends StateNotifier<CreatePostState> {
  CreatePostController(this._pickerService) : super(const CreatePostState());

  final ImagePickerService _pickerService;

  Future<void> pickUpImage() async {
    state = state.copyWith(isLoading: true);
    try {
      final File pickedImage = await _pickerService.getImageInGallery();
      state = state.copyWith(
          isLoading: false, error: null, pickedFile: pickedImage);
    } catch (error) {
      log(error.toString());
      state = state.copyWith(isLoading: false, error: error.toString());
    }
  }
}
