import 'package:freezed_annotation/freezed_annotation.dart';
part 'self_editing_state.freezed.dart';
part 'self_editing_state.g.dart';

@freezed
abstract class SelfEditingState with _$SelfEditingState {
  const factory SelfEditingState({
    String error,
    String validate,
    @Default(false) bool isLoading,
  }) = _SelfEditingState;

  factory SelfEditingState.fromJson(Map<String, dynamic> json) =>
      _$SelfEditingStateFromJson(json);
}
