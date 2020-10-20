import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
part 'create_post_state.freezed.dart';

@freezed
abstract class CreatePostState with _$CreatePostState {
  const factory CreatePostState({
    @Default(false) bool isLoading,
    String error,
    File pickedFile,
    @Default('') String title,
    @Default('') String memo,
    @Default([]) List<String> tags,
  }) = _CreatePostState;
}
