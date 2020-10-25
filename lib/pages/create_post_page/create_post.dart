import 'package:flutter/material.dart';
import 'package:image_share_app/pages/create_post_page/post_button.dart';
import 'package:image_share_app/pages/create_post_page/post_buttons.dart';
import 'package:image_share_app/pages/create_post_page/section_header.dart';
import 'package:image_share_app/pages/create_post_page/tag_list.dart';

class CreatePost extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height - 56,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 56),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CreatePostButtons(),
                  SectionHeader(SectionType.tag),
                  TagList(),
                  SectionHeader(SectionType.memo),
                  SizedBox(
                    height: 176,
                    child: Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: PostButton(),
        ),
      ],
    );
  }
}
