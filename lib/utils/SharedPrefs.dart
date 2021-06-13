import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static SharedPreferences prefs;

  static Future<void> initSharedPres() async {
    prefs = await SharedPreferences.getInstance();
  }

  static void saveString(String prefKey, String prefString) async {
    await prefs.setString(prefKey, prefString);
  }

  static Future<String> getString(String prefKey) async {
    String prefString = await prefs.get(prefKey);
    return prefString;
  }

}
