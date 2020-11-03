// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'group_setting_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
GroupSettingState _$GroupSettingStateFromJson(Map<String, dynamic> json) {
  return _GroupSettingState.fromJson(json);
}

class _$GroupSettingStateTearOff {
  const _$GroupSettingStateTearOff();

// ignore: unused_element
  _GroupSettingState call(
      {String error,
      bool isLoading = false,
      List<UserState> member = const [],
      List<UserState> invited = const []}) {
    return _GroupSettingState(
      error: error,
      isLoading: isLoading,
      member: member,
      invited: invited,
    );
  }
}

// ignore: unused_element
const $GroupSettingState = _$GroupSettingStateTearOff();

mixin _$GroupSettingState {
  String get error;
  bool get isLoading;
  List<UserState> get member;
  List<UserState> get invited;

  Map<String, dynamic> toJson();
  $GroupSettingStateCopyWith<GroupSettingState> get copyWith;
}

abstract class $GroupSettingStateCopyWith<$Res> {
  factory $GroupSettingStateCopyWith(
          GroupSettingState value, $Res Function(GroupSettingState) then) =
      _$GroupSettingStateCopyWithImpl<$Res>;
  $Res call(
      {String error,
      bool isLoading,
      List<UserState> member,
      List<UserState> invited});
}

class _$GroupSettingStateCopyWithImpl<$Res>
    implements $GroupSettingStateCopyWith<$Res> {
  _$GroupSettingStateCopyWithImpl(this._value, this._then);

  final GroupSettingState _value;
  // ignore: unused_field
  final $Res Function(GroupSettingState) _then;

  @override
  $Res call({
    Object error = freezed,
    Object isLoading = freezed,
    Object member = freezed,
    Object invited = freezed,
  }) {
    return _then(_value.copyWith(
      error: error == freezed ? _value.error : error as String,
      isLoading: isLoading == freezed ? _value.isLoading : isLoading as bool,
      member: member == freezed ? _value.member : member as List<UserState>,
      invited: invited == freezed ? _value.invited : invited as List<UserState>,
    ));
  }
}

abstract class _$GroupSettingStateCopyWith<$Res>
    implements $GroupSettingStateCopyWith<$Res> {
  factory _$GroupSettingStateCopyWith(
          _GroupSettingState value, $Res Function(_GroupSettingState) then) =
      __$GroupSettingStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String error,
      bool isLoading,
      List<UserState> member,
      List<UserState> invited});
}

class __$GroupSettingStateCopyWithImpl<$Res>
    extends _$GroupSettingStateCopyWithImpl<$Res>
    implements _$GroupSettingStateCopyWith<$Res> {
  __$GroupSettingStateCopyWithImpl(
      _GroupSettingState _value, $Res Function(_GroupSettingState) _then)
      : super(_value, (v) => _then(v as _GroupSettingState));

  @override
  _GroupSettingState get _value => super._value as _GroupSettingState;

  @override
  $Res call({
    Object error = freezed,
    Object isLoading = freezed,
    Object member = freezed,
    Object invited = freezed,
  }) {
    return _then(_GroupSettingState(
      error: error == freezed ? _value.error : error as String,
      isLoading: isLoading == freezed ? _value.isLoading : isLoading as bool,
      member: member == freezed ? _value.member : member as List<UserState>,
      invited: invited == freezed ? _value.invited : invited as List<UserState>,
    ));
  }
}

@JsonSerializable()
class _$_GroupSettingState implements _GroupSettingState {
  const _$_GroupSettingState(
      {this.error,
      this.isLoading = false,
      this.member = const [],
      this.invited = const []})
      : assert(isLoading != null),
        assert(member != null),
        assert(invited != null);

  factory _$_GroupSettingState.fromJson(Map<String, dynamic> json) =>
      _$_$_GroupSettingStateFromJson(json);

  @override
  final String error;
  @JsonKey(defaultValue: false)
  @override
  final bool isLoading;
  @JsonKey(defaultValue: const [])
  @override
  final List<UserState> member;
  @JsonKey(defaultValue: const [])
  @override
  final List<UserState> invited;

  @override
  String toString() {
    return 'GroupSettingState(error: $error, isLoading: $isLoading, member: $member, invited: $invited)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GroupSettingState &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)) &&
            (identical(other.isLoading, isLoading) ||
                const DeepCollectionEquality()
                    .equals(other.isLoading, isLoading)) &&
            (identical(other.member, member) ||
                const DeepCollectionEquality().equals(other.member, member)) &&
            (identical(other.invited, invited) ||
                const DeepCollectionEquality().equals(other.invited, invited)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(error) ^
      const DeepCollectionEquality().hash(isLoading) ^
      const DeepCollectionEquality().hash(member) ^
      const DeepCollectionEquality().hash(invited);

  @override
  _$GroupSettingStateCopyWith<_GroupSettingState> get copyWith =>
      __$GroupSettingStateCopyWithImpl<_GroupSettingState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_GroupSettingStateToJson(this);
  }
}

abstract class _GroupSettingState implements GroupSettingState {
  const factory _GroupSettingState(
      {String error,
      bool isLoading,
      List<UserState> member,
      List<UserState> invited}) = _$_GroupSettingState;

  factory _GroupSettingState.fromJson(Map<String, dynamic> json) =
      _$_GroupSettingState.fromJson;

  @override
  String get error;
  @override
  bool get isLoading;
  @override
  List<UserState> get member;
  @override
  List<UserState> get invited;
  @override
  _$GroupSettingStateCopyWith<_GroupSettingState> get copyWith;
}
