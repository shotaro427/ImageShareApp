import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_share_app/model/controllers/post_top_controller/post_top_state.dart';
import 'package:image_share_app/model/entities/room.entity.dart';
import 'package:image_share_app/services/index.dart';
import 'package:state_notifier/state_notifier.dart';

final postTopController = StateNotifierProvider((ref) {
  final _roomStore = ref.watch(roomStore.state);
  return PostTopController(
    FirestoreService(),
    _roomStore,
  );
});

class PostTopController extends StateNotifier<PostTopState> {
  PostTopController(this._firestoreService, this._roomStore)
      : super(const PostTopState()) {
    getPosts();
  }

  final FirestoreService _firestoreService;
  final RoomState _roomStore;

  Future<void> getPosts() async {
    state = state.copyWith(isLoading: true);

    try {
      // TODO: get posts
      final posts = await _firestoreService.getPosts(_roomStore.id);
      state = state.copyWith(isLoading: false, error: null, posts: posts);
    } catch (error) {
      log(error.toString());
      state = state.copyWith(isLoading: false, error: error.toString());
    }
  }
}
