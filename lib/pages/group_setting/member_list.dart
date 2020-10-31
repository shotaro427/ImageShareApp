import 'package:flutter/material.dart';
import 'package:image_share_app/pages/group_setting/member_item.dart';

class MemberList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'メンバー 6人',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          } else if (index == 1) {
            return MemberItem(ItemType.addMember);
          } else if (index == 2) {
            return MemberItem(ItemType.me);
          } else {
            return MemberItem(ItemType.member);
          }
        },
        itemCount: 7,
      ),
    );
  }
}
