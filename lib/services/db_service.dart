import 'package:shared_preferences/shared_preferences.dart';

class DB {
  static Future<bool?> getAuthFromDB() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool("isLogged");
  }

  static void setAuthToDB(bool state) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("isLogged", state);
  }
}
