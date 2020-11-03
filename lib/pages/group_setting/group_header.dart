import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_share_app/model/controllers/group_setting_controller/group_setting_controller.dart';
import 'package:image_share_app/model/entities/room.entity.dart';

class GroupHeader extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final headerHeight = MediaQuery.of(context).size.width / 3.5;
    final iconSize = headerHeight * 0.8;

    final RoomState _room = watch(roomStore.state);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: context.read(groupSettingController).changeGroupHeaderImage,
            child: SizedBox(
              height: iconSize,
              width: iconSize,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: (_room.iconUrl.isEmpty)
                            ? const AssetImage('images/group_icon.jpeg')
                            : NetworkImage(_room.iconUrl),
                      ),
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
          Container(
            margin: const EdgeInsets.only(left: 8),
            child: Text(
              _room.name,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
