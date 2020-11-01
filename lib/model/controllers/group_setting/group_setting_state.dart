import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_share_app/model/entities/user.entity.dart';
part 'group_setting_state.freezed.dart';
part 'group_setting_state.g.dart';

@freezed
abstract class GroupSettingState with _$GroupSettingState {
  const factory GroupSettingState({
    String error,
    @Default(false) bool isLoading,
    @Default([]) List<UserState> member,
    @Default([]) List<UserState> invited,
  }) = _GroupSettingState;

  factory GroupSettingState.fromJson(Map<String, dynamic> json) =>
      _$GroupSettingStateFromJson(json);
}
