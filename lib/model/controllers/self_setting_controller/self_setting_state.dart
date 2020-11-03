import 'package:freezed_annotation/freezed_annotation.dart';
part 'self_setting_state.freezed.dart';
part 'self_setting_state.g.dart';

@freezed
abstract class SelfSettingState with _$SelfSettingState {
  const factory SelfSettingState({
    String error,
    @Default(false) bool isLoading,
  }) = _SelfSettingState;

  factory SelfSettingState.fromJson(Map<String, dynamic> json) =>
      _$SelfSettingStateFromJson(json);
}
