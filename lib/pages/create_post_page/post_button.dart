import 'package:flutter/material.dart';

class PostButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      width: MediaQuery.of(context).size.width,
      child: Container(
        child: const Center(
          child: Text(
            '投稿する',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        decoration: const BoxDecoration(color: Colors.blue),
      ),
    );
  }
}
