import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_share_app/model/controllers/group_setting_controller/group_setting_controller.dart';
import 'package:image_share_app/model/entities/user.entity.dart';
import 'package:image_share_app/pages/group_setting/member_item.dart';

class MemberList extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final groupSettingState = watch(groupSettingController.state);
    final me = watch(userStore.state);
    final memberRemoveMe = List.from(groupSettingState.member);
    memberRemoveMe.removeWhere((user) => user.uid == me.uid);

    return Expanded(
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'メンバー ${groupSettingState.member.length}人',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          } else if (index == 1) {
            return MemberItem(
              ItemType.addMember,
              null,
            );
          } else if (index == 2) {
            return MemberItem(
              ItemType.me,
              me,
            );
          } else if (index == memberRemoveMe.length + 3) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                '招待中 ${groupSettingState.invited.length}人',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          } else {
            return MemberItem(
              ItemType.member,
              memberRemoveMe[index - 2],
            );
          }
        },
        itemCount: memberRemoveMe.length + groupSettingState.invited.length + 4,
      ),
    );
  }
}
