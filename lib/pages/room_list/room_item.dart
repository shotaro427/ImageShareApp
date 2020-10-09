import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_share_app/model/entities/room.entity.dart';

class RoomItem extends StatelessWidget {
  final RoomState group;

  RoomItem(this.group);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        height: 72,
        child: Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: (group.iconUrl != '')
                      ? NetworkImage(group.iconUrl)
                      : const AssetImage('images/group_icon.jpeg'),
                  radius: 25,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        group.name,
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            '参加者: ${group.member.length}',
                            style: const TextStyle(fontSize: 10),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
