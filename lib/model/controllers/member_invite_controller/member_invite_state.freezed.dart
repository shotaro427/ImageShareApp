// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'member_invite_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
MemberInviteState _$MemberInviteStateFromJson(Map<String, dynamic> json) {
  return _MemberInviteState.fromJson(json);
}

class _$MemberInviteStateTearOff {
  const _$MemberInviteStateTearOff();

// ignore: unused_element
  _MemberInviteState call({String error, bool isLoading = false}) {
    return _MemberInviteState(
      error: error,
      isLoading: isLoading,
    );
  }
}

// ignore: unused_element
const $MemberInviteState = _$MemberInviteStateTearOff();

mixin _$MemberInviteState {
  String get error;
  bool get isLoading;

  Map<String, dynamic> toJson();
  $MemberInviteStateCopyWith<MemberInviteState> get copyWith;
}

abstract class $MemberInviteStateCopyWith<$Res> {
  factory $MemberInviteStateCopyWith(
          MemberInviteState value, $Res Function(MemberInviteState) then) =
      _$MemberInviteStateCopyWithImpl<$Res>;
  $Res call({String error, bool isLoading});
}

class _$MemberInviteStateCopyWithImpl<$Res>
    implements $MemberInviteStateCopyWith<$Res> {
  _$MemberInviteStateCopyWithImpl(this._value, this._then);

  final MemberInviteState _value;
  // ignore: unused_field
  final $Res Function(MemberInviteState) _then;

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

abstract class _$MemberInviteStateCopyWith<$Res>
    implements $MemberInviteStateCopyWith<$Res> {
  factory _$MemberInviteStateCopyWith(
          _MemberInviteState value, $Res Function(_MemberInviteState) then) =
      __$MemberInviteStateCopyWithImpl<$Res>;
  @override
  $Res call({String error, bool isLoading});
}

class __$MemberInviteStateCopyWithImpl<$Res>
    extends _$MemberInviteStateCopyWithImpl<$Res>
    implements _$MemberInviteStateCopyWith<$Res> {
  __$MemberInviteStateCopyWithImpl(
      _MemberInviteState _value, $Res Function(_MemberInviteState) _then)
      : super(_value, (v) => _then(v as _MemberInviteState));

  @override
  _MemberInviteState get _value => super._value as _MemberInviteState;

  @override
  $Res call({
    Object error = freezed,
    Object isLoading = freezed,
  }) {
    return _then(_MemberInviteState(
      error: error == freezed ? _value.error : error as String,
      isLoading: isLoading == freezed ? _value.isLoading : isLoading as bool,
    ));
  }
}

@JsonSerializable()
class _$_MemberInviteState implements _MemberInviteState {
  const _$_MemberInviteState({this.error, this.isLoading = false})
      : assert(isLoading != null);

  factory _$_MemberInviteState.fromJson(Map<String, dynamic> json) =>
      _$_$_MemberInviteStateFromJson(json);

  @override
  final String error;
  @JsonKey(defaultValue: false)
  @override
  final bool isLoading;

  @override
  String toString() {
    return 'MemberInviteState(error: $error, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MemberInviteState &&
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
  _$MemberInviteStateCopyWith<_MemberInviteState> get copyWith =>
      __$MemberInviteStateCopyWithImpl<_MemberInviteState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_MemberInviteStateToJson(this);
  }
}

abstract class _MemberInviteState implements MemberInviteState {
  const factory _MemberInviteState({String error, bool isLoading}) =
      _$_MemberInviteState;

  factory _MemberInviteState.fromJson(Map<String, dynamic> json) =
      _$_MemberInviteState.fromJson;

  @override
  String get error;
  @override
  bool get isLoading;
  @override
  _$MemberInviteStateCopyWith<_MemberInviteState> get copyWith;
}
