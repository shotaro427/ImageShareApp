// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'room.entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
RoomState _$RoomStateFromJson(Map<String, dynamic> json) {
  return _RoomState.fromJson(json);
}

class _$RoomStateTearOff {
  const _$RoomStateTearOff();

// ignore: unused_element
  _RoomState call(
      {int createdAt,
      int updateAt,
      String id = '',
      String name = '',
      List<String> tags = const [],
      List<String> member = const [],
      List<String> invited = const [],
      String iconUrl = ''}) {
    return _RoomState(
      createdAt: createdAt,
      updateAt: updateAt,
      id: id,
      name: name,
      tags: tags,
      member: member,
      invited: invited,
      iconUrl: iconUrl,
    );
  }
}

// ignore: unused_element
const $RoomState = _$RoomStateTearOff();

mixin _$RoomState {
  int get createdAt;
  int get updateAt;
  String get id;
  String get name;
  List<String> get tags;
  List<String> get member;
  List<String> get invited;
  String get iconUrl;

  Map<String, dynamic> toJson();
  $RoomStateCopyWith<RoomState> get copyWith;
}

abstract class $RoomStateCopyWith<$Res> {
  factory $RoomStateCopyWith(RoomState value, $Res Function(RoomState) then) =
      _$RoomStateCopyWithImpl<$Res>;
  $Res call(
      {int createdAt,
      int updateAt,
      String id,
      String name,
      List<String> tags,
      List<String> member,
      List<String> invited,
      String iconUrl});
}

class _$RoomStateCopyWithImpl<$Res> implements $RoomStateCopyWith<$Res> {
  _$RoomStateCopyWithImpl(this._value, this._then);

  final RoomState _value;
  // ignore: unused_field
  final $Res Function(RoomState) _then;

  @override
  $Res call({
    Object createdAt = freezed,
    Object updateAt = freezed,
    Object id = freezed,
    Object name = freezed,
    Object tags = freezed,
    Object member = freezed,
    Object invited = freezed,
    Object iconUrl = freezed,
  }) {
    return _then(_value.copyWith(
      createdAt: createdAt == freezed ? _value.createdAt : createdAt as int,
      updateAt: updateAt == freezed ? _value.updateAt : updateAt as int,
      id: id == freezed ? _value.id : id as String,
      name: name == freezed ? _value.name : name as String,
      tags: tags == freezed ? _value.tags : tags as List<String>,
      member: member == freezed ? _value.member : member as List<String>,
      invited: invited == freezed ? _value.invited : invited as List<String>,
      iconUrl: iconUrl == freezed ? _value.iconUrl : iconUrl as String,
    ));
  }
}

abstract class _$RoomStateCopyWith<$Res> implements $RoomStateCopyWith<$Res> {
  factory _$RoomStateCopyWith(
          _RoomState value, $Res Function(_RoomState) then) =
      __$RoomStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {int createdAt,
      int updateAt,
      String id,
      String name,
      List<String> tags,
      List<String> member,
      List<String> invited,
      String iconUrl});
}

class __$RoomStateCopyWithImpl<$Res> extends _$RoomStateCopyWithImpl<$Res>
    implements _$RoomStateCopyWith<$Res> {
  __$RoomStateCopyWithImpl(_RoomState _value, $Res Function(_RoomState) _then)
      : super(_value, (v) => _then(v as _RoomState));

  @override
  _RoomState get _value => super._value as _RoomState;

  @override
  $Res call({
    Object createdAt = freezed,
    Object updateAt = freezed,
    Object id = freezed,
    Object name = freezed,
    Object tags = freezed,
    Object member = freezed,
    Object invited = freezed,
    Object iconUrl = freezed,
  }) {
    return _then(_RoomState(
      createdAt: createdAt == freezed ? _value.createdAt : createdAt as int,
      updateAt: updateAt == freezed ? _value.updateAt : updateAt as int,
      id: id == freezed ? _value.id : id as String,
      name: name == freezed ? _value.name : name as String,
      tags: tags == freezed ? _value.tags : tags as List<String>,
      member: member == freezed ? _value.member : member as List<String>,
      invited: invited == freezed ? _value.invited : invited as List<String>,
      iconUrl: iconUrl == freezed ? _value.iconUrl : iconUrl as String,
    ));
  }
}

@JsonSerializable()
class _$_RoomState implements _RoomState {
  const _$_RoomState(
      {this.createdAt,
      this.updateAt,
      this.id = '',
      this.name = '',
      this.tags = const [],
      this.member = const [],
      this.invited = const [],
      this.iconUrl = ''})
      : assert(id != null),
        assert(name != null),
        assert(tags != null),
        assert(member != null),
        assert(invited != null),
        assert(iconUrl != null);

  factory _$_RoomState.fromJson(Map<String, dynamic> json) =>
      _$_$_RoomStateFromJson(json);

  @override
  final int createdAt;
  @override
  final int updateAt;
  @JsonKey(defaultValue: '')
  @override
  final String id;
  @JsonKey(defaultValue: '')
  @override
  final String name;
  @JsonKey(defaultValue: const [])
  @override
  final List<String> tags;
  @JsonKey(defaultValue: const [])
  @override
  final List<String> member;
  @JsonKey(defaultValue: const [])
  @override
  final List<String> invited;
  @JsonKey(defaultValue: '')
  @override
  final String iconUrl;

  @override
  String toString() {
    return 'RoomState(createdAt: $createdAt, updateAt: $updateAt, id: $id, name: $name, tags: $tags, member: $member, invited: $invited, iconUrl: $iconUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RoomState &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.updateAt, updateAt) ||
                const DeepCollectionEquality()
                    .equals(other.updateAt, updateAt)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.tags, tags) ||
                const DeepCollectionEquality().equals(other.tags, tags)) &&
            (identical(other.member, member) ||
                const DeepCollectionEquality().equals(other.member, member)) &&
            (identical(other.invited, invited) ||
                const DeepCollectionEquality()
                    .equals(other.invited, invited)) &&
            (identical(other.iconUrl, iconUrl) ||
                const DeepCollectionEquality().equals(other.iconUrl, iconUrl)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(updateAt) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(tags) ^
      const DeepCollectionEquality().hash(member) ^
      const DeepCollectionEquality().hash(invited) ^
      const DeepCollectionEquality().hash(iconUrl);

  @override
  _$RoomStateCopyWith<_RoomState> get copyWith =>
      __$RoomStateCopyWithImpl<_RoomState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_RoomStateToJson(this);
  }
}

abstract class _RoomState implements RoomState {
  const factory _RoomState(
      {int createdAt,
      int updateAt,
      String id,
      String name,
      List<String> tags,
      List<String> member,
      List<String> invited,
      String iconUrl}) = _$_RoomState;

  factory _RoomState.fromJson(Map<String, dynamic> json) =
      _$_RoomState.fromJson;

  @override
  int get createdAt;
  @override
  int get updateAt;
  @override
  String get id;
  @override
  String get name;
  @override
  List<String> get tags;
  @override
  List<String> get member;
  @override
  List<String> get invited;
  @override
  String get iconUrl;
  @override
  _$RoomStateCopyWith<_RoomState> get copyWith;
}
