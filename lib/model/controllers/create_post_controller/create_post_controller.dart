import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_share_app/model/controllers/create_post_controller/create_post_state.dart';
import 'package:image_share_app/model/controllers/post_top_controller/post_top_controller.dart';
import 'package:image_share_app/model/entities/room.entity.dart';
import 'package:image_share_app/model/entities/user.entity.dart';
import 'package:image_share_app/services/index.dart';
import 'package:state_notifier/state_notifier.dart';

final createPostController = StateNotifierProvider((ref) {
  final _roomStore = ref.watch(roomStore.state);
  final _roomController = ref.watch(roomStore);
  final _userStore = ref.watch(userStore.state);
  final _postTopController = ref.watch(postTopController);
  return CreatePostController(
    FilePickerService(),
    _roomStore,
    _userStore,
    _roomController,
    _postTopController,
    FirestoreService(),
  );
});

class CreatePostController extends StateNotifier<CreatePostState> {
  CreatePostController(
    this._filePickerService,
    this._roomStore,
    this._userStore,
    this._roomController,
    this._postTopController,
    this._firestoreService,
  ) : super(const CreatePostState());

  final FilePickerService _filePickerService;
  final RoomState _roomStore;
  final UserState _userStore;
  final RoomController _roomController;
  final PostTopController _postTopController;
  final FirestoreService _firestoreService;

  Future<void> createPost(GlobalKey<ScaffoldState> key) async {
    state = state.copyWith(isLoading: true);
    try {
      await _firestoreService.createPost(state, _roomStore.id, _userStore.uid);
      state = state.copyWith(isLoading: false, error: null);

      if (state.error == null) {
        _refresh();
        _postTopController.getPosts();
        Navigator.of(key.currentContext).pop();
      }
    } catch (error) {
      log(error.toString());
      state = state.copyWith(isLoading: false, error: error.toString());
    }
  }

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

  void setTitle(String title) {
    state = state.copyWith(title: title);
  }

  void switchInputTagMode() {
    state = state.copyWith(isInputTag: !state.isInputTag);
  }

  void _refresh() {
    state = const CreatePostState();
  }
}
