import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:image_share_app/models/sign_in_page_model.dart';
import 'package:image_share_app/repositories/room_list_repository.dart';
import 'package:image_share_app/widgets/sing_in/sign_in_with_input.dart';
import 'package:image_share_app/widgets/sing_in/sign_up_with_input.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'sign_in_with_input.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_share_app/widgets/room_list/room_list.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StateNotifierProvider<SignInStateNotifier, SignInState>(
      create: (BuildContext context) => SignInStateNotifier(),
      child: _SignInView()
    );
  }
}

class _SignInView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      success: (isCompleted) => (isCompleted) ? context.read<SignInStateNotifier>().transitionNextPage(context) : null,
                      orElse: () => debugPrint('orElse')
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
    );
  }

  /// 「メールアドレスでログイン」を押下したときの遷移処理
  void _transitionSignInPage(BuildContext context) {
    Navigator.of(context).push(
        MaterialPageRoute(
            builder: (BuildContext context) => SignInWithInput(),
            fullscreenDialog: true
        )
    );
  }

  /// 「メールアドレスで登録」を押下したときの遷移処理
  void _transitionSignUpPage(BuildContext context) {
    Navigator.of(context).push(
        MaterialPageRoute(
            builder: (BuildContext context) => SignUpWithInput(),
            fullscreenDialog: true
        )
    );
  }
}

