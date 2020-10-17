import 'package:freezed_annotation/freezed_annotation.dart';
part 'pdf.entity.freezed.dart';
part 'pdf.entity.g.dart';

@freezed
abstract class PdfState with _$PdfState {
  const factory PdfState({
    int createdAt,
    int updateAt,
    @Default('') String id,
    @Default('') String pdfUrl,
    @Default('') String createUserId,
  }) = _PdfState;

  factory PdfState.fromJson(Map<String, dynamic> json) =>
      _$PdfStateFromJson(json);
}
