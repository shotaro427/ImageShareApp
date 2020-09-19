import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:image_share_app/model/controllers/app_start_controller/app_start_state.dart';

final appStartController = StateNotifierProvider((ref) => AppStartController());

class AppStartController extends StateNotifier<AppStartState> {
  AppStartController() : super(const AppStartState());

  void navigateToMailSignin(BuildContext context) =>
      Navigator.of(context).pushNamed('mailSignin');
}
