// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'room_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$JoinedRoomListState {
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(), {
    @required Result loading(),
    @required Result success(@required List<RoomInfoEntity> rooms),
    @required Result error(String message),
  });

  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(), {
    Result loading(),
    Result success(@required List<RoomInfoEntity> rooms),
    Result error(String message),
    @required Result orElse(),
  });

  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(_JoinedRoomListState value), {
    @required Result loading(Loading value),
    @required Result success(Success value),
    @required Result error(ErrorDetails value),
  });

  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(_JoinedRoomListState value), {
    Result loading(Loading value),
    Result success(Success value),
    Result error(ErrorDetails value),
    @required Result orElse(),
  });
}

class _$JoinedRoomListStateTearOff {
  const _$JoinedRoomListStateTearOff();

  _JoinedRoomListState call() {
    return const _JoinedRoomListState();
  }

  Loading loading() {
    return const Loading();
  }

  Success success({@required List<RoomInfoEntity> rooms}) {
    return Success(
      rooms: rooms,
    );
  }

  ErrorDetails error({String message = ''}) {
    return ErrorDetails(
      message: message,
    );
  }
}

const $JoinedRoomListState = _$JoinedRoomListStateTearOff();

class _$_JoinedRoomListState
    with DiagnosticableTreeMixin
    implements _JoinedRoomListState {
  const _$_JoinedRoomListState();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'JoinedRoomListState()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'JoinedRoomListState'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _JoinedRoomListState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(), {
    @required Result loading(),
    @required Result success(@required List<RoomInfoEntity> rooms),
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
    Result success(@required List<RoomInfoEntity> rooms),
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
    Result $default(_JoinedRoomListState value), {
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
    Result $default(_JoinedRoomListState value), {
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

abstract class _JoinedRoomListState implements JoinedRoomListState {
  const factory _JoinedRoomListState() = _$_JoinedRoomListState;
}

class _$Loading with DiagnosticableTreeMixin implements Loading {
  const _$Loading();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'JoinedRoomListState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'JoinedRoomListState.loading'));
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
    @required Result success(@required List<RoomInfoEntity> rooms),
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
    Result success(@required List<RoomInfoEntity> rooms),
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
    Result $default(_JoinedRoomListState value), {
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
    Result $default(_JoinedRoomListState value), {
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

abstract class Loading implements JoinedRoomListState {
  const factory Loading() = _$Loading;
}

class _$Success with DiagnosticableTreeMixin implements Success {
  const _$Success({@required this.rooms}) : assert(rooms != null);

  @override
  final List<RoomInfoEntity> rooms;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'JoinedRoomListState.success(rooms: $rooms)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'JoinedRoomListState.success'))
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
  _$Success copyWith({
    Object rooms = freezed,
  }) {
    return _$Success(
      rooms: rooms == freezed ? this.rooms : rooms as List<RoomInfoEntity>,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(), {
    @required Result loading(),
    @required Result success(@required List<RoomInfoEntity> rooms),
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
    Result success(@required List<RoomInfoEntity> rooms),
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
    Result $default(_JoinedRoomListState value), {
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
    Result $default(_JoinedRoomListState value), {
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

abstract class Success implements JoinedRoomListState {
  const factory Success({@required List<RoomInfoEntity> rooms}) = _$Success;

  List<RoomInfoEntity> get rooms;

  Success copyWith({List<RoomInfoEntity> rooms});
}

class _$ErrorDetails with DiagnosticableTreeMixin implements ErrorDetails {
  const _$ErrorDetails({this.message = ''});

  @JsonKey(defaultValue: '')
  @override
  final String message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'JoinedRoomListState.error(message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'JoinedRoomListState.error'))
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
  Result when<Result extends Object>(
    Result $default(), {
    @required Result loading(),
    @required Result success(@required List<RoomInfoEntity> rooms),
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
    Result success(@required List<RoomInfoEntity> rooms),
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
    Result $default(_JoinedRoomListState value), {
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
    Result $default(_JoinedRoomListState value), {
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

abstract class ErrorDetails implements JoinedRoomListState {
  const factory ErrorDetails({String message}) = _$ErrorDetails;

  String get message;

  ErrorDetails copyWith({String message});
}
