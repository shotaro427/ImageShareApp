// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'sign_in_page_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$SignInState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result loading(),
    @required Result success(bool isCompleted),
    @required Result error(String message),
  });

  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result loading(),
    Result success(bool isCompleted),
    Result error(String message),
    @required Result orElse(),
  });

  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result loading(Loading value),
    @required Result success(Success value),
    @required Result error(ErrorDetails value),
  });

  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result loading(Loading value),
    Result success(Success value),
    Result error(ErrorDetails value),
    @required Result orElse(),
  });
}

class _$SignInStateTearOff {
  const _$SignInStateTearOff();

  Loading loading() {
    return const Loading();
  }

  Success success({bool isCompleted = false}) {
    return Success(
      isCompleted: isCompleted,
    );
  }

  ErrorDetails error({String message = ''}) {
    return ErrorDetails(
      message: message,
    );
  }
}

const $SignInState = _$SignInStateTearOff();

class _$Loading with DiagnosticableTreeMixin implements Loading {
  const _$Loading();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SignInState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'SignInState.loading'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result loading(),
    @required Result success(bool isCompleted),
    @required Result error(String message),
  }) {
    assert(loading != null);
    assert(success != null);
    assert(error != null);
    return loading();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result loading(),
    Result success(bool isCompleted),
    Result error(String message),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result loading(Loading value),
    @required Result success(Success value),
    @required Result error(ErrorDetails value),
  }) {
    assert(loading != null);
    assert(success != null);
    assert(error != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result loading(Loading value),
    Result success(Success value),
    Result error(ErrorDetails value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements SignInState {
  const factory Loading() = _$Loading;
}

class _$Success with DiagnosticableTreeMixin implements Success {
  const _$Success({this.isCompleted = false});

  @JsonKey(defaultValue: false)
  @override
  final bool isCompleted;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SignInState.success(isCompleted: $isCompleted)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SignInState.success'))
      ..add(DiagnosticsProperty('isCompleted', isCompleted));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Success &&
            (identical(other.isCompleted, isCompleted) ||
                const DeepCollectionEquality()
                    .equals(other.isCompleted, isCompleted)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(isCompleted);

  @override
  _$Success copyWith({
    Object isCompleted = freezed,
  }) {
    return _$Success(
      isCompleted:
          isCompleted == freezed ? this.isCompleted : isCompleted as bool,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result loading(),
    @required Result success(bool isCompleted),
    @required Result error(String message),
  }) {
    assert(loading != null);
    assert(success != null);
    assert(error != null);
    return success(isCompleted);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result loading(),
    Result success(bool isCompleted),
    Result error(String message),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (success != null) {
      return success(isCompleted);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result loading(Loading value),
    @required Result success(Success value),
    @required Result error(ErrorDetails value),
  }) {
    assert(loading != null);
    assert(success != null);
    assert(error != null);
    return success(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result loading(Loading value),
    Result success(Success value),
    Result error(ErrorDetails value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class Success implements SignInState {
  const factory Success({bool isCompleted}) = _$Success;

  bool get isCompleted;

  Success copyWith({bool isCompleted});
}

class _$ErrorDetails with DiagnosticableTreeMixin implements ErrorDetails {
  const _$ErrorDetails({this.message = ''});

  @JsonKey(defaultValue: '')
  @override
  final String message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SignInState.error(message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SignInState.error'))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ErrorDetails &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(message);

  @override
  _$ErrorDetails copyWith({
    Object message = freezed,
  }) {
    return _$ErrorDetails(
      message: message == freezed ? this.message : message as String,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result loading(),
    @required Result success(bool isCompleted),
    @required Result error(String message),
  }) {
    assert(loading != null);
    assert(success != null);
    assert(error != null);
    return error(message);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result loading(),
    Result success(bool isCompleted),
    Result error(String message),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result loading(Loading value),
    @required Result success(Success value),
    @required Result error(ErrorDetails value),
  }) {
    assert(loading != null);
    assert(success != null);
    assert(error != null);
    return error(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result loading(Loading value),
    Result success(Success value),
    Result error(ErrorDetails value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ErrorDetails implements SignInState {
  const factory ErrorDetails({String message}) = _$ErrorDetails;

  String get message;

  ErrorDetails copyWith({String message});
}
