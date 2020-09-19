import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:image_share_app/constants/color.dart';
import 'package:image_share_app/flavor.dart';
import 'package:image_share_app/pages/app_start/app_start_page.dart';
import 'package:image_share_app/pages/mail_singin_page/mail_signin_page.dart';
import 'package:image_share_app/widgets/top_image_list/select_tag_page.dart';
import 'package:provider/provider.dart';

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
          },
        ),
      ),
    );
  }
}
