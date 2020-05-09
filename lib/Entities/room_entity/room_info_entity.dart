import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'room_info_entity.freezed.dart';
part 'room_info_entity.g.dart';

@freezed
abstract class RoomInfoEntity with _$RoomInfoEntity {
  const factory RoomInfoEntity({String name, String roomId}) = _RoomInfoEntity;

  factory RoomInfoEntity.fromJson(Map<String, dynamic> json) =>
      _$RoomInfoEntityFromJson(json);
}
