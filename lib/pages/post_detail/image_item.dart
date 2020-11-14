import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_share_app/model/controllers/post_detail_controller/post_detail_controller.dart';

class ImageItem extends StatelessWidget {
  ImageItem(this.index, this.url);
  final int index;
  final String url;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.read(postDetailController).switchMainImage(index),
      child: Container(
        alignment: Alignment.center,
        child: Image.network(
          url,
          fit: BoxFit.cover,
          height: MediaQuery.of(context).size.width / 2,
        ),
      ),
    );
  }
}
