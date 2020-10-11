// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'invited_room_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
InvitedRoomState _$InvitedRoomStateFromJson(Map<String, dynamic> json) {
  return _InvitedRoomState.fromJson(json);
}

class _$InvitedRoomStateTearOff {
  const _$InvitedRoomStateTearOff();

// ignore: unused_element
  _InvitedRoomState call(
      {bool isLoading = false, List<RoomState> rooms, String error}) {
    return _InvitedRoomState(
      isLoading: isLoading,
      rooms: rooms,
      error: error,
    );
  }
}

// ignore: unused_element
const $InvitedRoomState = _$InvitedRoomStateTearOff();

mixin _$InvitedRoomState {
  bool get isLoading;
  List<RoomState> get rooms;
  String get error;

  Map<String, dynamic> toJson();
  $InvitedRoomStateCopyWith<InvitedRoomState> get copyWith;
}

abstract class $InvitedRoomStateCopyWith<$Res> {
  factory $InvitedRoomStateCopyWith(
          InvitedRoomState value, $Res Function(InvitedRoomState) then) =
      _$InvitedRoomStateCopyWithImpl<$Res>;
  $Res call({bool isLoading, List<RoomState> rooms, String error});
}

class _$InvitedRoomStateCopyWithImpl<$Res>
    implements $InvitedRoomStateCopyWith<$Res> {
  _$InvitedRoomStateCopyWithImpl(this._value, this._then);

  final InvitedRoomState _value;
  // ignore: unused_field
  final $Res Function(InvitedRoomState) _then;

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

abstract class _$InvitedRoomStateCopyWith<$Res>
    implements $InvitedRoomStateCopyWith<$Res> {
  factory _$InvitedRoomStateCopyWith(
          _InvitedRoomState value, $Res Function(_InvitedRoomState) then) =
      __$InvitedRoomStateCopyWithImpl<$Res>;
  @override
  $Res call({bool isLoading, List<RoomState> rooms, String error});
}

class __$InvitedRoomStateCopyWithImpl<$Res>
    extends _$InvitedRoomStateCopyWithImpl<$Res>
    implements _$InvitedRoomStateCopyWith<$Res> {
  __$InvitedRoomStateCopyWithImpl(
      _InvitedRoomState _value, $Res Function(_InvitedRoomState) _then)
      : super(_value, (v) => _then(v as _InvitedRoomState));

  @override
  _InvitedRoomState get _value => super._value as _InvitedRoomState;

  @override
  $Res call({
    Object isLoading = freezed,
    Object rooms = freezed,
    Object error = freezed,
  }) {
    return _then(_InvitedRoomState(
      isLoading: isLoading == freezed ? _value.isLoading : isLoading as bool,
      rooms: rooms == freezed ? _value.rooms : rooms as List<RoomState>,
      error: error == freezed ? _value.error : error as String,
    ));
  }
}

@JsonSerializable()
class _$_InvitedRoomState implements _InvitedRoomState {
  const _$_InvitedRoomState({this.isLoading = false, this.rooms, this.error})
      : assert(isLoading != null);

  factory _$_InvitedRoomState.fromJson(Map<String, dynamic> json) =>
      _$_$_InvitedRoomStateFromJson(json);

  @JsonKey(defaultValue: false)
  @override
  final bool isLoading;
  @override
  final List<RoomState> rooms;
  @override
  final String error;

  @override
  String toString() {
    return 'InvitedRoomState(isLoading: $isLoading, rooms: $rooms, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _InvitedRoomState &&
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
  _$InvitedRoomStateCopyWith<_InvitedRoomState> get copyWith =>
      __$InvitedRoomStateCopyWithImpl<_InvitedRoomState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_InvitedRoomStateToJson(this);
  }
}

abstract class _InvitedRoomState implements InvitedRoomState {
  const factory _InvitedRoomState(
      {bool isLoading,
      List<RoomState> rooms,
      String error}) = _$_InvitedRoomState;

  factory _InvitedRoomState.fromJson(Map<String, dynamic> json) =
      _$_InvitedRoomState.fromJson;

  @override
  bool get isLoading;
  @override
  List<RoomState> get rooms;
  @override
  String get error;
  @override
  _$InvitedRoomStateCopyWith<_InvitedRoomState> get copyWith;
}
