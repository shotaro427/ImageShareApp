// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'room_settings_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$RoomSettingsStateTearOff {
  const _$RoomSettingsStateTearOff();

// ignore: unused_element
  _RoomSettingsState call() {
    return const _RoomSettingsState();
  }

// ignore: unused_element
  Loading loading() {
    return const Loading();
  }

// ignore: unused_element
  Success success(
      {@required UserEntity myProfile,
      @required List<UserEntity> roomMembers}) {
    return Success(
      myProfile: myProfile,
      roomMembers: roomMembers,
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
const $RoomSettingsState = _$RoomSettingsStateTearOff();

mixin _$RoomSettingsState {
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(), {
    @required Result loading(),
    @required
        Result success(UserEntity myProfile, List<UserEntity> roomMembers),
    @required Result error(String message),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(), {
    Result loading(),
    Result success(UserEntity myProfile, List<UserEntity> roomMembers),
    Result error(String message),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(_RoomSettingsState value), {
    @required Result loading(Loading value),
    @required Result success(Success value),
    @required Result error(ErrorDetails value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(_RoomSettingsState value), {
    Result loading(Loading value),
    Result success(Success value),
    Result error(ErrorDetails value),
    @required Result orElse(),
  });
}

abstract class $RoomSettingsStateCopyWith<$Res> {
  factory $RoomSettingsStateCopyWith(
          RoomSettingsState value, $Res Function(RoomSettingsState) then) =
      _$RoomSettingsStateCopyWithImpl<$Res>;
}

class _$RoomSettingsStateCopyWithImpl<$Res>
    implements $RoomSettingsStateCopyWith<$Res> {
  _$RoomSettingsStateCopyWithImpl(this._value, this._then);

  final RoomSettingsState _value;
  // ignore: unused_field
  final $Res Function(RoomSettingsState) _then;
}

abstract class _$RoomSettingsStateCopyWith<$Res> {
  factory _$RoomSettingsStateCopyWith(
          _RoomSettingsState value, $Res Function(_RoomSettingsState) then) =
      __$RoomSettingsStateCopyWithImpl<$Res>;
}

class __$RoomSettingsStateCopyWithImpl<$Res>
    extends _$RoomSettingsStateCopyWithImpl<$Res>
    implements _$RoomSettingsStateCopyWith<$Res> {
  __$RoomSettingsStateCopyWithImpl(
      _RoomSettingsState _value, $Res Function(_RoomSettingsState) _then)
      : super(_value, (v) => _then(v as _RoomSettingsState));

  @override
  _RoomSettingsState get _value => super._value as _RoomSettingsState;
}

class _$_RoomSettingsState
    with DiagnosticableTreeMixin
    implements _RoomSettingsState {
  const _$_RoomSettingsState();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RoomSettingsState()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'RoomSettingsState'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _RoomSettingsState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(), {
    @required Result loading(),
    @required
        Result success(UserEntity myProfile, List<UserEntity> roomMembers),
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
    Result success(UserEntity myProfile, List<UserEntity> roomMembers),
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
    Result $default(_RoomSettingsState value), {
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
    Result $default(_RoomSettingsState value), {
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

abstract class _RoomSettingsState implements RoomSettingsState {
  const factory _RoomSettingsState() = _$_RoomSettingsState;
}

abstract class $LoadingCopyWith<$Res> {
  factory $LoadingCopyWith(Loading value, $Res Function(Loading) then) =
      _$LoadingCopyWithImpl<$Res>;
}

class _$LoadingCopyWithImpl<$Res> extends _$RoomSettingsStateCopyWithImpl<$Res>
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
    return 'RoomSettingsState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'RoomSettingsState.loading'));
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
    @required
        Result success(UserEntity myProfile, List<UserEntity> roomMembers),
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
    Result success(UserEntity myProfile, List<UserEntity> roomMembers),
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
    Result $default(_RoomSettingsState value), {
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
    Result $default(_RoomSettingsState value), {
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

abstract class Loading implements RoomSettingsState {
  const factory Loading() = _$Loading;
}

abstract class $SuccessCopyWith<$Res> {
  factory $SuccessCopyWith(Success value, $Res Function(Success) then) =
      _$SuccessCopyWithImpl<$Res>;
  $Res call({UserEntity myProfile, List<UserEntity> roomMembers});

  $UserEntityCopyWith<$Res> get myProfile;
}

class _$SuccessCopyWithImpl<$Res> extends _$RoomSettingsStateCopyWithImpl<$Res>
    implements $SuccessCopyWith<$Res> {
  _$SuccessCopyWithImpl(Success _value, $Res Function(Success) _then)
      : super(_value, (v) => _then(v as Success));

  @override
  Success get _value => super._value as Success;

  @override
  $Res call({
    Object myProfile = freezed,
    Object roomMembers = freezed,
  }) {
    return _then(Success(
      myProfile:
          myProfile == freezed ? _value.myProfile : myProfile as UserEntity,
      roomMembers: roomMembers == freezed
          ? _value.roomMembers
          : roomMembers as List<UserEntity>,
    ));
  }

  @override
  $UserEntityCopyWith<$Res> get myProfile {
    if (_value.myProfile == null) {
      return null;
    }
    return $UserEntityCopyWith<$Res>(_value.myProfile, (value) {
      return _then(_value.copyWith(myProfile: value));
    });
  }
}

class _$Success with DiagnosticableTreeMixin implements Success {
  const _$Success({@required this.myProfile, @required this.roomMembers})
      : assert(myProfile != null),
        assert(roomMembers != null);

  @override
  final UserEntity myProfile;
  @override
  final List<UserEntity> roomMembers;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RoomSettingsState.success(myProfile: $myProfile, roomMembers: $roomMembers)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RoomSettingsState.success'))
      ..add(DiagnosticsProperty('myProfile', myProfile))
      ..add(DiagnosticsProperty('roomMembers', roomMembers));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Success &&
            (identical(other.myProfile, myProfile) ||
                const DeepCollectionEquality()
                    .equals(other.myProfile, myProfile)) &&
            (identical(other.roomMembers, roomMembers) ||
                const DeepCollectionEquality()
                    .equals(other.roomMembers, roomMembers)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(myProfile) ^
      const DeepCollectionEquality().hash(roomMembers);

  @override
  $SuccessCopyWith<Success> get copyWith =>
      _$SuccessCopyWithImpl<Success>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(), {
    @required Result loading(),
    @required
        Result success(UserEntity myProfile, List<UserEntity> roomMembers),
    @required Result error(String message),
  }) {
    assert($default != null);
    assert(loading != null);
    assert(success != null);
    assert(error != null);
    return success(myProfile, roomMembers);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(), {
    Result loading(),
    Result success(UserEntity myProfile, List<UserEntity> roomMembers),
    Result error(String message),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (success != null) {
      return success(myProfile, roomMembers);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(_RoomSettingsState value), {
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
    Result $default(_RoomSettingsState value), {
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

abstract class Success implements RoomSettingsState {
  const factory Success(
      {@required UserEntity myProfile,
      @required List<UserEntity> roomMembers}) = _$Success;

  UserEntity get myProfile;
  List<UserEntity> get roomMembers;
  $SuccessCopyWith<Success> get copyWith;
}

abstract class $ErrorDetailsCopyWith<$Res> {
  factory $ErrorDetailsCopyWith(
          ErrorDetails value, $Res Function(ErrorDetails) then) =
      _$ErrorDetailsCopyWithImpl<$Res>;
  $Res call({String message});
}

class _$ErrorDetailsCopyWithImpl<$Res>
    extends _$RoomSettingsStateCopyWithImpl<$Res>
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
    return 'RoomSettingsState.error(message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RoomSettingsState.error'))
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
    @required
        Result success(UserEntity myProfile, List<UserEntity> roomMembers),
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
    Result success(UserEntity myProfile, List<UserEntity> roomMembers),
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
    Result $default(_RoomSettingsState value), {
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
    Result $default(_RoomSettingsState value), {
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

abstract class ErrorDetails implements RoomSettingsState {
  const factory ErrorDetails({String message}) = _$ErrorDetails;

  String get message;
  $ErrorDetailsCopyWith<ErrorDetails> get copyWith;
}
