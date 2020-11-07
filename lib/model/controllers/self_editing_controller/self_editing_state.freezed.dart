// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'self_editing_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
SelfEditingState _$SelfEditingStateFromJson(Map<String, dynamic> json) {
  return _SelfEditingState.fromJson(json);
}

class _$SelfEditingStateTearOff {
  const _$SelfEditingStateTearOff();

// ignore: unused_element
  _SelfEditingState call(
      {String error, String validate, bool isLoading = false}) {
    return _SelfEditingState(
      error: error,
      validate: validate,
      isLoading: isLoading,
    );
  }
}

// ignore: unused_element
const $SelfEditingState = _$SelfEditingStateTearOff();

mixin _$SelfEditingState {
  String get error;
  String get validate;
  bool get isLoading;

  Map<String, dynamic> toJson();
  $SelfEditingStateCopyWith<SelfEditingState> get copyWith;
}

abstract class $SelfEditingStateCopyWith<$Res> {
  factory $SelfEditingStateCopyWith(
          SelfEditingState value, $Res Function(SelfEditingState) then) =
      _$SelfEditingStateCopyWithImpl<$Res>;
  $Res call({String error, String validate, bool isLoading});
}

class _$SelfEditingStateCopyWithImpl<$Res>
    implements $SelfEditingStateCopyWith<$Res> {
  _$SelfEditingStateCopyWithImpl(this._value, this._then);

  final SelfEditingState _value;
  // ignore: unused_field
  final $Res Function(SelfEditingState) _then;

  @override
  $Res call({
    Object error = freezed,
    Object validate = freezed,
    Object isLoading = freezed,
  }) {
    return _then(_value.copyWith(
      error: error == freezed ? _value.error : error as String,
      validate: validate == freezed ? _value.validate : validate as String,
      isLoading: isLoading == freezed ? _value.isLoading : isLoading as bool,
    ));
  }
}

abstract class _$SelfEditingStateCopyWith<$Res>
    implements $SelfEditingStateCopyWith<$Res> {
  factory _$SelfEditingStateCopyWith(
          _SelfEditingState value, $Res Function(_SelfEditingState) then) =
      __$SelfEditingStateCopyWithImpl<$Res>;
  @override
  $Res call({String error, String validate, bool isLoading});
}

class __$SelfEditingStateCopyWithImpl<$Res>
    extends _$SelfEditingStateCopyWithImpl<$Res>
    implements _$SelfEditingStateCopyWith<$Res> {
  __$SelfEditingStateCopyWithImpl(
      _SelfEditingState _value, $Res Function(_SelfEditingState) _then)
      : super(_value, (v) => _then(v as _SelfEditingState));

  @override
  _SelfEditingState get _value => super._value as _SelfEditingState;

  @override
  $Res call({
    Object error = freezed,
    Object validate = freezed,
    Object isLoading = freezed,
  }) {
    return _then(_SelfEditingState(
      error: error == freezed ? _value.error : error as String,
      validate: validate == freezed ? _value.validate : validate as String,
      isLoading: isLoading == freezed ? _value.isLoading : isLoading as bool,
    ));
  }
}

@JsonSerializable()
class _$_SelfEditingState implements _SelfEditingState {
  const _$_SelfEditingState({this.error, this.validate, this.isLoading = false})
      : assert(isLoading != null);

  factory _$_SelfEditingState.fromJson(Map<String, dynamic> json) =>
      _$_$_SelfEditingStateFromJson(json);

  @override
  final String error;
  @override
  final String validate;
  @JsonKey(defaultValue: false)
  @override
  final bool isLoading;

  @override
  String toString() {
    return 'SelfEditingState(error: $error, validate: $validate, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SelfEditingState &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)) &&
            (identical(other.validate, validate) ||
                const DeepCollectionEquality()
                    .equals(other.validate, validate)) &&
            (identical(other.isLoading, isLoading) ||
                const DeepCollectionEquality()
                    .equals(other.isLoading, isLoading)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(error) ^
      const DeepCollectionEquality().hash(validate) ^
      const DeepCollectionEquality().hash(isLoading);

  @override
  _$SelfEditingStateCopyWith<_SelfEditingState> get copyWith =>
      __$SelfEditingStateCopyWithImpl<_SelfEditingState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SelfEditingStateToJson(this);
  }
}

abstract class _SelfEditingState implements SelfEditingState {
  const factory _SelfEditingState(
      {String error, String validate, bool isLoading}) = _$_SelfEditingState;

  factory _SelfEditingState.fromJson(Map<String, dynamic> json) =
      _$_SelfEditingState.fromJson;

  @override
  String get error;
  @override
  String get validate;
  @override
  bool get isLoading;
  @override
  _$SelfEditingStateCopyWith<_SelfEditingState> get copyWith;
}
