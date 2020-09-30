import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_share_app/constants/color.dart';
import 'package:image_share_app/model/controllers/mail_signin_controller/mail_signin_controller.dart';
import 'package:image_share_app/widget/atoms/index.dart';

class MailSigninPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('メールアドレスでログイン'),
      ),
      body: _SigninForm(_key),
      backgroundColor: backgroundColor,
      key: _key,
    );
  }
}

class _SigninForm extends ConsumerWidget {
  _SigninForm(this._scaffoldKey);

  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final isLoading = watch(mailSigninController.state).isLoading;
    return isLoading
        ? const Center(child: CircularProgressIndicator())
        : Center(
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    const SizedBox(height: 24.0),
                    TextFormField(
                      controller: context
                          .read(mailSigninController)
                          .emailInputController,
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
                      controller: context
                          .read(mailSigninController)
                          .passwordInputController,
                      decoration: const InputDecoration(
                        border: const UnderlineInputBorder(),
                        labelText: 'パスワード(8文字以上)',
                        labelStyle: TextStyle(color: Colors.blueGrey),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: const BorderSide(color: Colors.blueGrey),
                        ),
                      ),
                      obscureText: true,
                      cursorColor: Colors.black,
                      maxLength: 20,
                      validator: (String value) =>
                          (value.length < 8) ? '8文字以上のパスワードを入力してください' : null,
                    ),
                    const SizedBox(height: 24.0),
                    Center(
                      child: RoundRaisedButton(
                        'ログイン',
                        () {
                          if (_formKey.currentState.validate()) {
                            context
                                .read(mailSigninController)
                                .loginWithMailAdress(_scaffoldKey);
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
