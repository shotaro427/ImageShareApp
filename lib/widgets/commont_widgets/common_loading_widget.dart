

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// ローディングタイプ
/// - NOT_YET: まだローディングしていない
/// - LOADING: ロード中
/// - COMPLETED: ロード完了
enum LoadingType {
  NOT_YET,
  LOADING,
  COMPLETED
}

abstract class AbstractLoadingBloc {

  /// 外部監視用のStream
  Stream loadingValue;

  /// 破棄
  dispose();

}

class CommonLoadingWidget<T extends AbstractLoadingBloc> extends StatelessWidget {

  final bool isShowDialog;
  final String dialogTitle;

  CommonLoadingWidget({ this.isShowDialog = true, this.dialogTitle = "" });

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<T>(context);
    return StreamBuilder(
      stream: bloc.loadingValue,
      initialData: false,
      builder: (context, snapshot) {
        switch(snapshot.data) {
          case LoadingType.NOT_YET:{
            return const SizedBox.shrink();
          }
          case LoadingType.LOADING: {
            return const DecoratedBox(
                decoration: const BoxDecoration(
                    color: const Color(0x44000000)
                ),
                child: const Center(
                  child: const CircularProgressIndicator(),
                )
            );
          }
          case LoadingType.COMPLETED: {
            return  (isShowDialog)
              ? AlertDialog(
                title: const Text("完了しました"),
                content: (isShowDialog)
                  ? Text("$dialogTitleが完了しました")
                  : null,
                actions: <Widget>[
                  FlatButton(
                    child: const Text("OK"),
                    // TODO TOP画面に遷移させる
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              )
                : Container();
          }
          default: {
            return Container();
          }
        }
      },
    );
  }
}