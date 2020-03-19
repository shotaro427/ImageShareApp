// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'user_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

UserEntity _$UserEntityFromJson(Map<String, dynamic> json) {
  return _UserEntity.fromJson(json);
}

mixin _$UserEntity {
  String get email;
  String get uid;
  String get name;

  UserEntity copyWith({String email, String uid, String name});

  Map<String, dynamic> toJson();
}

class _$UserEntityTearOff {
  const _$UserEntityTearOff();

  _UserEntity call(
      {@required String email, @required String uid, String name}) {
    return _UserEntity(
      email: email,
      uid: uid,
      name: name,
    );
  }
}

const $UserEntity = _$UserEntityTearOff();

@JsonSerializable()
class _$_UserEntity with DiagnosticableTreeMixin implements _UserEntity {
  const _$_UserEntity({@required this.email, @required this.uid, this.name})
      : assert(email != null),
        assert(uid != null);

  factory _$_UserEntity.fromJson(Map<String, dynamic> json) =>
      _$_$_UserEntityFromJson(json);

  @override
  final String email;
  @override
  final String uid;
  @override
  final String name;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserEntity(email: $email, uid: $uid, name: $name)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserEntity'))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('uid', uid))
      ..add(DiagnosticsProperty('name', name));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UserEntity &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.uid, uid) ||
                const DeepCollectionEquality().equals(other.uid, uid)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(uid) ^
      const DeepCollectionEquality().hash(name);

  @override
  _$_UserEntity copyWith({
    Object email = freezed,
    Object uid = freezed,
    Object name = freezed,
  }) {
    return _$_UserEntity(
      email: email == freezed ? this.email : email as String,
      uid: uid == freezed ? this.uid : uid as String,
      name: name == freezed ? this.name : name as String,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UserEntityToJson(this);
  }
}

abstract class _UserEntity implements UserEntity {
  const factory _UserEntity(
      {@required String email,
      @required String uid,
      String name}) = _$_UserEntity;

  factory _UserEntity.fromJson(Map<String, dynamic> json) =
      _$_UserEntity.fromJson;

  @override
  String get email;
  @override
  String get uid;
  @override
  String get name;

  @override
  _UserEntity copyWith({String email, String uid, String name});
}
