import 'package:flutter/material.dart';

class SettingItem extends StatelessWidget {
  SettingItem(this._index);
  final int _index;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: _index != 3,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _itemTexts(),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _itemTexts() {
    if ([0, 1, 2].contains(_index)) {
      return [
        Text(
          _switchTitle(_index),
          style: const TextStyle(color: Colors.grey),
        ),
        Text(
          'テストっテスト',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ];
    } else {
      return [
        Text(
          (_index == 4) ? '個人情報保護指針' : 'お問い合わせ',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ];
    }
  }

  String _switchTitle(int _index) {
    switch (_index) {
      case 0:
        return '名前';
      case 1:
        return 'メールアドレス';
      case 2:
        return 'ユーザーID（招待に使われます）';
      default:
        return '';
    }
  }
}
