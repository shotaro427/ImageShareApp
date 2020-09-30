// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'select_tag_page.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
TagState _$TagStateFromJson(Map<String, dynamic> json) {
  return _TagState.fromJson(json);
}

class _$TagStateTearOff {
  const _$TagStateTearOff();

// ignore: unused_element
  _TagState call(
      {String tagName = '',
      bool isSelected = false,
      String hexColor = '#ffffff'}) {
    return _TagState(
      tagName: tagName,
      isSelected: isSelected,
      hexColor: hexColor,
    );
  }
}

// ignore: unused_element
const $TagState = _$TagStateTearOff();

mixin _$TagState {
  String get tagName;
  bool get isSelected;
  String get hexColor;

  Map<String, dynamic> toJson();
  $TagStateCopyWith<TagState> get copyWith;
}

abstract class $TagStateCopyWith<$Res> {
  factory $TagStateCopyWith(TagState value, $Res Function(TagState) then) =
      _$TagStateCopyWithImpl<$Res>;
  $Res call({String tagName, bool isSelected, String hexColor});
}

class _$TagStateCopyWithImpl<$Res> implements $TagStateCopyWith<$Res> {
  _$TagStateCopyWithImpl(this._value, this._then);

  final TagState _value;
  // ignore: unused_field
  final $Res Function(TagState) _then;

  @override
  $Res call({
    Object tagName = freezed,
    Object isSelected = freezed,
    Object hexColor = freezed,
  }) {
    return _then(_value.copyWith(
      tagName: tagName == freezed ? _value.tagName : tagName as String,
      isSelected:
          isSelected == freezed ? _value.isSelected : isSelected as bool,
      hexColor: hexColor == freezed ? _value.hexColor : hexColor as String,
    ));
  }
}

abstract class _$TagStateCopyWith<$Res> implements $TagStateCopyWith<$Res> {
  factory _$TagStateCopyWith(_TagState value, $Res Function(_TagState) then) =
      __$TagStateCopyWithImpl<$Res>;
  @override
  $Res call({String tagName, bool isSelected, String hexColor});
}

class __$TagStateCopyWithImpl<$Res> extends _$TagStateCopyWithImpl<$Res>
    implements _$TagStateCopyWith<$Res> {
  __$TagStateCopyWithImpl(_TagState _value, $Res Function(_TagState) _then)
      : super(_value, (v) => _then(v as _TagState));

  @override
  _TagState get _value => super._value as _TagState;

  @override
  $Res call({
    Object tagName = freezed,
    Object isSelected = freezed,
    Object hexColor = freezed,
  }) {
    return _then(_TagState(
      tagName: tagName == freezed ? _value.tagName : tagName as String,
      isSelected:
          isSelected == freezed ? _value.isSelected : isSelected as bool,
      hexColor: hexColor == freezed ? _value.hexColor : hexColor as String,
    ));
  }
}

@JsonSerializable()
class _$_TagState with DiagnosticableTreeMixin implements _TagState {
  const _$_TagState(
      {this.tagName = '', this.isSelected = false, this.hexColor = '#ffffff'})
      : assert(tagName != null),
        assert(isSelected != null),
        assert(hexColor != null);

  factory _$_TagState.fromJson(Map<String, dynamic> json) =>
      _$_$_TagStateFromJson(json);

  @JsonKey(defaultValue: '')
  @override
  final String tagName;
  @JsonKey(defaultValue: false)
  @override
  final bool isSelected;
  @JsonKey(defaultValue: '#ffffff')
  @override
  final String hexColor;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TagState(tagName: $tagName, isSelected: $isSelected, hexColor: $hexColor)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TagState'))
      ..add(DiagnosticsProperty('tagName', tagName))
      ..add(DiagnosticsProperty('isSelected', isSelected))
      ..add(DiagnosticsProperty('hexColor', hexColor));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TagState &&
            (identical(other.tagName, tagName) ||
                const DeepCollectionEquality()
                    .equals(other.tagName, tagName)) &&
            (identical(other.isSelected, isSelected) ||
                const DeepCollectionEquality()
                    .equals(other.isSelected, isSelected)) &&
            (identical(other.hexColor, hexColor) ||
                const DeepCollectionEquality()
                    .equals(other.hexColor, hexColor)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(tagName) ^
      const DeepCollectionEquality().hash(isSelected) ^
      const DeepCollectionEquality().hash(hexColor);

  @override
  _$TagStateCopyWith<_TagState> get copyWith =>
      __$TagStateCopyWithImpl<_TagState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_TagStateToJson(this);
  }
}

abstract class _TagState implements TagState {
  const factory _TagState({String tagName, bool isSelected, String hexColor}) =
      _$_TagState;

  factory _TagState.fromJson(Map<String, dynamic> json) = _$_TagState.fromJson;

  @override
  String get tagName;
  @override
  bool get isSelected;
  @override
  String get hexColor;
  @override
  _$TagStateCopyWith<_TagState> get copyWith;
}

class _$SelectTagStateTearOff {
  const _$SelectTagStateTearOff();

// ignore: unused_element
  _SelectTagState call({List<TagState> tags = const []}) {
    return _SelectTagState(
      tags: tags,
    );
  }
}

// ignore: unused_element
const $SelectTagState = _$SelectTagStateTearOff();

mixin _$SelectTagState {
  List<TagState> get tags;

  $SelectTagStateCopyWith<SelectTagState> get copyWith;
}

abstract class $SelectTagStateCopyWith<$Res> {
  factory $SelectTagStateCopyWith(
          SelectTagState value, $Res Function(SelectTagState) then) =
      _$SelectTagStateCopyWithImpl<$Res>;
  $Res call({List<TagState> tags});
}

class _$SelectTagStateCopyWithImpl<$Res>
    implements $SelectTagStateCopyWith<$Res> {
  _$SelectTagStateCopyWithImpl(this._value, this._then);

  final SelectTagState _value;
  // ignore: unused_field
  final $Res Function(SelectTagState) _then;

  @override
  $Res call({
    Object tags = freezed,
  }) {
    return _then(_value.copyWith(
      tags: tags == freezed ? _value.tags : tags as List<TagState>,
    ));
  }
}

abstract class _$SelectTagStateCopyWith<$Res>
    implements $SelectTagStateCopyWith<$Res> {
  factory _$SelectTagStateCopyWith(
          _SelectTagState value, $Res Function(_SelectTagState) then) =
      __$SelectTagStateCopyWithImpl<$Res>;
  @override
  $Res call({List<TagState> tags});
}

class __$SelectTagStateCopyWithImpl<$Res>
    extends _$SelectTagStateCopyWithImpl<$Res>
    implements _$SelectTagStateCopyWith<$Res> {
  __$SelectTagStateCopyWithImpl(
      _SelectTagState _value, $Res Function(_SelectTagState) _then)
      : super(_value, (v) => _then(v as _SelectTagState));

  @override
  _SelectTagState get _value => super._value as _SelectTagState;

  @override
  $Res call({
    Object tags = freezed,
  }) {
    return _then(_SelectTagState(
      tags: tags == freezed ? _value.tags : tags as List<TagState>,
    ));
  }
}

class _$_SelectTagState
    with DiagnosticableTreeMixin
    implements _SelectTagState {
  const _$_SelectTagState({this.tags = const []}) : assert(tags != null);

  @JsonKey(defaultValue: const [])
  @override
  final List<TagState> tags;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SelectTagState(tags: $tags)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SelectTagState'))
      ..add(DiagnosticsProperty('tags', tags));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SelectTagState &&
            (identical(other.tags, tags) ||
                const DeepCollectionEquality().equals(other.tags, tags)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(tags);

  @override
  _$SelectTagStateCopyWith<_SelectTagState> get copyWith =>
      __$SelectTagStateCopyWithImpl<_SelectTagState>(this, _$identity);
}

abstract class _SelectTagState implements SelectTagState {
  const factory _SelectTagState({List<TagState> tags}) = _$_SelectTagState;

  @override
  List<TagState> get tags;
  @override
  _$SelectTagStateCopyWith<_SelectTagState> get copyWith;
}
