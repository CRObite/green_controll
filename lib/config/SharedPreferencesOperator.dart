
import 'package:shared_preferences/shared_preferences.dart';


class SharedPreferencesOperator {
  static const String keyOnBoardStatus = 'onBoardStatus';

  static Future<void> saveOnBoardStatus(bool status) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(keyOnBoardStatus, status);
  }

  static Future<bool?> getOnBoardStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? status = prefs.getBool(keyOnBoardStatus);

    return status;
  }


  static Future<void> clearOnBoardStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(keyOnBoardStatus);
  }

  static Future<bool> containsOnBoardStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(keyOnBoardStatus);
  }
}