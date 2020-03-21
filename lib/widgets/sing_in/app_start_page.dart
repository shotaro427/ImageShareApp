

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_share_app/repositories/joined_room_list_repository.dart';
import 'package:image_share_app/widgets/room_list/room_list.dart';
import 'package:image_share_app/widgets/sing_in/sign_in_page.dart';

/// ログイン画面
/// - Googleアカウント
/// - メールアドレスとパスワード
/// でログイン/登録が可能
class AppStartPage extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _isCheckSignIn(),
      builder: (BuildContext context, AsyncSnapshot<bool> isSignIn) {

        if (isSignIn.hasData && isSignIn.data) { // ログイン済の場合
          return RoomListPage(RoomListRepository());
        } else if (isSignIn.hasData && !isSignIn.data) { // ログインしていない場合
          return SignInPage();
        } else {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }

  Future<bool> _isCheckSignIn() async {
    bool isSignIn = false;

    await _auth.currentUser().then((FirebaseUser user) {
      if (user != null) {
        isSignIn = true;
      } else {
        isSignIn = false;
      }
    }).catchError((e)  {
      debugPrint(e.toString());
      isSignIn = false;
    });

    return isSignIn;
  }
}