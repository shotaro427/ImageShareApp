// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'app_start_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$AppStartStateTearOff {
  const _$AppStartStateTearOff();

// ignore: unused_element
  _AppStartState call({bool isLoading = false}) {
    return _AppStartState(
      isLoading: isLoading,
    );
  }
}

// ignore: unused_element
const $AppStartState = _$AppStartStateTearOff();

mixin _$AppStartState {
  bool get isLoading;

  $AppStartStateCopyWith<AppStartState> get copyWith;
}

abstract class $AppStartStateCopyWith<$Res> {
  factory $AppStartStateCopyWith(
          AppStartState value, $Res Function(AppStartState) then) =
      _$AppStartStateCopyWithImpl<$Res>;
  $Res call({bool isLoading});
}

class _$AppStartStateCopyWithImpl<$Res>
    implements $AppStartStateCopyWith<$Res> {
  _$AppStartStateCopyWithImpl(this._value, this._then);

  final AppStartState _value;
  // ignore: unused_field
  final $Res Function(AppStartState) _then;

  @override
  $Res call({
    Object isLoading = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed ? _value.isLoading : isLoading as bool,
    ));
  }
}

abstract class _$AppStartStateCopyWith<$Res>
    implements $AppStartStateCopyWith<$Res> {
  factory _$AppStartStateCopyWith(
          _AppStartState value, $Res Function(_AppStartState) then) =
      __$AppStartStateCopyWithImpl<$Res>;
  @override
  $Res call({bool isLoading});
}

class __$AppStartStateCopyWithImpl<$Res>
    extends _$AppStartStateCopyWithImpl<$Res>
    implements _$AppStartStateCopyWith<$Res> {
  __$AppStartStateCopyWithImpl(
      _AppStartState _value, $Res Function(_AppStartState) _then)
      : super(_value, (v) => _then(v as _AppStartState));

  @override
  _AppStartState get _value => super._value as _AppStartState;

  @override
  $Res call({
    Object isLoading = freezed,
  }) {
    return _then(_AppStartState(
      isLoading: isLoading == freezed ? _value.isLoading : isLoading as bool,
    ));
  }
}

class _$_AppStartState implements _AppStartState {
  const _$_AppStartState({this.isLoading = false}) : assert(isLoading != null);

  @JsonKey(defaultValue: false)
  @override
  final bool isLoading;

  @override
  String toString() {
    return 'AppStartState(isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AppStartState &&
            (identical(other.isLoading, isLoading) ||
                const DeepCollectionEquality()
                    .equals(other.isLoading, isLoading)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(isLoading);

  @override
  _$AppStartStateCopyWith<_AppStartState> get copyWith =>
      __$AppStartStateCopyWithImpl<_AppStartState>(this, _$identity);
}

abstract class _AppStartState implements AppStartState {
  const factory _AppStartState({bool isLoading}) = _$_AppStartState;

  @override
  bool get isLoading;
  @override
  _$AppStartStateCopyWith<_AppStartState> get copyWith;
}
