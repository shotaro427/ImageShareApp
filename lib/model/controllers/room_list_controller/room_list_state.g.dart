// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_list_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RoomListState _$_$_RoomListStateFromJson(Map<String, dynamic> json) {
  return _$_RoomListState(
    isLoading: json['isLoading'] as bool ?? false,
    rooms: (json['rooms'] as List)
        ?.map((e) =>
            e == null ? null : RoomState.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    error: json['error'] as String,
  );
}

Map<String, dynamic> _$_$_RoomListStateToJson(_$_RoomListState instance) =>
    <String, dynamic>{
      'isLoading': instance.isLoading,
      'rooms': instance.rooms,
      'error': instance.error,
    };
