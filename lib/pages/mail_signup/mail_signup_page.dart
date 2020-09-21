import 'package:flutter/material.dart';
import 'package:image_share_app/constants/color.dart';
import 'package:image_share_app/widget/atoms/index.dart';

class MailSignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('メールアドレスで登録'),
      ),
      body: _SignupForm(),
      backgroundColor: backgroundColor,
    );
  }
}

class _SignupForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(height: 24.0),
              TextFormField(
                // controller: emailInputController, // TODO: emialのTextControllerを追加
                decoration: const InputDecoration(
                  border: const UnderlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
              const SizedBox(height: 24.0),
              TextFormField(
                // controller: passwordInputController, // TODO: passwordのTextControllerを追加
                decoration: const InputDecoration(
                  border: const UnderlineInputBorder(),
                  labelText: 'Password',
                ),
                obscureText: true,
              ),
              const SizedBox(height: 24.0),
              Center(
                child: RoundRaisedButton(
                  '登録',
                  () => {}, // TODO　ログイン後の処理を追加
                  background: Colors.blue,
                  textColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
