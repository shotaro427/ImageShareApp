import 'package:flutter/material.dart';
import 'package:image_share_app/constants/color.dart';
import 'package:image_share_app/model/controllers/mail_signup_controller/mail_signup_controller.dart';
import 'package:image_share_app/widget/atoms/index.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_share_app/widget/atoms/loading_view.dart';

class MailSignupPage extends ConsumerWidget {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final isLoading = watch(mailSignupController.state).isLoading;
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: const Text('メールアドレスで登録'),
          ),
          body: _SignupForm(_key),
          backgroundColor: backgroundColor,
          key: _key,
        ),
        LoadingView(isLoading),
      ],
    );
  }
}

class _SignupForm extends StatelessWidget {
  _SignupForm(this._scaffoldKey);

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(height: 24.0),
              TextFormField(
                controller:
                    context.read(mailSignupController).emailInputController,
                decoration: const InputDecoration(
                  border: const UnderlineInputBorder(),
                  labelText: 'メールアドレス',
                  labelStyle: TextStyle(color: Colors.blueGrey),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blueGrey),
                  ),
                ),
                maxLength: 20,
                validator: (String value) =>
                    !value.contains('@') ? 'アットマーク「＠」がありません。' : null,
                cursorColor: Colors.black,
              ),
              const SizedBox(height: 24.0),
              TextFormField(
                controller:
                    context.read(mailSignupController).passwordInputController,
                decoration: const InputDecoration(
                  border: const UnderlineInputBorder(),
                  labelText: 'パスワード(8文字以上)',
                  labelStyle: TextStyle(color: Colors.blueGrey),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blueGrey),
                  ),
                ),
                obscureText: true,
                maxLength: 20,
                validator: (String value) =>
                    (value.length < 8) ? '8文字以上のパスワードを設定してください' : null,
                cursorColor: Colors.black,
              ),
              const SizedBox(height: 24.0),
              Center(
                child: RoundRaisedButton(
                  '登録',
                  () {
                    if (_formKey.currentState.validate()) {
                      context
                          .read(mailSignupController)
                          .signupWithMailAdress(_scaffoldKey);
                    }
                  },
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
