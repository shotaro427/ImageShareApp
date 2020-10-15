import 'package:flutter/material.dart';
import 'package:floating_action_bubble/floating_action_bubble.dart';

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

  void _navigateCreatePostPage(BuildContext context) {
    _animationController.reverse();
    // TODO: 投稿画面への遷移
  }

  void _navigateSettingsPage(BuildContext context) {
    _animationController.reverse();
    // TODO: 設定画面への遷移
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionBubble(
      backGroundColor: Colors.white,
      // Menu items
      items: <Bubble>[
        // Floating action menu item
        Bubble(
          title: '設定',
          iconColor: Colors.white,
          bubbleColor: Colors.blue,
          icon: Icons.settings,
          titleStyle: const TextStyle(fontSize: 16, color: Colors.white),
          onPress: () => _navigateSettingsPage(context),
        ),
        // Floating action menu item
        Bubble(
          title: '新規投稿',
          iconColor: Colors.white,
          bubbleColor: Colors.blue,
          icon: Icons.image,
          titleStyle: const TextStyle(fontSize: 16, color: Colors.white),
          onPress: () => _navigateCreatePostPage(context),
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
