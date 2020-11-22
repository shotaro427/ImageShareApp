import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:image_share_app/model/entities/post.entity.dart';
import 'package:image_share_app/pages/pdf_view_page/pdf_view_page.dart';

class PdfItem extends StatelessWidget {
  PdfItem(this._pdf, this._page, this._post);
  final PDFDocument _pdf;
  final PDFPage _page;
  final PostState _post;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => PdfViewPage(
            _post,
            _pdf,
          ),
        ),
      ),
      child: Center(
        child: _page,
      ),
    );
  }
}
