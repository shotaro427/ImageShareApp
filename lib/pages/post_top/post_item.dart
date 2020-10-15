import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PostItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          SizedBox(
            height: 140,
            child: Image.asset(
              'images/icon.jpeg',
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          const Text(
            '情報処理入門',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
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
