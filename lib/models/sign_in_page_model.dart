
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_share_app/Entities/user_entity/user_entity.dart';
import 'package:image_share_app/repositories/room_list_repository.dart';
import 'package:image_share_app/repositories/sign_in_repositories/sign_in_page_repository.dart';
import 'package:image_share_app/widgets/room_list/room_list.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'sign_in_page_model.freezed.dart';

@freezed
abstract class SignInState with _$SignInState {
  const factory SignInState() = _SignInState;
  const factory SignInState.loading() = Loading;
  const factory SignInState.success({@Default(false) bool isCompleted}) = Success;
  const factory SignInState.error({@Default('') String message}) = ErrorDetails;
}

class SignInStateNotifier extends StateNotifier<SignInState> {

  final SignInPageRepository _repository;
  UserEntity user;

  SignInStateNotifier(this._repository): super(const SignInState());

  /// Googleアカウントでログインするときのハンドル処理
  Future<void> handleSignIn() async {

    state = const SignInState.loading();

    try {
      final UserEntity _user = (await _repository.loginWithGoogle());

      // User情報を保存
      await _repository.saveUserInfo(_user);
      user = _user;

      // 状態を更新
      state = const SignInState.success(isCompleted: true);
    } catch (e) {
      log(e.toString());
      // 状態を更新
      state = SignInState.error(message: e.toString());
    }
  }

  /// Googleアカウントでのログインが完了したかどうかを判断して、次のページに遷移させる処理
  void transitionNextPage(BuildContext context) {
    if (user == null) return;

    Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (BuildContext context) => RoomListPage(RoomListRepository())
        )
    );
  }
}
