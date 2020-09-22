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

  @override
  Widget build(BuildContext context) {
    return FloatingActionBubble(
      backGroundColor: Colors.white,
      // Menu items
      items: <Bubble>[
        // Floating action menu item
        Bubble(
          title: '招待グループ',
          iconColor: Colors.white,
          bubbleColor: Colors.blue,
          icon: Icons.mail,
          titleStyle: const TextStyle(fontSize: 16, color: Colors.white),
          onPress: _animationController.reverse,
        ),
        // Floating action menu item
        Bubble(
          title: 'グループ作成',
          iconColor: Colors.white,
          bubbleColor: Colors.blue,
          icon: Icons.people,
          titleStyle: const TextStyle(fontSize: 16, color: Colors.white),
          onPress: _animationController.reverse,
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
