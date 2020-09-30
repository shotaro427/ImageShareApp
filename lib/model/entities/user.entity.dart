import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_share_app/services/index.dart';
import 'package:state_notifier/state_notifier.dart';
part 'user.entity.freezed.dart';
part 'user.entity.g.dart';

final userStore =
    StateNotifierProvider((ref) => UserController(FirestoreService()));

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
  UserController(this.firestoreService) : super(const UserState());

  final FirestoreService firestoreService;

  Future<void> updateUser(UserState user) async {
    // ユーザー情報を更新
    await firestoreService.saveUserInfo(user);
    state = user;
  }

  void updateState(UserState user) {
    state = user;
  }
}
