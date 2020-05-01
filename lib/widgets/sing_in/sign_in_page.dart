import 'dart:developer';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:image_share_app/models/sign_in_model/sign_in_page_model.dart';
import 'package:image_share_app/repositories/sign_in_repositories/sign_in_page_repository.dart';
import 'package:image_share_app/widgets/sing_in/sign_in_with_input.dart';
import 'package:image_share_app/widgets/sing_in/sign_up_with_input.dart';
import 'package:provider/provider.dart';
import 'sign_in_with_input.dart';

class SignInPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StateNotifierProvider<SignInStateNotifier, SignInState>(
      create: (_) => SignInStateNotifier(SignInPageRepository()),
      child: _SignInView()
    );
  }
}

class _SignInView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Scaffold(
          appBar: AppBar(
            title: const Text('ログイン'),
          ),
          body: Center(
            child: SizedBox(
              width: 250,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    RaisedButton(
                      child: const Text('Googleアカウントでログイン'),
                      onPressed: () async {
                        await context.read<SignInStateNotifier>().handleSignIn();

                        // ルーム一覧に遷移
                        context.read<SignInState>().maybeWhen(
                          null,
                          success: (isCompleted) => (isCompleted) ? context.read<SignInStateNotifier>().transitionNextPage(context) : null,
                          error: (_) => _showErrorDialog(context),
                          orElse: () => log('SignInState is not success or error')
                        );
                      },
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      highlightElevation: 16.0,
                      highlightColor: Colors.blue,
                      onHighlightChanged: (value) {},
                    ),
                    RaisedButton(
                      child: const Text('メールアドレスでログイン'),
                      onPressed: () => _transitionSignInPage(context),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      highlightElevation: 16.0,
                      highlightColor: Colors.blue,
                      onHighlightChanged: (value) {},
                    ),
                    const Center(child: const Text('or', style: TextStyle(fontSize: 20),)),
                    RaisedButton(
                      child: const Text('メールアドレスで登録'),
                      onPressed: () => _transitionSignUpPage(context),
                      color: Colors.white,
                      shape: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      highlightElevation: 16.0,
                      highlightColor: Colors.blue,
                      onHighlightChanged: (value) {},
                    ),
                  ]
              ),
            ),
          ),
        ),
        _LoadingWidget()
      ],
    );
  }

  /// エラーダイアログを表示する
  void _showErrorDialog(BuildContext context) {
    AwesomeDialog(
      context: context,
      headerAnimationLoop: false,
      animType: AnimType.SCALE,
      tittle: 'エラー',
      dialogType: DialogType.ERROR,
      desc: 'ログインできませんでした。\nもう一度お確かめください',
      btnOkText: 'OK',
      btnOkOnPress: () {}
    ).show();
  }

  /// 「メールアドレスでログイン」を押下したときの遷移処理
  void _transitionSignInPage(BuildContext context) {
    Navigator.of(context).push(
        MaterialPageRoute(
            builder: (BuildContext context) => SignInWithEmail(),
            fullscreenDialog: true
        )
    );
  }

  /// 「メールアドレスで登録」を押下したときの遷移処理
  void _transitionSignUpPage(BuildContext context) {
    Navigator.of(context).push(
        MaterialPageRoute(
            builder: (BuildContext context) => SignUpWithEmail(),
            fullscreenDialog: true
        )
    );
  }
}

class _LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return context.watch<SignInState>().maybeWhen(
      null,
      loading: () => const DecoratedBox(
                        decoration: BoxDecoration(
                          color: Color(0x44000000),
                        ),
                        child: Center(child: const CircularProgressIndicator()),
                      ),
      orElse: () => const SizedBox.shrink(),
    );
  }
}
