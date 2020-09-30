import 'package:freezed_annotation/freezed_annotation.dart';
part 'mail_signup_state.freezed.dart';
part 'mail_signup_state.g.dart';

@freezed
abstract class MailSignupState with _$MailSignupState {
  const factory MailSignupState({
    @Default(false) bool isLoading,
    String error,
  }) = _MailSignupState;

  factory MailSignupState.fromJson(Map<String, dynamic> json) =>
      _$MailSignupStateFromJson(json);
}
