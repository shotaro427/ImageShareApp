// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'pdf.entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
PdfState _$PdfStateFromJson(Map<String, dynamic> json) {
  return _PdfState.fromJson(json);
}

class _$PdfStateTearOff {
  const _$PdfStateTearOff();

// ignore: unused_element
  _PdfState call(
      {int createdAt,
      int updateAt,
      String id = '',
      String pdfUrl = '',
      String createUserId = ''}) {
    return _PdfState(
      createdAt: createdAt,
      updateAt: updateAt,
      id: id,
      pdfUrl: pdfUrl,
      createUserId: createUserId,
    );
  }
}

// ignore: unused_element
const $PdfState = _$PdfStateTearOff();

mixin _$PdfState {
  int get createdAt;
  int get updateAt;
  String get id;
  String get pdfUrl;
  String get createUserId;

  Map<String, dynamic> toJson();
  $PdfStateCopyWith<PdfState> get copyWith;
}

abstract class $PdfStateCopyWith<$Res> {
  factory $PdfStateCopyWith(PdfState value, $Res Function(PdfState) then) =
      _$PdfStateCopyWithImpl<$Res>;
  $Res call(
      {int createdAt,
      int updateAt,
      String id,
      String pdfUrl,
      String createUserId});
}

class _$PdfStateCopyWithImpl<$Res> implements $PdfStateCopyWith<$Res> {
  _$PdfStateCopyWithImpl(this._value, this._then);

  final PdfState _value;
  // ignore: unused_field
  final $Res Function(PdfState) _then;

  @override
  $Res call({
    Object createdAt = freezed,
    Object updateAt = freezed,
    Object id = freezed,
    Object pdfUrl = freezed,
    Object createUserId = freezed,
  }) {
    return _then(_value.copyWith(
      createdAt: createdAt == freezed ? _value.createdAt : createdAt as int,
      updateAt: updateAt == freezed ? _value.updateAt : updateAt as int,
      id: id == freezed ? _value.id : id as String,
      pdfUrl: pdfUrl == freezed ? _value.pdfUrl : pdfUrl as String,
      createUserId: createUserId == freezed
          ? _value.createUserId
          : createUserId as String,
    ));
  }
}

abstract class _$PdfStateCopyWith<$Res> implements $PdfStateCopyWith<$Res> {
  factory _$PdfStateCopyWith(_PdfState value, $Res Function(_PdfState) then) =
      __$PdfStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {int createdAt,
      int updateAt,
      String id,
      String pdfUrl,
      String createUserId});
}

class __$PdfStateCopyWithImpl<$Res> extends _$PdfStateCopyWithImpl<$Res>
    implements _$PdfStateCopyWith<$Res> {
  __$PdfStateCopyWithImpl(_PdfState _value, $Res Function(_PdfState) _then)
      : super(_value, (v) => _then(v as _PdfState));

  @override
  _PdfState get _value => super._value as _PdfState;

  @override
  $Res call({
    Object createdAt = freezed,
    Object updateAt = freezed,
    Object id = freezed,
    Object pdfUrl = freezed,
    Object createUserId = freezed,
  }) {
    return _then(_PdfState(
      createdAt: createdAt == freezed ? _value.createdAt : createdAt as int,
      updateAt: updateAt == freezed ? _value.updateAt : updateAt as int,
      id: id == freezed ? _value.id : id as String,
      pdfUrl: pdfUrl == freezed ? _value.pdfUrl : pdfUrl as String,
      createUserId: createUserId == freezed
          ? _value.createUserId
          : createUserId as String,
    ));
  }
}

@JsonSerializable()
class _$_PdfState implements _PdfState {
  const _$_PdfState(
      {this.createdAt,
      this.updateAt,
      this.id = '',
      this.pdfUrl = '',
      this.createUserId = ''})
      : assert(id != null),
        assert(pdfUrl != null),
        assert(createUserId != null);

  factory _$_PdfState.fromJson(Map<String, dynamic> json) =>
      _$_$_PdfStateFromJson(json);

  @override
  final int createdAt;
  @override
  final int updateAt;
  @JsonKey(defaultValue: '')
  @override
  final String id;
  @JsonKey(defaultValue: '')
  @override
  final String pdfUrl;
  @JsonKey(defaultValue: '')
  @override
  final String createUserId;

  @override
  String toString() {
    return 'PdfState(createdAt: $createdAt, updateAt: $updateAt, id: $id, pdfUrl: $pdfUrl, createUserId: $createUserId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PdfState &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.updateAt, updateAt) ||
                const DeepCollectionEquality()
                    .equals(other.updateAt, updateAt)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.pdfUrl, pdfUrl) ||
                const DeepCollectionEquality().equals(other.pdfUrl, pdfUrl)) &&
            (identical(other.createUserId, createUserId) ||
                const DeepCollectionEquality()
                    .equals(other.createUserId, createUserId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(updateAt) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(pdfUrl) ^
      const DeepCollectionEquality().hash(createUserId);

  @override
  _$PdfStateCopyWith<_PdfState> get copyWith =>
      __$PdfStateCopyWithImpl<_PdfState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PdfStateToJson(this);
  }
}

abstract class _PdfState implements PdfState {
  const factory _PdfState(
      {int createdAt,
      int updateAt,
      String id,
      String pdfUrl,
      String createUserId}) = _$_PdfState;

  factory _PdfState.fromJson(Map<String, dynamic> json) = _$_PdfState.fromJson;

  @override
  int get createdAt;
  @override
  int get updateAt;
  @override
  String get id;
  @override
  String get pdfUrl;
  @override
  String get createUserId;
  @override
  _$PdfStateCopyWith<_PdfState> get copyWith;
}
