// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'room_info_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
RoomInfoEntity _$RoomInfoEntityFromJson(Map<String, dynamic> json) {
  return _RoomInfoEntity.fromJson(json);
}

class _$RoomInfoEntityTearOff {
  const _$RoomInfoEntityTearOff();

// ignore: unused_element
  _RoomInfoEntity call({String name, String roomId}) {
    return _RoomInfoEntity(
      name: name,
      roomId: roomId,
    );
  }
}

// ignore: unused_element
const $RoomInfoEntity = _$RoomInfoEntityTearOff();

mixin _$RoomInfoEntity {
  String get name;
  String get roomId;

  Map<String, dynamic> toJson();
  $RoomInfoEntityCopyWith<RoomInfoEntity> get copyWith;
}

abstract class $RoomInfoEntityCopyWith<$Res> {
  factory $RoomInfoEntityCopyWith(
          RoomInfoEntity value, $Res Function(RoomInfoEntity) then) =
      _$RoomInfoEntityCopyWithImpl<$Res>;
  $Res call({String name, String roomId});
}

class _$RoomInfoEntityCopyWithImpl<$Res>
    implements $RoomInfoEntityCopyWith<$Res> {
  _$RoomInfoEntityCopyWithImpl(this._value, this._then);

  final RoomInfoEntity _value;
  // ignore: unused_field
  final $Res Function(RoomInfoEntity) _then;

  @override
  $Res call({
    Object name = freezed,
    Object roomId = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed ? _value.name : name as String,
      roomId: roomId == freezed ? _value.roomId : roomId as String,
    ));
  }
}

abstract class _$RoomInfoEntityCopyWith<$Res>
    implements $RoomInfoEntityCopyWith<$Res> {
  factory _$RoomInfoEntityCopyWith(
          _RoomInfoEntity value, $Res Function(_RoomInfoEntity) then) =
      __$RoomInfoEntityCopyWithImpl<$Res>;
  @override
  $Res call({String name, String roomId});
}

class __$RoomInfoEntityCopyWithImpl<$Res>
    extends _$RoomInfoEntityCopyWithImpl<$Res>
    implements _$RoomInfoEntityCopyWith<$Res> {
  __$RoomInfoEntityCopyWithImpl(
      _RoomInfoEntity _value, $Res Function(_RoomInfoEntity) _then)
      : super(_value, (v) => _then(v as _RoomInfoEntity));

  @override
  _RoomInfoEntity get _value => super._value as _RoomInfoEntity;

  @override
  $Res call({
    Object name = freezed,
    Object roomId = freezed,
  }) {
    return _then(_RoomInfoEntity(
      name: name == freezed ? _value.name : name as String,
      roomId: roomId == freezed ? _value.roomId : roomId as String,
    ));
  }
}

@JsonSerializable()
class _$_RoomInfoEntity
    with DiagnosticableTreeMixin
    implements _RoomInfoEntity {
  const _$_RoomInfoEntity({this.name, this.roomId});

  factory _$_RoomInfoEntity.fromJson(Map<String, dynamic> json) =>
      _$_$_RoomInfoEntityFromJson(json);

  @override
  final String name;
  @override
  final String roomId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RoomInfoEntity(name: $name, roomId: $roomId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RoomInfoEntity'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('roomId', roomId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RoomInfoEntity &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.roomId, roomId) ||
                const DeepCollectionEquality().equals(other.roomId, roomId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(roomId);

  @override
  _$RoomInfoEntityCopyWith<_RoomInfoEntity> get copyWith =>
      __$RoomInfoEntityCopyWithImpl<_RoomInfoEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_RoomInfoEntityToJson(this);
  }
}

abstract class _RoomInfoEntity implements RoomInfoEntity {
  const factory _RoomInfoEntity({String name, String roomId}) =
      _$_RoomInfoEntity;

  factory _RoomInfoEntity.fromJson(Map<String, dynamic> json) =
      _$_RoomInfoEntity.fromJson;

  @override
  String get name;
  @override
  String get roomId;
  @override
  _$RoomInfoEntityCopyWith<_RoomInfoEntity> get copyWith;
}
