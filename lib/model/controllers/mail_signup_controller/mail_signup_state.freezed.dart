// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'mail_signup_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
MailSignupState _$MailSignupStateFromJson(Map<String, dynamic> json) {
  return _MailSignupState.fromJson(json);
}

class _$MailSignupStateTearOff {
  const _$MailSignupStateTearOff();

// ignore: unused_element
  _MailSignupState call({bool isLoading = false, String error}) {
    return _MailSignupState(
      isLoading: isLoading,
      error: error,
    );
  }
}

// ignore: unused_element
const $MailSignupState = _$MailSignupStateTearOff();

mixin _$MailSignupState {
  bool get isLoading;
  String get error;

  Map<String, dynamic> toJson();
  $MailSignupStateCopyWith<MailSignupState> get copyWith;
}

abstract class $MailSignupStateCopyWith<$Res> {
  factory $MailSignupStateCopyWith(
          MailSignupState value, $Res Function(MailSignupState) then) =
      _$MailSignupStateCopyWithImpl<$Res>;
  $Res call({bool isLoading, String error});
}

class _$MailSignupStateCopyWithImpl<$Res>
    implements $MailSignupStateCopyWith<$Res> {
  _$MailSignupStateCopyWithImpl(this._value, this._then);

  final MailSignupState _value;
  // ignore: unused_field
  final $Res Function(MailSignupState) _then;

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

abstract class _$MailSignupStateCopyWith<$Res>
    implements $MailSignupStateCopyWith<$Res> {
  factory _$MailSignupStateCopyWith(
          _MailSignupState value, $Res Function(_MailSignupState) then) =
      __$MailSignupStateCopyWithImpl<$Res>;
  @override
  $Res call({bool isLoading, String error});
}

class __$MailSignupStateCopyWithImpl<$Res>
    extends _$MailSignupStateCopyWithImpl<$Res>
    implements _$MailSignupStateCopyWith<$Res> {
  __$MailSignupStateCopyWithImpl(
      _MailSignupState _value, $Res Function(_MailSignupState) _then)
      : super(_value, (v) => _then(v as _MailSignupState));

  @override
  _MailSignupState get _value => super._value as _MailSignupState;

  @override
  $Res call({
    Object isLoading = freezed,
    Object error = freezed,
  }) {
    return _then(_MailSignupState(
      isLoading: isLoading == freezed ? _value.isLoading : isLoading as bool,
      error: error == freezed ? _value.error : error as String,
    ));
  }
}

@JsonSerializable()
class _$_MailSignupState implements _MailSignupState {
  const _$_MailSignupState({this.isLoading = false, this.error})
      : assert(isLoading != null);

  factory _$_MailSignupState.fromJson(Map<String, dynamic> json) =>
      _$_$_MailSignupStateFromJson(json);

  @JsonKey(defaultValue: false)
  @override
  final bool isLoading;
  @override
  final String error;

  @override
  String toString() {
    return 'MailSignupState(isLoading: $isLoading, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MailSignupState &&
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
  _$MailSignupStateCopyWith<_MailSignupState> get copyWith =>
      __$MailSignupStateCopyWithImpl<_MailSignupState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_MailSignupStateToJson(this);
  }
}

abstract class _MailSignupState implements MailSignupState {
  const factory _MailSignupState({bool isLoading, String error}) =
      _$_MailSignupState;

  factory _MailSignupState.fromJson(Map<String, dynamic> json) =
      _$_MailSignupState.fromJson;

  @override
  bool get isLoading;
  @override
  String get error;
  @override
  _$MailSignupStateCopyWith<_MailSignupState> get copyWith;
}
