

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
  Stream value;

  /// ローディングタイプの変更を通知/発行
  loading(LoadingType isLoading);

  /// 破棄
  dispose();

}

class CommonLoadingWidget<T extends AbstractLoadingBloc> extends StatelessWidget {

  CommonLoadingWidget();

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<T>(context);
    return StreamBuilder(
      stream: bloc.value,
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
            return AlertDialog(
              title: const Text("完了しました"),
              content: const Text("ルーム作成が完了しました。"),
              actions: <Widget>[
                FlatButton(
                  child: const Text("OK"),
                  // TODO TOP画面に遷移させる
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            );
          }
          default: {
            return Container();
          }
        }
      },
    );
  }
}