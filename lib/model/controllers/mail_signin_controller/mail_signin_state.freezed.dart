// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'mail_signin_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
MailSigninState _$MailSigninStateFromJson(Map<String, dynamic> json) {
  return _MailSigninState.fromJson(json);
}

class _$MailSigninStateTearOff {
  const _$MailSigninStateTearOff();

// ignore: unused_element
  _MailSigninState call({bool isLoading = false, String error}) {
    return _MailSigninState(
      isLoading: isLoading,
      error: error,
    );
  }
}

// ignore: unused_element
const $MailSigninState = _$MailSigninStateTearOff();

mixin _$MailSigninState {
  bool get isLoading;
  String get error;

  Map<String, dynamic> toJson();
  $MailSigninStateCopyWith<MailSigninState> get copyWith;
}

abstract class $MailSigninStateCopyWith<$Res> {
  factory $MailSigninStateCopyWith(
          MailSigninState value, $Res Function(MailSigninState) then) =
      _$MailSigninStateCopyWithImpl<$Res>;
  $Res call({bool isLoading, String error});
}

class _$MailSigninStateCopyWithImpl<$Res>
    implements $MailSigninStateCopyWith<$Res> {
  _$MailSigninStateCopyWithImpl(this._value, this._then);

  final MailSigninState _value;
  // ignore: unused_field
  final $Res Function(MailSigninState) _then;

  @override
  $Res call({
    Object isLoading = freezed,
    Object error = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed ? _value.isLoading : isLoading as bool,
      error: error == freezed ? _value.error : error as String,
    ));
  }
}

abstract class _$MailSigninStateCopyWith<$Res>
    implements $MailSigninStateCopyWith<$Res> {
  factory _$MailSigninStateCopyWith(
          _MailSigninState value, $Res Function(_MailSigninState) then) =
      __$MailSigninStateCopyWithImpl<$Res>;
  @override
  $Res call({bool isLoading, String error});
}

class __$MailSigninStateCopyWithImpl<$Res>
    extends _$MailSigninStateCopyWithImpl<$Res>
    implements _$MailSigninStateCopyWith<$Res> {
  __$MailSigninStateCopyWithImpl(
      _MailSigninState _value, $Res Function(_MailSigninState) _then)
      : super(_value, (v) => _then(v as _MailSigninState));

  @override
  _MailSigninState get _value => super._value as _MailSigninState;

  @override
  $Res call({
    Object isLoading = freezed,
    Object error = freezed,
  }) {
    return _then(_MailSigninState(
      isLoading: isLoading == freezed ? _value.isLoading : isLoading as bool,
      error: error == freezed ? _value.error : error as String,
    ));
  }
}

@JsonSerializable()
class _$_MailSigninState implements _MailSigninState {
  const _$_MailSigninState({this.isLoading = false, this.error})
      : assert(isLoading != null);

  factory _$_MailSigninState.fromJson(Map<String, dynamic> json) =>
      _$_$_MailSigninStateFromJson(json);

  @JsonKey(defaultValue: false)
  @override
  final bool isLoading;
  @override
  final String error;

  @override
  String toString() {
    return 'MailSigninState(isLoading: $isLoading, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MailSigninState &&
            (identical(other.isLoading, isLoading) ||
                const DeepCollectionEquality()
                    .equals(other.isLoading, isLoading)) &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isLoading) ^
      const DeepCollectionEquality().hash(error);

  @override
  _$MailSigninStateCopyWith<_MailSigninState> get copyWith =>
      __$MailSigninStateCopyWithImpl<_MailSigninState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_MailSigninStateToJson(this);
  }
}

abstract class _MailSigninState implements MailSigninState {
  const factory _MailSigninState({bool isLoading, String error}) =
      _$_MailSigninState;

  factory _MailSigninState.fromJson(Map<String, dynamic> json) =
      _$_MailSigninState.fromJson;

  @override
  bool get isLoading;
  @override
  String get error;
  @override
  _$MailSigninStateCopyWith<_MailSigninState> get copyWith;
}
