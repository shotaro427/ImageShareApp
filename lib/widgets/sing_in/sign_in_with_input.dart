import 'dart:developer';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:image_share_app/models/sign_in_model/sign_in_with_email_model.dart';
import 'package:image_share_app/repositories/sign_in_repositories/sign_in_with_email_repository.dart';
import 'package:provider/provider.dart';

/// メールアドレスとパスワードを入力してログインするページ
class SignInWithEmail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StateNotifierProvider<SignInWithEmailStateNotifier,
            SignInWithEmailState>(
        create: (_) =>
            SignInWithEmailStateNotifier(SignInWithEmailRepository()),
        child: _SignInWithEmailWidget());
  }
}

class _SignInWithEmailWidget extends StatelessWidget {
  // メールアドレスとパスワードを入力する箇所のController
  final emailInputController = new TextEditingController();
  final passwordInputController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    // emailInputController.text = "teat1@test.com";
    // passwordInputController.text = "password";

    return Stack(
      children: <Widget>[
        Scaffold(
          appBar: AppBar(
            title: const Text("ログイン"),
          ),
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
                        color: Theme.of(context).primaryColor,
                        textColor: Colors.white,
                        child: const Text('ログイン'),
                        onPressed: () async => await _handleSignIn(context),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        _LoadingWidget()
      ],
    );
  }

  Future<void> _handleSignIn(BuildContext context) async {
    final email = emailInputController.text;
    final password = passwordInputController.text;

    await context
        .read<SignInWithEmailStateNotifier>()
        .logInWithEmail(email, password);

    // ルーム一覧に遷移
    Provider.of<SignInWithEmailState>(context, listen: false).maybeWhen(null,
        success: (user) => (user != null)
            ? context
                .read<SignInWithEmailStateNotifier>()
                .transitionRoomListPage(user, context)
            : null,
        error: (_) => _showErrorDialog(context),
        orElse: () => log('SignInWithEmailState is not success or error'));
  }

  void _showErrorDialog(BuildContext context) {
    AwesomeDialog(
            context: context,
            headerAnimationLoop: false,
            animType: AnimType.SCALE,
            tittle: 'エラー',
            dialogType: DialogType.ERROR,
            desc: 'ログインできませんでした。\nもう一度お確かめください',
            btnOkText: 'OK',
            btnOkOnPress: () {})
        .show();
  }
}

class _LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider.of<SignInWithEmailState>(context).maybeWhen(
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
