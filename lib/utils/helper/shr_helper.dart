import 'package:shared_preferences/shared_preferences.dart';

class ShrHelper {
  Future<void> saveIntroScreen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('intro', true);
  }

  Future<bool?> readIntroScreen() async {
    SharedPreferences prefes = await SharedPreferences.getInstance();
    return prefes.getBool('intro');
  }
}
