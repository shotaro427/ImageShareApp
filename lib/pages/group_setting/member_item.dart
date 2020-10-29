import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

enum ItemType {
  addMember,
  member,
  invited,
}

class MemberItem extends StatelessWidget {
  MemberItem(this._type);
  final ItemType _type;
  final iconSize = 48.0;
  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: const SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      enabled: (_type != ItemType.addMember),
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
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        child: Row(
          children: [
            SizedBox(
              height: iconSize,
              width: iconSize,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(iconSize / 2),
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
                (_type == ItemType.addMember) ? '友達の招待' : '名前です。',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
