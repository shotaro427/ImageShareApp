
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:image_share_app/models/sign_in_model/sign_up_with_email_model.dart';
import 'package:image_share_app/repositories/sign_in_repositories/sign_up_with_email_repository.dart';

/// ユーザー登録画面
class SignUpWithEmail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StateNotifierProvider<SignUpWithEmailStateNotifier, SignUpWithEmailState>(
      create: (_) => SignUpWithEmailStateNotifier(SignUpWithEmailRepository()),
      child: _SignUpWithEmailWidget(),
    );
  }
}

class _SignUpWithEmailWidget extends StatelessWidget {
  // メールアドレスとパスワードのController
  final emailInputController = new TextEditingController();
  final passwordInputController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Scaffold(
          appBar: AppBar(title: const Text("登録"),),
          body: Center(
            child: Form(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    const SizedBox(height: 24.0),
                    TextFormField(
                      controller: emailInputController,
                      decoration: const InputDecoration(
                        border: const UnderlineInputBorder(),
                        labelText: 'Email',
                      ),
                    ),
                    const SizedBox(height: 24.0),
                    TextFormField(
                      controller: passwordInputController,
                      decoration: const InputDecoration(
                        border: const UnderlineInputBorder(),
                        labelText: 'Password',
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(height: 24.0),
                    Center(
                      child: RaisedButton(
                        child: const Text('SingUp'),
                        onPressed: () async => await _handleSignUp(context),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        _LoadingWidget(),
      ],
    );
  }

  /// 登録処理
  Future<void> _handleSignUp(BuildContext context) async {
    final email = emailInputController.text;
    final password = passwordInputController.text;
    // 登録
    await context.read<SignUpWithEmailStateNotifier>().signUp(email, password);

    // ルーム一覧に遷移
    context.read<SignUpWithEmailState>().maybeWhen(
        null,
        success: (user) => (user != null) ? context.read<SignUpWithEmailStateNotifier>().transitionRoomListPage(user, context) : null,
        error: (_) => _showErrorDialog(context),
        orElse: () => log('SignUpWithEmailState is not success or error')
    );

    log(context.read<SignUpWithEmailState>().toString());
  }

  /// エラーダイアログを表示する
  void _showErrorDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('エラー'),
            content: const Text('ログインできませんでした。\nメールアドレスとパスワードをもう一度お確かめください'),
            actions: <Widget>[
              FlatButton(
                child: const Text('OK'),
                onPressed: () => Navigator.of(context).pop(),
              )
            ],
          );
        }
    );
  }
}

class _LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return context.watch<SignUpWithEmailState>().maybeWhen(
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
