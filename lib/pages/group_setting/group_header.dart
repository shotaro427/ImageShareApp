import 'package:flutter/material.dart';

class GroupHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final headerHeight = MediaQuery.of(context).size.width / 3.5;
    final iconSize = headerHeight * 0.8;

    return Column(
      children: [
        Stack(
          children: [
            SizedBox(
              height: headerHeight,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.blue,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.only(top: headerHeight / 2 * 1.2, left: 8),
                  child: SizedBox(
                    height: iconSize,
                    width: iconSize,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(iconSize / 2),
                      ),
                    ),
                  ),
                ),
                Text(
                  '俺たちの戦いはこれからだ',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
