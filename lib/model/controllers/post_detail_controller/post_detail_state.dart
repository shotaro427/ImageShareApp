import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_share_app/model/entities/image.entity.dart';
part 'post_detail_state.freezed.dart';

@freezed
abstract class PostDetailState with _$PostDetailState {
  const factory PostDetailState({
    String error,
    @Default(false) bool isLoading,
    @Default(0) int currentIndex,
    @Default(0) int imageIndex,
    @Default([]) List<ImageState> images,
    @Default([]) List<PDFDocument> pdfs,
    @Default([]) List<PDFPage> pdfsThumbnails,
  }) = _PostDetailState;
}
