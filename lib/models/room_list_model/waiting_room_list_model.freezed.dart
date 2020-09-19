// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'waiting_room_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$WaitingRoomListStateTearOff {
  const _$WaitingRoomListStateTearOff();

// ignore: unused_element
  _WaitingRoomListState call() {
    return const _WaitingRoomListState();
  }

// ignore: unused_element
  Loading loading() {
    return const Loading();
  }

// ignore: unused_element
  Success success({@required List<RoomInfoEntity> rooms}) {
    return Success(
      rooms: rooms,
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
const $WaitingRoomListState = _$WaitingRoomListStateTearOff();

mixin _$WaitingRoomListState {
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(), {
    @required Result loading(),
    @required Result success(List<RoomInfoEntity> rooms),
    @required Result error(String message),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(), {
    Result loading(),
    Result success(List<RoomInfoEntity> rooms),
    Result error(String message),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(_WaitingRoomListState value), {
    @required Result loading(Loading value),
    @required Result success(Success value),
    @required Result error(ErrorDetails value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(_WaitingRoomListState value), {
    Result loading(Loading value),
    Result success(Success value),
    Result error(ErrorDetails value),
    @required Result orElse(),
  });
}

abstract class $WaitingRoomListStateCopyWith<$Res> {
  factory $WaitingRoomListStateCopyWith(WaitingRoomListState value,
          $Res Function(WaitingRoomListState) then) =
      _$WaitingRoomListStateCopyWithImpl<$Res>;
}

class _$WaitingRoomListStateCopyWithImpl<$Res>
    implements $WaitingRoomListStateCopyWith<$Res> {
  _$WaitingRoomListStateCopyWithImpl(this._value, this._then);

  final WaitingRoomListState _value;
  // ignore: unused_field
  final $Res Function(WaitingRoomListState) _then;
}

abstract class _$WaitingRoomListStateCopyWith<$Res> {
  factory _$WaitingRoomListStateCopyWith(_WaitingRoomListState value,
          $Res Function(_WaitingRoomListState) then) =
      __$WaitingRoomListStateCopyWithImpl<$Res>;
}

class __$WaitingRoomListStateCopyWithImpl<$Res>
    extends _$WaitingRoomListStateCopyWithImpl<$Res>
    implements _$WaitingRoomListStateCopyWith<$Res> {
  __$WaitingRoomListStateCopyWithImpl(
      _WaitingRoomListState _value, $Res Function(_WaitingRoomListState) _then)
      : super(_value, (v) => _then(v as _WaitingRoomListState));

  @override
  _WaitingRoomListState get _value => super._value as _WaitingRoomListState;
}

class _$_WaitingRoomListState
    with DiagnosticableTreeMixin
    implements _WaitingRoomListState {
  const _$_WaitingRoomListState();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WaitingRoomListState()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'WaitingRoomListState'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _WaitingRoomListState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(), {
    @required Result loading(),
    @required Result success(List<RoomInfoEntity> rooms),
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
    Result success(List<RoomInfoEntity> rooms),
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
    Result $default(_WaitingRoomListState value), {
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
    Result $default(_WaitingRoomListState value), {
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

abstract class _WaitingRoomListState implements WaitingRoomListState {
  const factory _WaitingRoomListState() = _$_WaitingRoomListState;
}

abstract class $LoadingCopyWith<$Res> {
  factory $LoadingCopyWith(Loading value, $Res Function(Loading) then) =
      _$LoadingCopyWithImpl<$Res>;
}

class _$LoadingCopyWithImpl<$Res>
    extends _$WaitingRoomListStateCopyWithImpl<$Res>
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
    return 'WaitingRoomListState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'WaitingRoomListState.loading'));
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
    @required Result success(List<RoomInfoEntity> rooms),
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
    Result success(List<RoomInfoEntity> rooms),
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
    Result $default(_WaitingRoomListState value), {
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
    Result $default(_WaitingRoomListState value), {
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

abstract class Loading implements WaitingRoomListState {
  const factory Loading() = _$Loading;
}

abstract class $SuccessCopyWith<$Res> {
  factory $SuccessCopyWith(Success value, $Res Function(Success) then) =
      _$SuccessCopyWithImpl<$Res>;
  $Res call({List<RoomInfoEntity> rooms});
}

class _$SuccessCopyWithImpl<$Res>
    extends _$WaitingRoomListStateCopyWithImpl<$Res>
    implements $SuccessCopyWith<$Res> {
  _$SuccessCopyWithImpl(Success _value, $Res Function(Success) _then)
      : super(_value, (v) => _then(v as Success));

  @override
  Success get _value => super._value as Success;

  @override
  $Res call({
    Object rooms = freezed,
  }) {
    return _then(Success(
      rooms: rooms == freezed ? _value.rooms : rooms as List<RoomInfoEntity>,
    ));
  }
}

class _$Success with DiagnosticableTreeMixin implements Success {
  const _$Success({@required this.rooms}) : assert(rooms != null);

  @override
  final List<RoomInfoEntity> rooms;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WaitingRoomListState.success(rooms: $rooms)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'WaitingRoomListState.success'))
      ..add(DiagnosticsProperty('rooms', rooms));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Success &&
            (identical(other.rooms, rooms) ||
                const DeepCollectionEquality().equals(other.rooms, rooms)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(rooms);

  @override
  $SuccessCopyWith<Success> get copyWith =>
      _$SuccessCopyWithImpl<Success>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(), {
    @required Result loading(),
    @required Result success(List<RoomInfoEntity> rooms),
    @required Result error(String message),
  }) {
    assert($default != null);
    assert(loading != null);
    assert(success != null);
    assert(error != null);
    return success(rooms);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(), {
    Result loading(),
    Result success(List<RoomInfoEntity> rooms),
    Result error(String message),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (success != null) {
      return success(rooms);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(_WaitingRoomListState value), {
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
    Result $default(_WaitingRoomListState value), {
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

abstract class Success implements WaitingRoomListState {
  const factory Success({@required List<RoomInfoEntity> rooms}) = _$Success;

  List<RoomInfoEntity> get rooms;
  $SuccessCopyWith<Success> get copyWith;
}

abstract class $ErrorDetailsCopyWith<$Res> {
  factory $ErrorDetailsCopyWith(
          ErrorDetails value, $Res Function(ErrorDetails) then) =
      _$ErrorDetailsCopyWithImpl<$Res>;
  $Res call({String message});
}

class _$ErrorDetailsCopyWithImpl<$Res>
    extends _$WaitingRoomListStateCopyWithImpl<$Res>
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
    return 'WaitingRoomListState.error(message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'WaitingRoomListState.error'))
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
    @required Result success(List<RoomInfoEntity> rooms),
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
    Result success(List<RoomInfoEntity> rooms),
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
    Result $default(_WaitingRoomListState value), {
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
    Result $default(_WaitingRoomListState value), {
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

abstract class ErrorDetails implements WaitingRoomListState {
  const factory ErrorDetails({String message}) = _$ErrorDetails;

  String get message;
  $ErrorDetailsCopyWith<ErrorDetails> get copyWith;
}
