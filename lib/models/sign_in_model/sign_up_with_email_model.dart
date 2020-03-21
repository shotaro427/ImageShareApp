
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_share_app/Entities/user_entity/user_entity.dart';
import 'package:image_share_app/repositories/room_list_repository/joined_room_list_repository.dart';
import 'package:image_share_app/repositories/sign_in_repositories/sign_up_with_email_repository.dart';
import 'package:image_share_app/widgets/room_list/room_list.dart';
import 'package:state_notifier/state_notifier.dart';
part 'sign_up_with_email_model.freezed.dart';

@freezed
abstract class SignUpWithEmailState with _$SignUpWithEmailState {
  const factory SignUpWithEmailState() = _SignUpWithEmailState;
  const factory SignUpWithEmailState.loading() = Loading;
  const factory SignUpWithEmailState.success({@Default(UserEntity(email: '', uid: '')) UserEntity user}) = Success;
  const factory SignUpWithEmailState.error({@Default('') String message}) = ErrorDetails;
}

class SignUpWithEmailStateNotifier extends StateNotifier<SignUpWithEmailState> {

  final SignUpWithEmailRepository _repository;

  SignUpWithEmailStateNotifier(this._repository): super(const SignUpWithEmailState());

  Future<void> signUp(String email, String password) async {
    state = const SignUpWithEmailState.loading();

    try {
      final UserEntity _user = await _repository.signUpWithEmail(email, password);
      state = SignUpWithEmailState.success(user: _user);
      return;
    } catch(e) {
      state = SignUpWithEmailState.error(message: e.toString());
      return;
    }
  }

  void transitionRoomListPage(UserEntity user, BuildContext context) {
    if (user == null) return;

    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
            builder: (BuildContext context) =>
                RoomListPage(RoomListRepository())
        ),
        ModalRoute.withName('/home')
    );
  }
}
