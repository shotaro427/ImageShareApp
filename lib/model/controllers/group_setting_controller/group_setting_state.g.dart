// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_setting_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GroupSettingState _$_$_GroupSettingStateFromJson(Map<String, dynamic> json) {
  return _$_GroupSettingState(
    error: json['error'] as String,
    isLoading: json['isLoading'] as bool ?? false,
    member: (json['member'] as List)
            ?.map((e) => e == null
                ? null
                : UserState.fromJson(e as Map<String, dynamic>))
            ?.toList() ??
        [],
    invited: (json['invited'] as List)
            ?.map((e) => e == null
                ? null
                : UserState.fromJson(e as Map<String, dynamic>))
            ?.toList() ??
        [],
  );
}

Map<String, dynamic> _$_$_GroupSettingStateToJson(
        _$_GroupSettingState instance) =>
    <String, dynamic>{
      'error': instance.error,
      'isLoading': instance.isLoading,
      'member': instance.member,
      'invited': instance.invited,
    };
