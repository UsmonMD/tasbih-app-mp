import 'package:shared_preferences/shared_preferences.dart';

class ThemePreferences {
  static const _themeKey = 'themeIsDark';

  static Future<void> saveTheme(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_themeKey, value);
  }

  static Future<bool> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_themeKey) ?? true;
  }
}
