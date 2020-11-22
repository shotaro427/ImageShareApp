import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_share_app/model/controllers/post_detail_controller/post_detail_controller.dart';
import 'package:image_share_app/model/entities/post.entity.dart';
import 'package:image_share_app/pages/post_detail/pdf_item.dart';

class PostPdfList extends ConsumerWidget {
  PostPdfList(this._post);
  final PostState _post;
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final state = watch(postDetailController.state);
    return (state.pdfs.length > 0)
        ? GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.8,
            ),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
            itemBuilder: (BuildContext context, int index) =>
                PdfItem(state.pdfs[index], state.pdfsThumbnails[index], _post),
            itemCount: state.pdfs.length,
          )
        : const Center(
            child: Text('PDFの投稿はありません'),
          );
  }
}
