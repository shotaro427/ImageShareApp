import 'package:flutter/material.dart';
import 'package:image_share_app/flavor.dart';
import 'package:image_share_app/widgets/sing_in/app_start_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FlavorProvider(
      flavor: Flavor.staging,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: AppStartPage(), // ログインページを生成
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}