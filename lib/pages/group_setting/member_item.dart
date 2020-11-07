import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:image_share_app/model/controllers/group_setting_controller/group_setting_controller.dart';
import 'package:image_share_app/model/entities/room.entity.dart';
import 'package:image_share_app/model/entities/user.entity.dart';
import 'package:image_share_app/widget/atoms/awesome_dialog.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum ItemType {
  addMember,
  member,
  invited,
  me,
}

class MemberItem extends ConsumerWidget {
  MemberItem(
    this._type,
    this._user,
  );
  final ItemType _type;
  final iconSize = 48.0;
  final UserState _user;

  void onSlidablePress(BuildContext context, String roomId) {
    final String title =
        (_type == ItemType.member) ? 'このユーザーを退会させます' : 'このユーザーの招待をキャンセルします';
    final desc = '本当に行いますか？';
    showOkCancelDialog(
      context,
      title,
      desc,
      () async {
        if (_type == ItemType.member) {
          await context
              .read(groupSettingController)
              .removeMember(_user.uid, roomId);
        } else if (_type == ItemType.invited) {
          await context
              .read(groupSettingController)
              .removeInvited(_user.uid, roomId);
        }
      },
    );
  }

  void onTap(BuildContext context) {
    if (_type == ItemType.addMember) {
      Navigator.of(context).pushNamed('memberInvite');
    } else if (_type == ItemType.me) {
      Navigator.of(context).pushNamed('selfSetting');
    }
  }

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final roomId = watch(roomStore.state).id;

    return Slidable(
      actionPane: const SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      enabled: (_type != ItemType.addMember && _type != ItemType.me),
      secondaryActions: [
        (_type != ItemType.addMember)
            ? (IconSlideAction(
                caption: (_type == ItemType.member) ? '退会させる' : 'キャンセル',
                color: Colors.red,
                icon: Icons.remove,
                onTap: () => onSlidablePress(context, roomId),
              ))
            : null,
      ],
      child: GestureDetector(
        onTap: () => onTap(context),
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
          child: Row(
            children: [
              SizedBox(
                height: iconSize,
                width: iconSize,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[400],
                    image: (_type != ItemType.addMember)
                        ? DecorationImage(
                            fit: BoxFit.fill,
                            image: (_user != null && _user.iconUrl.isNotEmpty)
                                ? NetworkImage(_user.iconUrl)
                                : const AssetImage('images/group_icon.jpeg'),
                          )
                        : null,
                  ),
                  child: (_type == ItemType.addMember)
                      ? const Icon(
                          Icons.add,
                          color: Colors.white,
                        )
                      : null,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  (_type == ItemType.addMember) ? '友達の招待' : _user.name ?? '',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
