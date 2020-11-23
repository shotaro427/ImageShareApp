// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'post_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$PostDetailStateTearOff {
  const _$PostDetailStateTearOff();

// ignore: unused_element
  _PostDetailState call(
      {String error,
      bool isLoading = false,
      int currentIndex = 0,
      int imageIndex = 0,
      List<ImageState> images = const [],
      List<PDFDocument> pdfs = const [],
      List<PDFPage> pdfsThumbnails = const []}) {
    return _PostDetailState(
      error: error,
      isLoading: isLoading,
      currentIndex: currentIndex,
      imageIndex: imageIndex,
      images: images,
      pdfs: pdfs,
      pdfsThumbnails: pdfsThumbnails,
    );
  }
}

// ignore: unused_element
const $PostDetailState = _$PostDetailStateTearOff();

mixin _$PostDetailState {
  String get error;
  bool get isLoading;
  int get currentIndex;
  int get imageIndex;
  List<ImageState> get images;
  List<PDFDocument> get pdfs;
  List<PDFPage> get pdfsThumbnails;

  $PostDetailStateCopyWith<PostDetailState> get copyWith;
}

abstract class $PostDetailStateCopyWith<$Res> {
  factory $PostDetailStateCopyWith(
          PostDetailState value, $Res Function(PostDetailState) then) =
      _$PostDetailStateCopyWithImpl<$Res>;
  $Res call(
      {String error,
      bool isLoading,
      int currentIndex,
      int imageIndex,
      List<ImageState> images,
      List<PDFDocument> pdfs,
      List<PDFPage> pdfsThumbnails});
}

class _$PostDetailStateCopyWithImpl<$Res>
    implements $PostDetailStateCopyWith<$Res> {
  _$PostDetailStateCopyWithImpl(this._value, this._then);

  final PostDetailState _value;
  // ignore: unused_field
  final $Res Function(PostDetailState) _then;

  @override
  $Res call({
    Object error = freezed,
    Object isLoading = freezed,
    Object currentIndex = freezed,
    Object imageIndex = freezed,
    Object images = freezed,
    Object pdfs = freezed,
    Object pdfsThumbnails = freezed,
  }) {
    return _then(_value.copyWith(
      error: error == freezed ? _value.error : error as String,
      isLoading: isLoading == freezed ? _value.isLoading : isLoading as bool,
      currentIndex:
          currentIndex == freezed ? _value.currentIndex : currentIndex as int,
      imageIndex: imageIndex == freezed ? _value.imageIndex : imageIndex as int,
      images: images == freezed ? _value.images : images as List<ImageState>,
      pdfs: pdfs == freezed ? _value.pdfs : pdfs as List<PDFDocument>,
      pdfsThumbnails: pdfsThumbnails == freezed
          ? _value.pdfsThumbnails
          : pdfsThumbnails as List<PDFPage>,
    ));
  }
}

abstract class _$PostDetailStateCopyWith<$Res>
    implements $PostDetailStateCopyWith<$Res> {
  factory _$PostDetailStateCopyWith(
          _PostDetailState value, $Res Function(_PostDetailState) then) =
      __$PostDetailStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String error,
      bool isLoading,
      int currentIndex,
      int imageIndex,
      List<ImageState> images,
      List<PDFDocument> pdfs,
      List<PDFPage> pdfsThumbnails});
}

class __$PostDetailStateCopyWithImpl<$Res>
    extends _$PostDetailStateCopyWithImpl<$Res>
    implements _$PostDetailStateCopyWith<$Res> {
  __$PostDetailStateCopyWithImpl(
      _PostDetailState _value, $Res Function(_PostDetailState) _then)
      : super(_value, (v) => _then(v as _PostDetailState));

  @override
  _PostDetailState get _value => super._value as _PostDetailState;

  @override
  $Res call({
    Object error = freezed,
    Object isLoading = freezed,
    Object currentIndex = freezed,
    Object imageIndex = freezed,
    Object images = freezed,
    Object pdfs = freezed,
    Object pdfsThumbnails = freezed,
  }) {
    return _then(_PostDetailState(
      error: error == freezed ? _value.error : error as String,
      isLoading: isLoading == freezed ? _value.isLoading : isLoading as bool,
      currentIndex:
          currentIndex == freezed ? _value.currentIndex : currentIndex as int,
      imageIndex: imageIndex == freezed ? _value.imageIndex : imageIndex as int,
      images: images == freezed ? _value.images : images as List<ImageState>,
      pdfs: pdfs == freezed ? _value.pdfs : pdfs as List<PDFDocument>,
      pdfsThumbnails: pdfsThumbnails == freezed
          ? _value.pdfsThumbnails
          : pdfsThumbnails as List<PDFPage>,
    ));
  }
}

class _$_PostDetailState implements _PostDetailState {
  const _$_PostDetailState(
      {this.error,
      this.isLoading = false,
      this.currentIndex = 0,
      this.imageIndex = 0,
      this.images = const [],
      this.pdfs = const [],
      this.pdfsThumbnails = const []})
      : assert(isLoading != null),
        assert(currentIndex != null),
        assert(imageIndex != null),
        assert(images != null),
        assert(pdfs != null),
        assert(pdfsThumbnails != null);

  @override
  final String error;
  @JsonKey(defaultValue: false)
  @override
  final bool isLoading;
  @JsonKey(defaultValue: 0)
  @override
  final int currentIndex;
  @JsonKey(defaultValue: 0)
  @override
  final int imageIndex;
  @JsonKey(defaultValue: const [])
  @override
  final List<ImageState> images;
  @JsonKey(defaultValue: const [])
  @override
  final List<PDFDocument> pdfs;
  @JsonKey(defaultValue: const [])
  @override
  final List<PDFPage> pdfsThumbnails;

  @override
  String toString() {
    return 'PostDetailState(error: $error, isLoading: $isLoading, currentIndex: $currentIndex, imageIndex: $imageIndex, images: $images, pdfs: $pdfs, pdfsThumbnails: $pdfsThumbnails)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PostDetailState &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)) &&
            (identical(other.isLoading, isLoading) ||
                const DeepCollectionEquality()
                    .equals(other.isLoading, isLoading)) &&
            (identical(other.currentIndex, currentIndex) ||
                const DeepCollectionEquality()
                    .equals(other.currentIndex, currentIndex)) &&
            (identical(other.imageIndex, imageIndex) ||
                const DeepCollectionEquality()
                    .equals(other.imageIndex, imageIndex)) &&
            (identical(other.images, images) ||
                const DeepCollectionEquality().equals(other.images, images)) &&
            (identical(other.pdfs, pdfs) ||
                const DeepCollectionEquality().equals(other.pdfs, pdfs)) &&
            (identical(other.pdfsThumbnails, pdfsThumbnails) ||
                const DeepCollectionEquality()
                    .equals(other.pdfsThumbnails, pdfsThumbnails)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(error) ^
      const DeepCollectionEquality().hash(isLoading) ^
      const DeepCollectionEquality().hash(currentIndex) ^
      const DeepCollectionEquality().hash(imageIndex) ^
      const DeepCollectionEquality().hash(images) ^
      const DeepCollectionEquality().hash(pdfs) ^
      const DeepCollectionEquality().hash(pdfsThumbnails);

  @override
  _$PostDetailStateCopyWith<_PostDetailState> get copyWith =>
      __$PostDetailStateCopyWithImpl<_PostDetailState>(this, _$identity);
}

abstract class _PostDetailState implements PostDetailState {
  const factory _PostDetailState(
      {String error,
      bool isLoading,
      int currentIndex,
      int imageIndex,
      List<ImageState> images,
      List<PDFDocument> pdfs,
      List<PDFPage> pdfsThumbnails}) = _$_PostDetailState;

  @override
  String get error;
  @override
  bool get isLoading;
  @override
  int get currentIndex;
  @override
  int get imageIndex;
  @override
  List<ImageState> get images;
  @override
  List<PDFDocument> get pdfs;
  @override
  List<PDFPage> get pdfsThumbnails;
  @override
  _$PostDetailStateCopyWith<_PostDetailState> get copyWith;
}
