import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class RoundRaisedButton extends StatelessWidget {
  const RoundRaisedButton(this.text, this.onPress,
      {@Default(Colors.blue) this.background,
      @Default(Colors.black) this.textColor});

  final String text;
  final Function onPress;
  final Color background;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text(
        '${text}',
        textAlign: TextAlign.left,
        style: TextStyle(
            fontSize: 16, fontWeight: FontWeight.w600, color: textColor),
      ),
      onPressed: onPress,
      color: background,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      highlightElevation: 16.0,
    );
  }
}
