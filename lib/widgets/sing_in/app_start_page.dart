import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_share_app/pages/app_start/app_start_page.dart';
import 'package:image_share_app/pages/room_list/room_list_page.dart';

/// ログイン画面
/// - Googleアカウント
/// - メールアドレスとパスワード
/// でログイン/登録が可能
class AppStartHandler extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _isCheckSignIn(),
      builder: (BuildContext context, AsyncSnapshot<bool> isSignIn) {
        if (isSignIn.hasData && isSignIn.data) {
          // ログイン済の場合
          return RoomListPage();
        } else if (isSignIn.hasData && !isSignIn.data) {
          // ログインしていない場合
          return AppStartPage();
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
    }).catchError((e) {
      debugPrint(e.toString());
      isSignIn = false;
    });

    return isSignIn;
  }
}
