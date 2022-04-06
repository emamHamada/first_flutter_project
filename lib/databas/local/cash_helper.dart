import 'package:shared_preferences/shared_preferences.dart';

// CashDataWithSharedPref
class CashHelper {
  static SharedPreferences? _shardPref;

  SharedPreferences? get shardPref => _shardPref;

  static init() async {
    _shardPref = await SharedPreferences.getInstance();
  }

  static Future<bool?>? putData(
      {required String key, required bool value}) async {
    return await _shardPref?.setBool(key, value);
  }

  static Future<bool?>? getData({required String key}) async {
    return _shardPref?.getBool(key);
  }
}
