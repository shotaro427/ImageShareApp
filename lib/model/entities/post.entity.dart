import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'post.entity.freezed.dart';
part 'post.entity.g.dart';

final postStore = StateNotifierProvider((ref) => PostController());

@freezed
abstract class PostState with _$PostState {
  const factory PostState({
    int createdAt,
    int updateAt,
    @Default('') String id,
    @Default('') String title,
    @Default('') String description,
    @Default([]) List<String> tags,
    @Default('') String createUserId,
    @Default('') String thumbnailUrl,
    @Default({}) Map<String, bool> bigramMap,
  }) = _PostState;

  factory PostState.fromJson(Map<String, dynamic> json) =>
      _$PostStateFromJson(json);
}

class PostController extends StateNotifier<PostState> {
  PostController() : super(const PostState());

  void updatePost(PostState post) {
    state = post;
  }
}
