import 'package:freezed_annotation/freezed_annotation.dart';
part 'post_detail_state.freezed.dart';
part 'post_detail_state.g.dart';

@freezed
abstract class PostDetailState with _$PostDetailState {
  const factory PostDetailState({
    String error,
    @Default(false) bool isLoading,
    @Default(0) int currentIndex,
  }) = _PostDetailState;

  factory PostDetailState.fromJson(Map<String, dynamic> json) =>
      _$PostDetailStateFromJson(json);
}
