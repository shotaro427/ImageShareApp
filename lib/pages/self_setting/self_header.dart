import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_share_app/model/controllers/self_setting_controller/self_setting_controller.dart';
import 'package:image_share_app/model/entities/user.entity.dart';

class SelfHeader extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final headerHeight = MediaQuery.of(context).size.width / 3.5;
    final iconSize = headerHeight * 0.8;

    final user = watch(userStore.state);

    return GestureDetector(
      onTap: context.read(selfSettingController).changeUserIcon,
      child: Container(
        margin: const EdgeInsets.only(bottom: 24, top: 24),
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
                    image: (user.iconUrl.isEmpty)
                        ? const AssetImage('images/group_icon.jpeg')
                        : NetworkImage(user.iconUrl),
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
    );
  }
}
