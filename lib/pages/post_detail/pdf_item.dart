import 'package:flutter/material.dart';
import 'package:image_share_app/model/entities/pdf.entity.dart';
import 'package:image_share_app/model/entities/post.entity.dart';
import 'package:image_share_app/pages/pdf_view_page/pdf_view_page.dart';

class PdfItem extends StatelessWidget {
  PdfItem(this._pdf, this._post);
  final PdfState _pdf;
  final PostState _post;
  @override
  Widget build(BuildContext context) {
    // return PdfViewer(
    //   filePath: _pdf.pdfUrl,
    //   pageNumber: 1,
    // );
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => PdfViewPage(
            _post,
            _pdf.pdfUrl,
          ),
        ),
      ),
      child: Container(
        child: Text(_pdf.id),
      ),
    );
  }
}
