import 'package:pharmacy_app/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppCache {
  final String _userIdKey = 'id';
  final String _tokenKey = 'AUTH_TOKEN'; // Ajout de la clé pour le jeton

  AppCache();

  Future cacheTokenn(String token) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setString('token', token);
  }

  Future getTokenn() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    final token = sharedPreferences.getString('token');
    if (token != null) {
      return token;
    } else {
      return "";
    }
  }

  // USER_ID
  Future<void> setUserId(String value) async {
    await sharedPref!.setString(_userIdKey, value);
  }

  String? getUserId() => sharedPref!.getString(_userIdKey) ?? "";

  // AUTH_TOKEN
  Future<void> setAuthToken(String token) async {
    await sharedPref!.setString(_tokenKey, token);
  }

  String? getAuthToken() => sharedPref!.getString(_tokenKey);

  // Clear all
  Future<void> clearAll() async => await sharedPref!.clear();
}
