import 'package:flutter/material.dart';

class SelfHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final headerHeight = MediaQuery.of(context).size.width / 3.5;
    final iconSize = headerHeight * 0.8;

    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      child: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                height: headerHeight,
                child: Stack(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Image.asset(
                          'images/take_image.png',
                          scale: 1.1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    margin:
                        EdgeInsets.only(top: headerHeight / 2 * 1.2, left: 8),
                    child: SizedBox(
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
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
