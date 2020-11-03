import 'package:flutter/material.dart';

class SelfHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final headerHeight = MediaQuery.of(context).size.width / 3.5;
    final iconSize = headerHeight * 0.8;

    return Container(
      margin: const EdgeInsets.only(bottom: 24, top: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
            height: iconSize,
            width: iconSize,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(iconSize / 2),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Image.asset(
                    'images/take_image.png',
                    scale: 1.1,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
