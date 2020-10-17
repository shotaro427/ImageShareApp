import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_share_app/pages/post_top/tag_list.dart';

class PostItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: SizedBox(
              height: (MediaQuery.of(context).size.width - 40),
              child: Image.asset(
                'images/icon.jpeg',
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Center(
            child: Text(
              '情報処理入門',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          TagList(),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: const [
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(
                  right: 15,
                  bottom: 15,
                ),
                child: Text(
                  '3時間前',
                  style: TextStyle(
                    fontSize: 10,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
