// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invited_room_list_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_InvitedRoomState _$_$_InvitedRoomStateFromJson(Map<String, dynamic> json) {
  return _$_InvitedRoomState(
    isLoading: json['isLoading'] as bool ?? false,
    rooms: json['rooms'] as List,
    error: json['error'] as String,
  );
}

Map<String, dynamic> _$_$_InvitedRoomStateToJson(
        _$_InvitedRoomState instance) =>
    <String, dynamic>{
      'isLoading': instance.isLoading,
      'rooms': instance.rooms,
      'error': instance.error,
    };
