// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'select_tag_page.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

TagState _$TagStateFromJson(Map<String, dynamic> json) {
  return _TagState.fromJson(json);
}

mixin _$TagState {
  String get tagName;
  bool get isSelected;
  String get hexColor;

  TagState copyWith({String tagName, bool isSelected, String hexColor});

  Map<String, dynamic> toJson();
}

class _$TagStateTearOff {
  const _$TagStateTearOff();

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

const $TagState = _$TagStateTearOff();

@JsonSerializable()
class _$_TagState with DiagnosticableTreeMixin implements _TagState {
  const _$_TagState(
      {this.tagName = '', this.isSelected = false, this.hexColor = '#ffffff'});

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
  _$_TagState copyWith({
    Object tagName = freezed,
    Object isSelected = freezed,
    Object hexColor = freezed,
  }) {
    return _$_TagState(
      tagName: tagName == freezed ? this.tagName : tagName as String,
      isSelected: isSelected == freezed ? this.isSelected : isSelected as bool,
      hexColor: hexColor == freezed ? this.hexColor : hexColor as String,
    );
  }

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
  _TagState copyWith({String tagName, bool isSelected, String hexColor});
}

mixin _$SelectTagState {
  List<TagState> get tags;

  SelectTagState copyWith({List<TagState> tags});
}

class _$SelectTagStateTearOff {
  const _$SelectTagStateTearOff();

  _SelectTagState call({List<TagState> tags = const []}) {
    return _SelectTagState(
      tags: tags,
    );
  }
}

const $SelectTagState = _$SelectTagStateTearOff();

class _$_SelectTagState
    with DiagnosticableTreeMixin
    implements _SelectTagState {
  const _$_SelectTagState({this.tags = const []});

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
  _$_SelectTagState copyWith({
    Object tags = freezed,
  }) {
    return _$_SelectTagState(
      tags: tags == freezed ? this.tags : tags as List<TagState>,
    );
  }
}

abstract class _SelectTagState implements SelectTagState {
  const factory _SelectTagState({List<TagState> tags}) = _$_SelectTagState;

  @override
  List<TagState> get tags;

  @override
  _SelectTagState copyWith({List<TagState> tags});
}