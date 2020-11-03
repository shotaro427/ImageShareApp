import 'package:freezed_annotation/freezed_annotation.dart';
part 'member_invite_state.freezed.dart';
part 'member_invite_state.g.dart';

@freezed
abstract class MemberInviteState with _$MemberInviteState {
  const factory MemberInviteState({
    String error,
    @Default(false) bool isLoading,
  }) = _MemberInviteState;

  factory MemberInviteState.fromJson(Map<String, dynamic> json) =>
      _$MemberInviteStateFromJson(json);
}
