import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_share_app/model/controllers/create_post_controller/create_post_controller.dart';

class CreatePostButtons extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final _files = watch(createPostController.state).pickedFiles;
    final extension = (_files != null && _files.length > 0)
        ? _files[0].path.split('/').last
        : '';

    return Scrollbar(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 32),
        child: (_files != null && _files.length > 0) // TODO: PDFを考慮する
            ? GestureDetector(
                onTap: () {
                  if (extension.contains('.pdf')) {
                    context.read(createPostController).pickUpPdf();
                  } else {
                    context.read(createPostController).pickUpImage();
                  }
                },
                child: SizedBox(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: const EdgeInsets.all(4),
                        child: SizedBox(
                          width: 108,
                          height: 108,
                          child: (extension.contains('.pdf'))
                              ? Image.asset(
                                  'images/pdf.png',
                                  fit: BoxFit.fitHeight,
                                )
                              : Image.file(
                                  _files[index],
                                  fit: BoxFit.cover,
                                ),
                        ),
                      );
                    },
                    itemCount: _files.length,
                  ),
                  height: 108,
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () =>
                        context.read(createPostController).pickUpImage(),
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
              ),
      ),
    );
  }
}
