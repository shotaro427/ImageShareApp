import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_share_app/model/entities/post.entity.dart';
part 'post_top_state.freezed.dart';
part 'post_top_state.g.dart';

@freezed
abstract class PostTopState with _$PostTopState {
  const factory PostTopState({
    @Default(false) bool isLoading,
    String error,
    List<PostState> posts,
    bool canPost,
  }) = _PostTopState;

  factory PostTopState.fromJson(Map<String, dynamic> json) =>
      _$PostTopStateFromJson(json);
}
