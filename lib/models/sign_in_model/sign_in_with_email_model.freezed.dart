// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'sign_in_with_email_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$SignInWithEmailStateTearOff {
  const _$SignInWithEmailStateTearOff();

// ignore: unused_element
  _SignInWithEmailState call() {
    return const _SignInWithEmailState();
  }

// ignore: unused_element
  Loading loading() {
    return const Loading();
  }

// ignore: unused_element
  Success success({UserEntity user = const UserEntity(email: '', uid: '')}) {
    return Success(
      user: user,
    );
  }

// ignore: unused_element
  ErrorDetails error({String message = ''}) {
    return ErrorDetails(
      message: message,
    );
  }
}

// ignore: unused_element
const $SignInWithEmailState = _$SignInWithEmailStateTearOff();

mixin _$SignInWithEmailState {
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(), {
    @required Result loading(),
    @required Result success(UserEntity user),
    @required Result error(String message),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(), {
    Result loading(),
    Result success(UserEntity user),
    Result error(String message),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(_SignInWithEmailState value), {
    @required Result loading(Loading value),
    @required Result success(Success value),
    @required Result error(ErrorDetails value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(_SignInWithEmailState value), {
    Result loading(Loading value),
    Result success(Success value),
    Result error(ErrorDetails value),
    @required Result orElse(),
  });
}

abstract class $SignInWithEmailStateCopyWith<$Res> {
  factory $SignInWithEmailStateCopyWith(SignInWithEmailState value,
          $Res Function(SignInWithEmailState) then) =
      _$SignInWithEmailStateCopyWithImpl<$Res>;
}

class _$SignInWithEmailStateCopyWithImpl<$Res>
    implements $SignInWithEmailStateCopyWith<$Res> {
  _$SignInWithEmailStateCopyWithImpl(this._value, this._then);

  final SignInWithEmailState _value;
  // ignore: unused_field
  final $Res Function(SignInWithEmailState) _then;
}

abstract class _$SignInWithEmailStateCopyWith<$Res> {
  factory _$SignInWithEmailStateCopyWith(_SignInWithEmailState value,
          $Res Function(_SignInWithEmailState) then) =
      __$SignInWithEmailStateCopyWithImpl<$Res>;
}

class __$SignInWithEmailStateCopyWithImpl<$Res>
    extends _$SignInWithEmailStateCopyWithImpl<$Res>
    implements _$SignInWithEmailStateCopyWith<$Res> {
  __$SignInWithEmailStateCopyWithImpl(
      _SignInWithEmailState _value, $Res Function(_SignInWithEmailState) _then)
      : super(_value, (v) => _then(v as _SignInWithEmailState));

  @override
  _SignInWithEmailState get _value => super._value as _SignInWithEmailState;
}

class _$_SignInWithEmailState
    with DiagnosticableTreeMixin
    implements _SignInWithEmailState {
  const _$_SignInWithEmailState();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SignInWithEmailState()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'SignInWithEmailState'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _SignInWithEmailState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(), {
    @required Result loading(),
    @required Result success(UserEntity user),
    @required Result error(String message),
  }) {
    assert($default != null);
    assert(loading != null);
    assert(success != null);
    assert(error != null);
    return $default();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(), {
    Result loading(),
    Result success(UserEntity user),
    Result error(String message),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(_SignInWithEmailState value), {
    @required Result loading(Loading value),
    @required Result success(Success value),
    @required Result error(ErrorDetails value),
  }) {
    assert($default != null);
    assert(loading != null);
    assert(success != null);
    assert(error != null);
    return $default(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(_SignInWithEmailState value), {
    Result loading(Loading value),
    Result success(Success value),
    Result error(ErrorDetails value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _SignInWithEmailState implements SignInWithEmailState {
  const factory _SignInWithEmailState() = _$_SignInWithEmailState;
}

abstract class $LoadingCopyWith<$Res> {
  factory $LoadingCopyWith(Loading value, $Res Function(Loading) then) =
      _$LoadingCopyWithImpl<$Res>;
}

class _$LoadingCopyWithImpl<$Res>
    extends _$SignInWithEmailStateCopyWithImpl<$Res>
    implements $LoadingCopyWith<$Res> {
  _$LoadingCopyWithImpl(Loading _value, $Res Function(Loading) _then)
      : super(_value, (v) => _then(v as Loading));

  @override
  Loading get _value => super._value as Loading;
}

class _$Loading with DiagnosticableTreeMixin implements Loading {
  const _$Loading();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SignInWithEmailState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SignInWithEmailState.loading'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(), {
    @required Result loading(),
    @required Result success(UserEntity user),
    @required Result error(String message),
  }) {
    assert($default != null);
    assert(loading != null);
    assert(success != null);
    assert(error != null);
    return loading();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(), {
    Result loading(),
    Result success(UserEntity user),
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
  Result map<Result extends Object>(
    Result $default(_SignInWithEmailState value), {
    @required Result loading(Loading value),
    @required Result success(Success value),
    @required Result error(ErrorDetails value),
  }) {
    assert($default != null);
    assert(loading != null);
    assert(success != null);
    assert(error != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(_SignInWithEmailState value), {
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

abstract class Loading implements SignInWithEmailState {
  const factory Loading() = _$Loading;
}

abstract class $SuccessCopyWith<$Res> {
  factory $SuccessCopyWith(Success value, $Res Function(Success) then) =
      _$SuccessCopyWithImpl<$Res>;
  $Res call({UserEntity user});

  $UserEntityCopyWith<$Res> get user;
}

class _$SuccessCopyWithImpl<$Res>
    extends _$SignInWithEmailStateCopyWithImpl<$Res>
    implements $SuccessCopyWith<$Res> {
  _$SuccessCopyWithImpl(Success _value, $Res Function(Success) _then)
      : super(_value, (v) => _then(v as Success));

  @override
  Success get _value => super._value as Success;

  @override
  $Res call({
    Object user = freezed,
  }) {
    return _then(Success(
      user: user == freezed ? _value.user : user as UserEntity,
    ));
  }

  @override
  $UserEntityCopyWith<$Res> get user {
    if (_value.user == null) {
      return null;
    }
    return $UserEntityCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

class _$Success with DiagnosticableTreeMixin implements Success {
  const _$Success({this.user = const UserEntity(email: '', uid: '')})
      : assert(user != null);

  @JsonKey(defaultValue: const UserEntity(email: '', uid: ''))
  @override
  final UserEntity user;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SignInWithEmailState.success(user: $user)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SignInWithEmailState.success'))
      ..add(DiagnosticsProperty('user', user));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Success &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(user);

  @override
  $SuccessCopyWith<Success> get copyWith =>
      _$SuccessCopyWithImpl<Success>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(), {
    @required Result loading(),
    @required Result success(UserEntity user),
    @required Result error(String message),
  }) {
    assert($default != null);
    assert(loading != null);
    assert(success != null);
    assert(error != null);
    return success(user);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(), {
    Result loading(),
    Result success(UserEntity user),
    Result error(String message),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (success != null) {
      return success(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(_SignInWithEmailState value), {
    @required Result loading(Loading value),
    @required Result success(Success value),
    @required Result error(ErrorDetails value),
  }) {
    assert($default != null);
    assert(loading != null);
    assert(success != null);
    assert(error != null);
    return success(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(_SignInWithEmailState value), {
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

abstract class Success implements SignInWithEmailState {
  const factory Success({UserEntity user}) = _$Success;

  UserEntity get user;
  $SuccessCopyWith<Success> get copyWith;
}

abstract class $ErrorDetailsCopyWith<$Res> {
  factory $ErrorDetailsCopyWith(
          ErrorDetails value, $Res Function(ErrorDetails) then) =
      _$ErrorDetailsCopyWithImpl<$Res>;
  $Res call({String message});
}

class _$ErrorDetailsCopyWithImpl<$Res>
    extends _$SignInWithEmailStateCopyWithImpl<$Res>
    implements $ErrorDetailsCopyWith<$Res> {
  _$ErrorDetailsCopyWithImpl(
      ErrorDetails _value, $Res Function(ErrorDetails) _then)
      : super(_value, (v) => _then(v as ErrorDetails));

  @override
  ErrorDetails get _value => super._value as ErrorDetails;

  @override
  $Res call({
    Object message = freezed,
  }) {
    return _then(ErrorDetails(
      message: message == freezed ? _value.message : message as String,
    ));
  }
}

class _$ErrorDetails with DiagnosticableTreeMixin implements ErrorDetails {
  const _$ErrorDetails({this.message = ''}) : assert(message != null);

  @JsonKey(defaultValue: '')
  @override
  final String message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SignInWithEmailState.error(message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SignInWithEmailState.error'))
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
  $ErrorDetailsCopyWith<ErrorDetails> get copyWith =>
      _$ErrorDetailsCopyWithImpl<ErrorDetails>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(), {
    @required Result loading(),
    @required Result success(UserEntity user),
    @required Result error(String message),
  }) {
    assert($default != null);
    assert(loading != null);
    assert(success != null);
    assert(error != null);
    return error(message);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(), {
    Result loading(),
    Result success(UserEntity user),
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
  Result map<Result extends Object>(
    Result $default(_SignInWithEmailState value), {
    @required Result loading(Loading value),
    @required Result success(Success value),
    @required Result error(ErrorDetails value),
  }) {
    assert($default != null);
    assert(loading != null);
    assert(success != null);
    assert(error != null);
    return error(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(_SignInWithEmailState value), {
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

abstract class ErrorDetails implements SignInWithEmailState {
  const factory ErrorDetails({String message}) = _$ErrorDetails;

  String get message;
  $ErrorDetailsCopyWith<ErrorDetails> get copyWith;
}
