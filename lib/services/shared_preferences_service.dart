import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesServiece {
  Future<void> saveUserInfo(String uid, String email) async {
    // ローカルにuidを保存
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    await _prefs.setString('uid', uid);
    await _prefs.setString('email', email);
  }
}
