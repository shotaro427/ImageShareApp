import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_share_app/model/entities/image.entity.dart';
import 'package:image_share_app/model/entities/pdf.entity.dart';
part 'post_detail_state.freezed.dart';
part 'post_detail_state.g.dart';

@freezed
abstract class PostDetailState with _$PostDetailState {
  const factory PostDetailState({
    String error,
    @Default(false) bool isLoading,
    @Default(0) int currentIndex,
    @Default(0) int imageIndex,
    @Default([]) List<ImageState> images,
    @Default([]) List<PdfState> pdfs,
  }) = _PostDetailState;

  factory PostDetailState.fromJson(Map<String, dynamic> json) =>
      _$PostDetailStateFromJson(json);
}
