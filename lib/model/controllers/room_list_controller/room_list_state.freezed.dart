// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'room_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
RoomListState _$RoomListStateFromJson(Map<String, dynamic> json) {
  return _RoomListState.fromJson(json);
}

class _$RoomListStateTearOff {
  const _$RoomListStateTearOff();

// ignore: unused_element
  _RoomListState call(
      {bool isLoading = false, List<RoomState> rooms, String error}) {
    return _RoomListState(
      isLoading: isLoading,
      rooms: rooms,
      error: error,
    );
  }
}

// ignore: unused_element
const $RoomListState = _$RoomListStateTearOff();

mixin _$RoomListState {
  bool get isLoading;
  List<RoomState> get rooms;
  String get error;

  Map<String, dynamic> toJson();
  $RoomListStateCopyWith<RoomListState> get copyWith;
}

abstract class $RoomListStateCopyWith<$Res> {
  factory $RoomListStateCopyWith(
          RoomListState value, $Res Function(RoomListState) then) =
      _$RoomListStateCopyWithImpl<$Res>;
  $Res call({bool isLoading, List<RoomState> rooms, String error});
}

class _$RoomListStateCopyWithImpl<$Res>
    implements $RoomListStateCopyWith<$Res> {
  _$RoomListStateCopyWithImpl(this._value, this._then);

  final RoomListState _value;
  // ignore: unused_field
  final $Res Function(RoomListState) _then;

  @override
  $Res call({
    Object isLoading = freezed,
    Object rooms = freezed,
    Object error = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed ? _value.isLoading : isLoading as bool,
      rooms: rooms == freezed ? _value.rooms : rooms as List<RoomState>,
      error: error == freezed ? _value.error : error as String,
    ));
  }
}

abstract class _$RoomListStateCopyWith<$Res>
    implements $RoomListStateCopyWith<$Res> {
  factory _$RoomListStateCopyWith(
          _RoomListState value, $Res Function(_RoomListState) then) =
      __$RoomListStateCopyWithImpl<$Res>;
  @override
  $Res call({bool isLoading, List<RoomState> rooms, String error});
}

class __$RoomListStateCopyWithImpl<$Res>
    extends _$RoomListStateCopyWithImpl<$Res>
    implements _$RoomListStateCopyWith<$Res> {
  __$RoomListStateCopyWithImpl(
      _RoomListState _value, $Res Function(_RoomListState) _then)
      : super(_value, (v) => _then(v as _RoomListState));

  @override
  _RoomListState get _value => super._value as _RoomListState;

  @override
  $Res call({
    Object isLoading = freezed,
    Object rooms = freezed,
    Object error = freezed,
  }) {
    return _then(_RoomListState(
      isLoading: isLoading == freezed ? _value.isLoading : isLoading as bool,
      rooms: rooms == freezed ? _value.rooms : rooms as List<RoomState>,
      error: error == freezed ? _value.error : error as String,
    ));
  }
}

@JsonSerializable()
class _$_RoomListState implements _RoomListState {
  const _$_RoomListState({this.isLoading = false, this.rooms, this.error})
      : assert(isLoading != null);

  factory _$_RoomListState.fromJson(Map<String, dynamic> json) =>
      _$_$_RoomListStateFromJson(json);

  @JsonKey(defaultValue: false)
  @override
  final bool isLoading;
  @override
  final List<RoomState> rooms;
  @override
  final String error;

  @override
  String toString() {
    return 'RoomListState(isLoading: $isLoading, rooms: $rooms, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RoomListState &&
            (identical(other.isLoading, isLoading) ||
                const DeepCollectionEquality()
                    .equals(other.isLoading, isLoading)) &&
            (identical(other.rooms, rooms) ||
                const DeepCollectionEquality().equals(other.rooms, rooms)) &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isLoading) ^
      const DeepCollectionEquality().hash(rooms) ^
      const DeepCollectionEquality().hash(error);

  @override
  _$RoomListStateCopyWith<_RoomListState> get copyWith =>
      __$RoomListStateCopyWithImpl<_RoomListState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_RoomListStateToJson(this);
  }
}

abstract class _RoomListState implements RoomListState {
  const factory _RoomListState(
      {bool isLoading, List<RoomState> rooms, String error}) = _$_RoomListState;

  factory _RoomListState.fromJson(Map<String, dynamic> json) =
      _$_RoomListState.fromJson;

  @override
  bool get isLoading;
  @override
  List<RoomState> get rooms;
  @override
  String get error;
  @override
  _$RoomListStateCopyWith<_RoomListState> get copyWith;
}
