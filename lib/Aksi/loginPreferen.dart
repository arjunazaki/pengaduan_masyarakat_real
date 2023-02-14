import 'package:shared_preferences/shared_preferences.dart';
import 'dataUser.dart';

class loginpref {
  static Future<bool> saveToSharedPref(
      String id, String name, String level, String token) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("id", id);
    pref.setString("name", name);
    pref.setString("level", level);
    pref.setString("token", token);
    return true;
  }

  static Future<dataUser> getPref() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    dataUser user = dataUser();
    user.id = pref.getString("id");
    user.name = pref.getString("name");
    user.level = pref.getString("level");
    user.token = pref.getString("token");
    return user;
  }

  static Future<bool> logout() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.clear();
    return true;
  }
}
