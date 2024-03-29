import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
part 'create_post_state.freezed.dart';

@freezed
abstract class CreatePostState with _$CreatePostState {
  const factory CreatePostState({
    @Default(false) bool isLoading,
    String error,
    List<File> pickedFiles,
    @Default('') String title,
    @Default('') String memo,
    @Default([]) List<String> tags,
    @Default(false) bool isInputTag,
  }) = _CreatePostState;
}
