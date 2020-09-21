import 'package:freezed_annotation/freezed_annotation.dart';
part 'mail_signin_state.freezed.dart';
part 'mail_signin_state.g.dart';

@freezed
abstract class MailSigninState with _$MailSigninState {
  const factory MailSigninState({
    @Default(false) bool isLoadin,
    String error,
  }) = _MailSigninState;

  factory MailSigninState.fromJson(Map<String, dynamic> json) =>
      _$MailSigninStateFromJson(json);
}
