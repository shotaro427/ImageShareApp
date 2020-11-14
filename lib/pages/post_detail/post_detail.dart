import 'package:flutter/material.dart';
import 'package:image_share_app/model/controllers/post_detail_controller/post_detail_controller.dart';
import 'package:image_share_app/model/entities/post.entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_share_app/pages/post_detail/post_image_list.dart';
import 'package:image_share_app/pages/post_detail/post_pdf_list.dart';

class PostDetail extends StatelessWidget {
  PostDetail(this._postState);
  final PostState _postState;

  @override
  Widget build(BuildContext context) {
    final _widgets = [
      PostImageList(_postState),
      PostPdfList(_postState),
    ];

    return PageView(
      controller: context.read(postDetailController).pageController,
      children: _widgets,
      onPageChanged: context.read(postDetailController).switchIndex,
    );
  }
}
