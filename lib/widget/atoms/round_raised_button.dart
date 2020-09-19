import 'package:flutter/material.dart';

class RoundRaisedButton extends StatelessWidget {
  const RoundRaisedButton(this.text, this.onPress);

  final String text;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Text(
          '${text}',
          textAlign: TextAlign.left,
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
        ),
      ),
      onPressed: onPress,
      color: Colors.blue,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      highlightElevation: 16.0,
    );
  }
}
