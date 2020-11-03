// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'self_setting_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
SelfSettingState _$SelfSettingStateFromJson(Map<String, dynamic> json) {
  return _SelfSettingState.fromJson(json);
}

class _$SelfSettingStateTearOff {
  const _$SelfSettingStateTearOff();

// ignore: unused_element
  _SelfSettingState call({String error, bool isLoading = false}) {
    return _SelfSettingState(
      error: error,
      isLoading: isLoading,
    );
  }
}

// ignore: unused_element
const $SelfSettingState = _$SelfSettingStateTearOff();

mixin _$SelfSettingState {
  String get error;
  bool get isLoading;

  Map<String, dynamic> toJson();
  $SelfSettingStateCopyWith<SelfSettingState> get copyWith;
}

abstract class $SelfSettingStateCopyWith<$Res> {
  factory $SelfSettingStateCopyWith(
          SelfSettingState value, $Res Function(SelfSettingState) then) =
      _$SelfSettingStateCopyWithImpl<$Res>;
  $Res call({String error, bool isLoading});
}

class _$SelfSettingStateCopyWithImpl<$Res>
    implements $SelfSettingStateCopyWith<$Res> {
  _$SelfSettingStateCopyWithImpl(this._value, this._then);

  final SelfSettingState _value;
  // ignore: unused_field
  final $Res Function(SelfSettingState) _then;

  @override
  $Res call({
    Object error = freezed,
    Object isLoading = freezed,
  }) {
    return _then(_value.copyWith(
      error: error == freezed ? _value.error : error as String,
      isLoading: isLoading == freezed ? _value.isLoading : isLoading as bool,
    ));
  }
}

abstract class _$SelfSettingStateCopyWith<$Res>
    implements $SelfSettingStateCopyWith<$Res> {
  factory _$SelfSettingStateCopyWith(
          _SelfSettingState value, $Res Function(_SelfSettingState) then) =
      __$SelfSettingStateCopyWithImpl<$Res>;
  @override
  $Res call({String error, bool isLoading});
}

class __$SelfSettingStateCopyWithImpl<$Res>
    extends _$SelfSettingStateCopyWithImpl<$Res>
    implements _$SelfSettingStateCopyWith<$Res> {
  __$SelfSettingStateCopyWithImpl(
      _SelfSettingState _value, $Res Function(_SelfSettingState) _then)
      : super(_value, (v) => _then(v as _SelfSettingState));

  @override
  _SelfSettingState get _value => super._value as _SelfSettingState;

  @override
  $Res call({
    Object error = freezed,
    Object isLoading = freezed,
  }) {
    return _then(_SelfSettingState(
      error: error == freezed ? _value.error : error as String,
      isLoading: isLoading == freezed ? _value.isLoading : isLoading as bool,
    ));
  }
}

@JsonSerializable()
class _$_SelfSettingState implements _SelfSettingState {
  const _$_SelfSettingState({this.error, this.isLoading = false})
      : assert(isLoading != null);

  factory _$_SelfSettingState.fromJson(Map<String, dynamic> json) =>
      _$_$_SelfSettingStateFromJson(json);

  @override
  final String error;
  @JsonKey(defaultValue: false)
  @override
  final bool isLoading;

  @override
  String toString() {
    return 'SelfSettingState(error: $error, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SelfSettingState &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)) &&
            (identical(other.isLoading, isLoading) ||
                const DeepCollectionEquality()
                    .equals(other.isLoading, isLoading)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(error) ^
      const DeepCollectionEquality().hash(isLoading);

  @override
  _$SelfSettingStateCopyWith<_SelfSettingState> get copyWith =>
      __$SelfSettingStateCopyWithImpl<_SelfSettingState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SelfSettingStateToJson(this);
  }
}

abstract class _SelfSettingState implements SelfSettingState {
  const factory _SelfSettingState({String error, bool isLoading}) =
      _$_SelfSettingState;

  factory _SelfSettingState.fromJson(Map<String, dynamic> json) =
      _$_SelfSettingState.fromJson;

  @override
  String get error;
  @override
  bool get isLoading;
  @override
  _$SelfSettingStateCopyWith<_SelfSettingState> get copyWith;
}
