import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

void showOkDialog(BuildContext context) {
  AwesomeDialog(
    context: context,
    headerAnimationLoop: false,
    tittle: '削除しました',
    desc: '削除が完了しました。',
    dialogType: DialogType.SUCCES,
    animType: AnimType.SCALE,
    btnOkText: 'OK',
    btnOkOnPress: () => Navigator.of(context).pop(),
  ).show();
}

void showOkCancelDialog(
  BuildContext context,
  String title,
  String description,
  Function onOkPress,
) {
  AwesomeDialog(
    context: context,
    headerAnimationLoop: false,
    animType: AnimType.SCALE,
    tittle: title,
    dialogType: DialogType.INFO,
    desc: description,
    btnOkText: 'OK',
    btnCancelText: 'キャンセル',
    btnCancelOnPress: () {},
    btnOkOnPress: onOkPress,
  ).show();
}

void showErrorDialog(BuildContext context) {
  AwesomeDialog(
    context: context,
    headerAnimationLoop: false,
    tittle: 'エラー',
    desc: 'グループを作成できませんでした。\n通信状況などを確認してから、もう一度お試しください',
    dialogType: DialogType.ERROR,
    animType: AnimType.SCALE,
    btnOkText: 'OK',
    btnOkOnPress: () {},
  ).show();
}
