import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';
import 'package:image_share_app/model/entities/post.entity.dart';

class PdfViewPage extends StatelessWidget {
  PdfViewPage(this._post, this._pdfPath);
  final PostState _post;
  final String _pdfPath;

  @override
  Widget build(BuildContext context) {
    return PDFViewerScaffold(
      appBar: AppBar(
        title: Text(_post.title),
      ),
      path: _pdfPath,
    );
  }
}
