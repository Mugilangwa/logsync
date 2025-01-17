import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  static Future<void> saveSession(String userId, String role, String username) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', true);
    prefs.setString('userId', userId);
    prefs.setString('role', role);
    prefs.setString('username', username);
  }

  static Future<void> clearSession() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }

  static Future<String?> getRole() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('role');
  }
}
