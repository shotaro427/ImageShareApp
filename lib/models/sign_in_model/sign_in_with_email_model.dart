import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_share_app/Entities/user_entity/user_entity.dart';
import 'package:image_share_app/repositories/sign_in_repositories/sign_in_with_email_repository.dart';
import 'package:image_share_app/widgets/room_list/room_list.dart';
import 'package:state_notifier/state_notifier.dart';
part 'sign_in_with_email_model.freezed.dart';

@freezed
abstract class SignInWithEmailState with _$SignInWithEmailState {
  const factory SignInWithEmailState() = _SignInWithEmailState;
  const factory SignInWithEmailState.loading() = Loading;
  const factory SignInWithEmailState.success(
      {@Default(UserEntity(email: '', uid: '')) UserEntity user}) = Success;
  const factory SignInWithEmailState.error({@Default('') String message}) =
      ErrorDetails;
}

class SignInWithEmailStateNotifier extends StateNotifier<SignInWithEmailState> {
  final SignInWithEmailRepository _repository;

  SignInWithEmailStateNotifier(this._repository)
      : super(const SignInWithEmailState());

  /// メールアドレスとパスワードを使ってサインインする
  Future<void> logInWithEmail(String email, String password) async {
    state = const SignInWithEmailState.loading();

    try {
      UserEntity _user =
          await _repository.loginWithEmailAndPassword(email, password);
      state = SignInWithEmailState.success(user: _user);
      return;
    } catch (e) {
      state = SignInWithEmailState.error(message: e.toString());
      log(e.toString());
      return;
    }
  }

  /// 次のページに遷移させる
  void transitionRoomListPage(UserEntity user, BuildContext context) {
    if (user == null) return;

    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (BuildContext context) => RoomListPage()),
        (_) => false);
  }
}
