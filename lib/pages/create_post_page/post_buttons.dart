import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_share_app/model/controllers/create_post_controller/create_post_controller.dart';

class CreatePostButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () => context.read(createPostController).pickUpImage(),
          child: SizedBox(
            width: 108,
            height: 108,
            child: Container(
              child: const Icon(
                Icons.image,
                color: Colors.white,
                size: 60,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.grey[350],
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () => context.read(createPostController).pickUpPdf(),
          child: SizedBox(
            width: 108,
            height: 108,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(23.0),
                child: Image.asset('images/pdf-icon.png'),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.grey[350],
              ),
            ),
          ),
        )
      ],
    );
  }
}
