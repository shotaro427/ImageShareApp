import 'package:freezed_annotation/freezed_annotation.dart';
part 'post_top_state.freezed.dart';
part 'post_top_state.g.dart';

@freezed
abstract class PostTopState with _$PostTopState {
  const factory PostTopState({
    @Default(false) bool isLoading,
    String error,
  }) = _PostTopState;

  factory PostTopState.fromJson(Map<String, dynamic> json) =>
      _$PostTopStateFromJson(json);
}
