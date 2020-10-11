import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:image_share_app/model/controllers/app_start_controller/app_start_controller.dart';
import 'package:image_share_app/widget/atoms/index.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppStartButtons extends ConsumerWidget {
  AppStartButtons(this._key);

  final GlobalKey<ScaffoldState> _key;
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final state = watch(appStartController.state);
    return state.isLoading
        ? const Center(child: CircularProgressIndicator())
        : Center(
            child: SizedBox(
              width: 250,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Appleでログイン
                  _AppleSignInButton(_key),
                  const SizedBox(height: 10),
                  // Googleでログイン
                  _GoogleSignInButton(_key),
                  const SizedBox(height: 10),
                  // メアドでログイン
                  _MailSignInButton(),
                  const SizedBox(height: 10),
                  const Text(
                    'or',
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 10),
                  // 新規登録ボタン
                  _CreateNewAccountButton(),
                ],
              ),
            ),
          );
  }
}

class _AppleSignInButton extends ConsumerWidget {
  _AppleSignInButton(this._key);
  final GlobalKey<ScaffoldState> _key;
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final Function onPress =
        () => context.read(appStartController).loginWithApple(_key);

    return AppleSignInButton(
      style: AppleButtonStyle.white,
      text: 'Appleでログイン',
      textStyle: const TextStyle(fontSize: 19),
      borderRadius: 10,
      onPressed: onPress,
    );
  }
}

class _GoogleSignInButton extends ConsumerWidget {
  _GoogleSignInButton(this._key);
  final GlobalKey<ScaffoldState> _key;
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final Function onPress =
        () => context.read(appStartController).loginWithGoogle(_key);

    return GoogleSignInButton(
      text: 'Googleでログイン',
      textStyle: const TextStyle(color: Colors.black, fontSize: 19),
      borderRadius: 10,
      onPressed: onPress,
    );
  }
}

class _MailSignInButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Function onPress =
        () => context.read(appStartController).navigateToMailSignin(context);
    return SizedBox(
      height: 45,
      child: RoundRaisedButton(
        'メールアドレスでログイン',
        onPress,
        background: Colors.white,
      ),
    );
  }
}

class _CreateNewAccountButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Function onPress =
        () => context.read(appStartController).navigateToMailSignup(context);
    return InkWell(
      child: const Text(
        'メールアドレスで登録',
        textAlign: TextAlign.center,
        style: const TextStyle(
            color: Colors.blueAccent,
            fontSize: 18,
            decoration: TextDecoration.underline),
      ),
      onTap: onPress,
    );
  }
}
