import 'package:flutter/material.dart';

enum SectionType {
  tag,
  memo,
}

class SectionHeader extends StatelessWidget {
  SectionHeader(this._type);
  final SectionType _type;

  @override
  Widget build(BuildContext context) {
    String title = 'メモ';
    IconData data = Icons.note;

    switch (_type) {
      case SectionType.memo:
        title = 'メモ';
        data = Icons.note;
        break;
      case SectionType.tag:
        title = 'タグ';
        data = Icons.local_offer;
        break;
      default:
    }

    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            Icon(
              data,
              color: Colors.blue,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
      color: Colors.white,
    );
  }
}
