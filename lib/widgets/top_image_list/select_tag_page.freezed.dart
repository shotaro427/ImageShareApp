// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'select_tag_page.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$TagState {
  String get tagName;
  bool get isSelected;

  TagState copyWith({String tagName, bool isSelected});
}

class _$TagStateTearOff {
  const _$TagStateTearOff();

  _TagState call({String tagName = '', bool isSelected = false}) {
    return _TagState(
      tagName: tagName,
      isSelected: isSelected,
    );
  }
}

const $TagState = _$TagStateTearOff();

class _$_TagState with DiagnosticableTreeMixin implements _TagState {
  const _$_TagState({this.tagName = '', this.isSelected = false});

  @JsonKey(defaultValue: '')
  @override
  final String tagName;
  @JsonKey(defaultValue: false)
  @override
  final bool isSelected;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TagState(tagName: $tagName, isSelected: $isSelected)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TagState'))
      ..add(DiagnosticsProperty('tagName', tagName))
      ..add(DiagnosticsProperty('isSelected', isSelected));
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
                    .equals(other.isSelected, isSelected)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(tagName) ^
      const DeepCollectionEquality().hash(isSelected);

  @override
  _$_TagState copyWith({
    Object tagName = freezed,
    Object isSelected = freezed,
  }) {
    return _$_TagState(
      tagName: tagName == freezed ? this.tagName : tagName as String,
      isSelected: isSelected == freezed ? this.isSelected : isSelected as bool,
    );
  }
}

abstract class _TagState implements TagState {
  const factory _TagState({String tagName, bool isSelected}) = _$_TagState;

  @override
  String get tagName;
  @override
  bool get isSelected;

  @override
  _TagState copyWith({String tagName, bool isSelected});
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
