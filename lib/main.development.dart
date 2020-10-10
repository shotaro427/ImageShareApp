import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_share_app/constants/color.dart';
import 'package:image_share_app/flavor.dart';
import 'package:image_share_app/pages/app_start/app_start_page.dart';
import 'package:image_share_app/pages/create_room/create_room_page.dart';
import 'package:image_share_app/pages/invited_room_list/invited_room_list_page.dart';
import 'package:image_share_app/pages/mail_signup/mail_signup_page.dart';
import 'package:image_share_app/pages/mail_singin/mail_signin_page.dart';
import 'package:image_share_app/widgets/room_list/room_list.dart';

void main() => runApp(DevMyApp());

class DevMyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: FlavorProvider(
        flavor: Flavor.development,
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: white,
          ),
          home: AppStartPage(), // ログインページを生成
          debugShowCheckedModeBanner: false,
          routes: {
            'appStart': (BuildContext context) => AppStartPage(),
            'mailSignin': (BuildContext context) => MailSigninPage(),
            'mailSignup': (BuildContext context) => MailSignupPage(),
            'roomList': (BuildContext context) => RoomListPage(),
            'createRoom': (BuildContext context) => CreateRoomPage(),
            'invitedRoomList': (BuildContext context) => InvitedRoomListPage(),
          },
        ),
      ),
    );
  }
}
