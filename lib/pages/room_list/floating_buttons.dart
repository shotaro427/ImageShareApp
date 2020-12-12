import 'package:flutter/material.dart';
import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:image_share_app/model/controllers/self_setting_controller/self_setting_controller.dart';
import 'package:image_share_app/services/analytics_service.dart';
import 'package:image_share_app/widget/atoms/awesome_dialog.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FloatingButtons extends StatefulWidget {
  @override
  _FloatingButtonsState createState() => _FloatingButtonsState();
}

class _FloatingButtonsState extends State<FloatingButtons>
    with SingleTickerProviderStateMixin {
  Animation<double> _animation;
  AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 260),
    );

    final curvedAnimation =
        CurvedAnimation(curve: Curves.easeInOut, parent: _animationController);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);
    super.initState();
  }

  void _navigateCreateRoomPage(BuildContext context) {
    _animationController.reverse();
    AnalyticsService().sendButtonEvent(buttonName: 'グループ作成(未完了)');
    Navigator.of(context).pushNamed('createRoom');
  }

  void _navigateInvitedRoomPage(BuildContext context) {
    _animationController.reverse();
    AnalyticsService().sendButtonEvent(buttonName: '招待ページ遷移');
    Navigator.of(context).pushNamed('invitedRoomList');
  }

  void logout(BuildContext context) {
    showOkCancelDialog(
      context,
      'ログアウトします。',
      'このままログアウトしますか？',
      () {
        AnalyticsService().sendButtonEvent(buttonName: 'ログアウト');
        context.read(selfSettingController).logout(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionBubble(
      backGroundColor: Colors.white,
      // Menu items
      items: <Bubble>[
        // Floating action menu item
        Bubble(
          title: 'ログアウト',
          iconColor: Colors.white,
          bubbleColor: Colors.red,
          icon: Icons.exit_to_app,
          titleStyle: const TextStyle(fontSize: 16, color: Colors.white),
          onPress: () => logout(context),
        ),
        Bubble(
          title: '招待グループ',
          iconColor: Colors.white,
          bubbleColor: Colors.blue,
          icon: Icons.mail,
          titleStyle: const TextStyle(fontSize: 16, color: Colors.white),
          onPress: () => _navigateInvitedRoomPage(context),
        ),
        // Floating action menu item
        Bubble(
          title: 'グループ作成',
          iconColor: Colors.white,
          bubbleColor: Colors.blue,
          icon: Icons.people,
          titleStyle: const TextStyle(fontSize: 16, color: Colors.white),
          onPress: () => _navigateCreateRoomPage(context),
        ),
      ],
      animation: _animation,
      onPress: () {
        _animationController.isCompleted
            ? _animationController.reverse()
            : _animationController.forward();
      },
      iconColor: Colors.blue,
      iconData: Icons.menu,
    );
  }
}
