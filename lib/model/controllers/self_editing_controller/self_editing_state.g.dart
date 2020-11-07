// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'self_editing_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SelfEditingState _$_$_SelfEditingStateFromJson(Map<String, dynamic> json) {
  return _$_SelfEditingState(
    error: json['error'] as String,
    validate: json['validate'] as String,
    isLoading: json['isLoading'] as bool ?? false,
  );
}

Map<String, dynamic> _$_$_SelfEditingStateToJson(
        _$_SelfEditingState instance) =>
    <String, dynamic>{
      'error': instance.error,
      'validate': instance.validate,
      'isLoading': instance.isLoading,
    };
