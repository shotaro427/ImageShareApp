import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:image_share_app/flavor.dart';
import 'package:image_share_app/widgets/sing_in/app_start_page.dart';
import 'package:image_share_app/widgets/sing_in/sign_in_page.dart';
import 'package:image_share_app/widgets/top_image_list/select_tag_page.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StateNotifierProvider<SelectTagStateController, SelectTagState>(
          create: (_) => SelectTagStateController(),
        ),
      ],
      child: FlavorProvider(
        flavor: Flavor.production,
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: AppStartPage(), // ログインページを生成
          debugShowCheckedModeBanner: false,
          routes: {
            'MailSignIn': (BuildContext context) => SignInPage(),
          },
        ),
      ),
    );
  }
}
