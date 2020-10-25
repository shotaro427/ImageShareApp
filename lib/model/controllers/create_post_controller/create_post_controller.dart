import 'dart:developer';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_share_app/model/controllers/create_post_controller/create_post_state.dart';
import 'package:image_share_app/model/entities/room.entity.dart';
import 'package:image_share_app/services/index.dart';
import 'package:state_notifier/state_notifier.dart';

final createPostController = StateNotifierProvider((ref) {
  final _roomStore = ref.watch(roomStore.state);
  final _roomController = ref.watch(roomStore);
  return CreatePostController(
    FilePickerService(),
    _roomStore,
    _roomController,
  );
});

class CreatePostController extends StateNotifier<CreatePostState> {
  CreatePostController(
    this._filePickerService,
    this._roomStore,
    this._roomController,
  ) : super(const CreatePostState());

  final FilePickerService _filePickerService;
  final RoomState _roomStore;
  final RoomController _roomController;

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

  Future<void> addNewTag(String tag) async {
    if (tag.isEmpty || tag == ':/input') return;

    state = state.copyWith(isLoading: true);
    try {
      final List<String> _newTags = _roomStore.tags;
      _newTags.add(tag);
      _newTags.removeWhere((element) => element == ':/input');
      final RoomState _newRoom = _roomStore.copyWith(tags: _newTags);
      await _roomController.updateRoom(_newRoom);

      state = state.copyWith(isLoading: false);
    } catch (error) {
      log(error.toString());
      state = state.copyWith(isLoading: false, error: error.toString());
    }
  }

  void toggleTag(String tag) {
    if (state.tags.contains(tag)) {
      List<String> _newTags = List.from(state.tags);
      _newTags.removeWhere((element) => element == tag);
      state = state.copyWith(tags: _newTags);
    } else {
      List<String> _newTags = List.from(state.tags);
      _newTags.add(tag);
      state = state.copyWith(tags: _newTags);
    }
  }

  void switchInputTagMode() {
    state = state.copyWith(isInputTag: !state.isInputTag);
  }
}
