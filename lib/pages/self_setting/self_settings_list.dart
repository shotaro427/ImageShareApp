import 'package:flutter/material.dart';
import 'package:image_share_app/constants/color.dart';
import 'package:image_share_app/pages/self_setting/setting_item.dart';

class SelfSettingsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: 64,
            child: Container(
              child: SettingItem(index),
              decoration: BoxDecoration(
                color: (index == 3) ? Colors.transparent : Colors.white,
                border: Border(
                  bottom: BorderSide(
                    width: 2,
                    color: ([
                      2,
                      3,
                    ].contains(index))
                        ? Colors.transparent
                        : backgroundColor,
                  ),
                ),
              ),
            ),
          );
        },
        itemCount: 7,
      ),
    );
  }
}
