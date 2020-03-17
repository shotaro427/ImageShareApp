// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'room_info_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

RoomInfoEntity _$RoomInfoEntityFromJson(Map<String, dynamic> json) {
  return _RoomInfoEntity.fromJson(json);
}

mixin _$RoomInfoEntity {
  String get name;
  String get roomId;

  RoomInfoEntity copyWith({String name, String roomId});

  Map<String, dynamic> toJson();
}

class _$RoomInfoEntityTearOff {
  const _$RoomInfoEntityTearOff();

  _RoomInfoEntity call({String name, String roomId}) {
    return _RoomInfoEntity(
      name: name,
      roomId: roomId,
    );
  }
}

const $RoomInfoEntity = _$RoomInfoEntityTearOff();

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
  _$_RoomInfoEntity copyWith({
    Object name = freezed,
    Object roomId = freezed,
  }) {
    return _$_RoomInfoEntity(
      name: name == freezed ? this.name : name as String,
      roomId: roomId == freezed ? this.roomId : roomId as String,
    );
  }

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
  _RoomInfoEntity copyWith({String name, String roomId});
}
