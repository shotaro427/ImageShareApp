import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_share_app/model/controllers/self_setting_controller/self_setting_controller.dart';
import 'package:image_share_app/model/entities/user.entity.dart';
import 'package:image_share_app/widget/atoms/awesome_dialog.dart';
import 'package:image_share_app/widget/atoms/base_snack_barf.dart';

class SettingItem extends ConsumerWidget {
  SettingItem(this._index);
  final int _index;

  void onTap(BuildContext context) async {
    var isShowSnackBar;
    switch (_index) {
      case 0:
        var result = await Navigator.of(context).pushNamed('editName');
        isShowSnackBar = result;
        break;
      case 1:
        var result = await Navigator.of(context).pushNamed('editEmail');
        isShowSnackBar = result;

        break;
      case 2:
        var result = await Navigator.of(context).pushNamed('editId');
        isShowSnackBar = result;

        break;
      case 6:
        showOkCancelDialog(
          context,
          'ログアウトします。',
          'このままログアウトしますか？',
          () => context.read(selfSettingController).logout(context),
        );
        break;
      default:
    }

    if (isShowSnackBar) {
      Scaffold.of(context).showSnackBar(baseSnackBar(context, '保存しました'));
    }
  }

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final UserState me = watch(userStore.state);
    return GestureDetector(
      onTap: () => onTap(context),
      child: Visibility(
        visible: _index != 3,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: (_index == 6)
                ? MainAxisAlignment.center
                : MainAxisAlignment.spaceBetween,
            children: _itemColumn(_index, me),
          ),
        ),
      ),
    );
  }

  List<Widget> _itemColumn(int _index, UserState me) {
    if (_index == 6) {
      return [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: _itemTexts(me),
        ),
      ];
    } else {
      return [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: _itemTexts(me),
        ),
        const Icon(
          Icons.arrow_forward_ios,
          color: Colors.grey,
        ),
      ];
    }
  }

  List<Widget> _itemTexts(UserState me) {
    switch (_index) {
      case 0:
      case 1:
      case 2:
        return [
          Text(
            _switchTitle(_index),
            style: const TextStyle(color: Colors.grey),
          ),
          Text(
            _switchContent(_index, me),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ];
      case 4:
      case 5:
      case 6:
        return [
          Text(
            _switchTitle(_index),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: (_index == 6) ? Colors.red : Colors.black,
            ),
          ),
        ];
      default:
        return [const SizedBox.shrink()];
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
      case 4:
        return '個人情報保護指針';
      case 5:
        return 'お問い合わせ';
      case 6:
        return 'ログアウト';
      default:
        return '';
    }
  }

  String _switchContent(int index, UserState me) {
    switch (_index) {
      case 0:
        return me.name;
      case 1:
        return me.email;
      case 2:
        return me.id;
      default:
        return '';
    }
  }
}
