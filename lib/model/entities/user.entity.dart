import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';
part 'user.entity.freezed.dart';
part 'user.entity.g.dart';

final userStore = StateNotifierProvider((ref) => UserController());

@freezed
abstract class UserState with _$UserState {
  const factory UserState({
    int createdAt,
    int updateAt,
    @Default('') String id,
    @Default('') String uid,
    @Default('') String name,
    @Default('') String email,
    @Default('') String iconUrl,
    @Default([]) List<String> joinedRooms,
    @Default([]) List<String> invitedRooms,
  }) = _UserState;

  factory UserState.fromJson(Map<String, dynamic> json) =>
      _$UserStateFromJson(json);
}

class UserController extends StateNotifier<UserState> {
  UserController({UserState user}) : super(const UserState());

  void update(UserState user) {
    state = user;
  }
}
