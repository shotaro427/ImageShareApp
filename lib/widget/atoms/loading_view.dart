import 'package:flutter/material.dart';

class LoadingView extends StatelessWidget {
  LoadingView(this.isLoading);
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const DecoratedBox(
            decoration: BoxDecoration(
              color: Color(0x44000000),
            ),
            child: Center(
              child: const CircularProgressIndicator(),
            ),
          )
        : const SizedBox.shrink();
  }
}
