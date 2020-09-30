// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'user.entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
UserState _$UserStateFromJson(Map<String, dynamic> json) {
  return _UserState.fromJson(json);
}

class _$UserStateTearOff {
  const _$UserStateTearOff();

// ignore: unused_element
  _UserState call(
      {int createdAt,
      int updateAt,
      String id = '',
      String uid = '',
      String name = '',
      String email = '',
      String iconUrl = '',
      List<String> joinedRooms = const [],
      List<String> invitedRooms = const []}) {
    return _UserState(
      createdAt: createdAt,
      updateAt: updateAt,
      id: id,
      uid: uid,
      name: name,
      email: email,
      iconUrl: iconUrl,
      joinedRooms: joinedRooms,
      invitedRooms: invitedRooms,
    );
  }
}

// ignore: unused_element
const $UserState = _$UserStateTearOff();

mixin _$UserState {
  int get createdAt;
  int get updateAt;
  String get id;
  String get uid;
  String get name;
  String get email;
  String get iconUrl;
  List<String> get joinedRooms;
  List<String> get invitedRooms;

  Map<String, dynamic> toJson();
  $UserStateCopyWith<UserState> get copyWith;
}

abstract class $UserStateCopyWith<$Res> {
  factory $UserStateCopyWith(UserState value, $Res Function(UserState) then) =
      _$UserStateCopyWithImpl<$Res>;
  $Res call(
      {int createdAt,
      int updateAt,
      String id,
      String uid,
      String name,
      String email,
      String iconUrl,
      List<String> joinedRooms,
      List<String> invitedRooms});
}

class _$UserStateCopyWithImpl<$Res> implements $UserStateCopyWith<$Res> {
  _$UserStateCopyWithImpl(this._value, this._then);

  final UserState _value;
  // ignore: unused_field
  final $Res Function(UserState) _then;

  @override
  $Res call({
    Object createdAt = freezed,
    Object updateAt = freezed,
    Object id = freezed,
    Object uid = freezed,
    Object name = freezed,
    Object email = freezed,
    Object iconUrl = freezed,
    Object joinedRooms = freezed,
    Object invitedRooms = freezed,
  }) {
    return _then(_value.copyWith(
      createdAt: createdAt == freezed ? _value.createdAt : createdAt as int,
      updateAt: updateAt == freezed ? _value.updateAt : updateAt as int,
      id: id == freezed ? _value.id : id as String,
      uid: uid == freezed ? _value.uid : uid as String,
      name: name == freezed ? _value.name : name as String,
      email: email == freezed ? _value.email : email as String,
      iconUrl: iconUrl == freezed ? _value.iconUrl : iconUrl as String,
      joinedRooms: joinedRooms == freezed
          ? _value.joinedRooms
          : joinedRooms as List<String>,
      invitedRooms: invitedRooms == freezed
          ? _value.invitedRooms
          : invitedRooms as List<String>,
    ));
  }
}

abstract class _$UserStateCopyWith<$Res> implements $UserStateCopyWith<$Res> {
  factory _$UserStateCopyWith(
          _UserState value, $Res Function(_UserState) then) =
      __$UserStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {int createdAt,
      int updateAt,
      String id,
      String uid,
      String name,
      String email,
      String iconUrl,
      List<String> joinedRooms,
      List<String> invitedRooms});
}

class __$UserStateCopyWithImpl<$Res> extends _$UserStateCopyWithImpl<$Res>
    implements _$UserStateCopyWith<$Res> {
  __$UserStateCopyWithImpl(_UserState _value, $Res Function(_UserState) _then)
      : super(_value, (v) => _then(v as _UserState));

  @override
  _UserState get _value => super._value as _UserState;

  @override
  $Res call({
    Object createdAt = freezed,
    Object updateAt = freezed,
    Object id = freezed,
    Object uid = freezed,
    Object name = freezed,
    Object email = freezed,
    Object iconUrl = freezed,
    Object joinedRooms = freezed,
    Object invitedRooms = freezed,
  }) {
    return _then(_UserState(
      createdAt: createdAt == freezed ? _value.createdAt : createdAt as int,
      updateAt: updateAt == freezed ? _value.updateAt : updateAt as int,
      id: id == freezed ? _value.id : id as String,
      uid: uid == freezed ? _value.uid : uid as String,
      name: name == freezed ? _value.name : name as String,
      email: email == freezed ? _value.email : email as String,
      iconUrl: iconUrl == freezed ? _value.iconUrl : iconUrl as String,
      joinedRooms: joinedRooms == freezed
          ? _value.joinedRooms
          : joinedRooms as List<String>,
      invitedRooms: invitedRooms == freezed
          ? _value.invitedRooms
          : invitedRooms as List<String>,
    ));
  }
}

@JsonSerializable()
class _$_UserState implements _UserState {
  const _$_UserState(
      {this.createdAt,
      this.updateAt,
      this.id = '',
      this.uid = '',
      this.name = '',
      this.email = '',
      this.iconUrl = '',
      this.joinedRooms = const [],
      this.invitedRooms = const []})
      : assert(id != null),
        assert(uid != null),
        assert(name != null),
        assert(email != null),
        assert(iconUrl != null),
        assert(joinedRooms != null),
        assert(invitedRooms != null);

  factory _$_UserState.fromJson(Map<String, dynamic> json) =>
      _$_$_UserStateFromJson(json);

  @override
  final int createdAt;
  @override
  final int updateAt;
  @JsonKey(defaultValue: '')
  @override
  final String id;
  @JsonKey(defaultValue: '')
  @override
  final String uid;
  @JsonKey(defaultValue: '')
  @override
  final String name;
  @JsonKey(defaultValue: '')
  @override
  final String email;
  @JsonKey(defaultValue: '')
  @override
  final String iconUrl;
  @JsonKey(defaultValue: const [])
  @override
  final List<String> joinedRooms;
  @JsonKey(defaultValue: const [])
  @override
  final List<String> invitedRooms;

  @override
  String toString() {
    return 'UserState(createdAt: $createdAt, updateAt: $updateAt, id: $id, uid: $uid, name: $name, email: $email, iconUrl: $iconUrl, joinedRooms: $joinedRooms, invitedRooms: $invitedRooms)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UserState &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.updateAt, updateAt) ||
                const DeepCollectionEquality()
                    .equals(other.updateAt, updateAt)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.uid, uid) ||
                const DeepCollectionEquality().equals(other.uid, uid)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.iconUrl, iconUrl) ||
                const DeepCollectionEquality()
                    .equals(other.iconUrl, iconUrl)) &&
            (identical(other.joinedRooms, joinedRooms) ||
                const DeepCollectionEquality()
                    .equals(other.joinedRooms, joinedRooms)) &&
            (identical(other.invitedRooms, invitedRooms) ||
                const DeepCollectionEquality()
                    .equals(other.invitedRooms, invitedRooms)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(updateAt) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(uid) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(iconUrl) ^
      const DeepCollectionEquality().hash(joinedRooms) ^
      const DeepCollectionEquality().hash(invitedRooms);

  @override
  _$UserStateCopyWith<_UserState> get copyWith =>
      __$UserStateCopyWithImpl<_UserState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UserStateToJson(this);
  }
}

abstract class _UserState implements UserState {
  const factory _UserState(
      {int createdAt,
      int updateAt,
      String id,
      String uid,
      String name,
      String email,
      String iconUrl,
      List<String> joinedRooms,
      List<String> invitedRooms}) = _$_UserState;

  factory _UserState.fromJson(Map<String, dynamic> json) =
      _$_UserState.fromJson;

  @override
  int get createdAt;
  @override
  int get updateAt;
  @override
  String get id;
  @override
  String get uid;
  @override
  String get name;
  @override
  String get email;
  @override
  String get iconUrl;
  @override
  List<String> get joinedRooms;
  @override
  List<String> get invitedRooms;
  @override
  _$UserStateCopyWith<_UserState> get copyWith;
}
