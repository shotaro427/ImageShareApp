import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_share_app/model/entities/post.entity.dart';

class PdfViewPage extends StatelessWidget {
  PdfViewPage(this._post, this._pdf);
  final PostState _post;
  final PDFDocument _pdf;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: Text(_post.title),
          ),
          body: PDFViewer(
            document: _pdf,
          ),
        ),
      ],
    );
  }
}
