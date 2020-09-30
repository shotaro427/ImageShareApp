// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'create_room_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$CreateRoomStateTearOff {
  const _$CreateRoomStateTearOff();

// ignore: unused_element
  _CreateRoomState call({bool isLoading = false, String error}) {
    return _CreateRoomState(
      isLoading: isLoading,
      error: error,
    );
  }
}

// ignore: unused_element
const $CreateRoomState = _$CreateRoomStateTearOff();

mixin _$CreateRoomState {
  bool get isLoading;
  String get error;

  $CreateRoomStateCopyWith<CreateRoomState> get copyWith;
}

abstract class $CreateRoomStateCopyWith<$Res> {
  factory $CreateRoomStateCopyWith(
          CreateRoomState value, $Res Function(CreateRoomState) then) =
      _$CreateRoomStateCopyWithImpl<$Res>;
  $Res call({bool isLoading, String error});
}

class _$CreateRoomStateCopyWithImpl<$Res>
    implements $CreateRoomStateCopyWith<$Res> {
  _$CreateRoomStateCopyWithImpl(this._value, this._then);

  final CreateRoomState _value;
  // ignore: unused_field
  final $Res Function(CreateRoomState) _then;

  @override
  $Res call({
    Object isLoading = freezed,
    Object error = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed ? _value.isLoading : isLoading as bool,
      error: error == freezed ? _value.error : error as String,
    ));
  }
}

abstract class _$CreateRoomStateCopyWith<$Res>
    implements $CreateRoomStateCopyWith<$Res> {
  factory _$CreateRoomStateCopyWith(
          _CreateRoomState value, $Res Function(_CreateRoomState) then) =
      __$CreateRoomStateCopyWithImpl<$Res>;
  @override
  $Res call({bool isLoading, String error});
}

class __$CreateRoomStateCopyWithImpl<$Res>
    extends _$CreateRoomStateCopyWithImpl<$Res>
    implements _$CreateRoomStateCopyWith<$Res> {
  __$CreateRoomStateCopyWithImpl(
      _CreateRoomState _value, $Res Function(_CreateRoomState) _then)
      : super(_value, (v) => _then(v as _CreateRoomState));

  @override
  _CreateRoomState get _value => super._value as _CreateRoomState;

  @override
  $Res call({
    Object isLoading = freezed,
    Object error = freezed,
  }) {
    return _then(_CreateRoomState(
      isLoading: isLoading == freezed ? _value.isLoading : isLoading as bool,
      error: error == freezed ? _value.error : error as String,
    ));
  }
}

class _$_CreateRoomState implements _CreateRoomState {
  const _$_CreateRoomState({this.isLoading = false, this.error})
      : assert(isLoading != null);

  @JsonKey(defaultValue: false)
  @override
  final bool isLoading;
  @override
  final String error;

  @override
  String toString() {
    return 'CreateRoomState(isLoading: $isLoading, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CreateRoomState &&
            (identical(other.isLoading, isLoading) ||
                const DeepCollectionEquality()
                    .equals(other.isLoading, isLoading)) &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isLoading) ^
      const DeepCollectionEquality().hash(error);

  @override
  _$CreateRoomStateCopyWith<_CreateRoomState> get copyWith =>
      __$CreateRoomStateCopyWithImpl<_CreateRoomState>(this, _$identity);
}

abstract class _CreateRoomState implements CreateRoomState {
  const factory _CreateRoomState({bool isLoading, String error}) =
      _$_CreateRoomState;

  @override
  bool get isLoading;
  @override
  String get error;
  @override
  _$CreateRoomStateCopyWith<_CreateRoomState> get copyWith;
}
