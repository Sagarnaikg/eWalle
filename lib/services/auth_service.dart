import 'package:ewalle/services/db_service.dart';

class Auth {
  static Future<bool?> getAuthSate() async {
    return await DB.getAuthFromDB();
  }

  static void setAuthState(bool state) {
    DB.setAuthToDB(state);
  }
}
