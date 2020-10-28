import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_share_app/constants/color.dart';
import 'package:image_share_app/flavor.dart';
import 'package:image_share_app/model/entities/user.entity.dart';
import 'package:image_share_app/pages/app_start/app_start_page.dart';
import 'package:image_share_app/pages/create_post_page/create_post_page.dart';
import 'package:image_share_app/pages/create_room/create_room_page.dart';
import 'package:image_share_app/pages/group_setting/group_setting_page.dart';
import 'package:image_share_app/pages/invited_room_list/invited_room_list_page.dart';
import 'package:image_share_app/pages/mail_signup/mail_signup_page.dart';
import 'package:image_share_app/pages/mail_singin/mail_signin_page.dart';
import 'package:image_share_app/pages/post_top/post_top_page.dart';
import 'package:image_share_app/pages/room_list/room_list_page.dart';

bool _isAuthorized = false;
UserState _user = null;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  _isAuthorized = (await handleLoginPage());
  log(_isAuthorized.toString());
  runApp(DevMyApp());
}

class DevMyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: FlavorProvider(
        flavor: Flavor.development,
        child: Consumer(
          builder: (BuildContext context, value, child) {
            return MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                primarySwatch: white,
              ),
              initialRoute: 'appStart',
              debugShowCheckedModeBanner: false,
              routes: {
                'mailSignin': (_) => MailSigninPage(),
                'mailSignup': (_) => MailSignupPage(),
                'roomList': (_) => RoomListPage(),
                'createRoom': (_) => CreateRoomPage(),
                'invitedRoomList': (_) => InvitedRoomListPage(),
                'postTop': (_) => PostTopPage(),
                'createPost': (_) => CreatePostPage(),
                'groupSetting': (_) => GroupSettingPage(),
              },
              onGenerateRoute: (settings) {
                if (settings.name == 'appStart') {
                  if (_isAuthorized) {
                    context.read(userStore).updateState(_user);
                    return MaterialPageRoute(
                      builder: (context) => RoomListPage(),
                    );
                  }
                  return MaterialPageRoute(
                    builder: (context) => AppStartPage(),
                  );
                }
              },
            );
          },
        ),
      ),
    );
  }
}

// ログインチェック
Future<bool> handleLoginPage() async {
  FirebaseUser _fUser = null;
  try {
    _fUser = (await FirebaseAuth.instance.currentUser());
    if (_fUser != null) {
      _user = UserState(
        uid: _fUser.uid,
        name: _fUser.displayName ?? '',
        email: _fUser.email ?? '',
      );
    }
  } catch (e) {
    log(e.toString());
  }

  return _fUser != null;
}
