import 'package:flutter/material.dart';
import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_share_app/model/controllers/post_detail_controller/post_detail_controller.dart';
import 'package:image_share_app/model/controllers/post_top_controller/post_top_controller.dart';
import 'package:image_share_app/widget/atoms/base_snack_barf.dart';

class FloatingButtons extends StatefulWidget {
  FloatingButtons();
  @override
  _FloatingButtonsState createState() => _FloatingButtonsState();
}

class _FloatingButtonsState extends State<FloatingButtons>
    with SingleTickerProviderStateMixin {
  _FloatingButtonsState();
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
    return _FloatingButtonsWidget(_animation, _animationController);
  }
}

class _FloatingButtonsWidget extends ConsumerWidget {
  _FloatingButtonsWidget(this._animation, this._animationController);
  final Animation<double> _animation;
  final AnimationController _animationController;

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final currentIndex = watch(postDetailController.state).currentIndex;

    void onPressedAdd() {
      if (currentIndex == 0) {
        context.read(postDetailController).pickUpImage();
      } else if (currentIndex == 1) {
        context.read(postDetailController).pickUpPdf();
      }
      _animationController.reverse();
    }

    void onPressedDelete() {
      if (currentIndex == 0) {
        // Delete image
      } else if (currentIndex == 1) {
        // Delete PDF
      }
    }

    return FloatingActionBubble(
      backGroundColor: Colors.white,
      // Menu items
      items: <Bubble>[
        // Floating action menu item
        Bubble(
          title: '削除',
          iconColor: Colors.white,
          bubbleColor: Colors.red,
          icon: Icons.delete,
          titleStyle: const TextStyle(fontSize: 16, color: Colors.white),
          onPress: onPressedDelete,
        ),
        // Floating action menu item
        Bubble(
          title: '追加',
          iconColor: Colors.white,
          bubbleColor: Colors.blue,
          icon: Icons.add,
          titleStyle: const TextStyle(fontSize: 16, color: Colors.white),
          onPress: onPressedAdd,
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
