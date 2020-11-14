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
    final pdfs = watch(postDetailController.state).pdfs;
    return (pdfs.length > 0)
        ? GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: (BuildContext context, int index) =>
                PdfItem(pdfs[index], _post),
            itemCount: pdfs.length,
          )
        : const Center(
            child: Text('PDFの投稿はありません'),
          );
  }
}
