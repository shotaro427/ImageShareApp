import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:image_share_app/model/entities/user.entity.dart';

enum ItemType {
  addMember,
  member,
  invited,
  me,
}

class MemberItem extends StatelessWidget {
  MemberItem(
    this._type,
    this._user,
  );
  final ItemType _type;
  final iconSize = 48.0;
  final UserState _user;
  @override
  Widget build(BuildContext context) {
    void onTap() {
      if (_type == ItemType.addMember) {
        Navigator.of(context).pushNamed('memberInvite');
      } else if (_type == ItemType.me) {
        Navigator.of(context).pushNamed('selfSetting');
      }
    }

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
                onTap: () => {},
              ))
            : null,
      ],
      child: GestureDetector(
        onTap: onTap,
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
