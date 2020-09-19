import 'package:freezed_annotation/freezed_annotation.dart';
part 'app_start_state.freezed.dart';

@freezed
abstract class AppStartState with _$AppStartState {
  const factory AppStartState({
    @Default(false) bool isLoading,
  }) = _AppStartState;
}
