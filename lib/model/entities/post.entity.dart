import 'package:freezed_annotation/freezed_annotation.dart';
part 'post.entity.freezed.dart';
part 'post.entity.g.dart';

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
