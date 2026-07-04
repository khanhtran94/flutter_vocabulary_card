import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  AppPreferences(this._preferences);

  final SharedPreferences _preferences;

  static const _firstLaunchKey = 'is_first_launch';
  static const _darkModeKey = 'is_dark_mode';
  static const _selectedLanguageKey = 'selected_language';
  static const _dailyGoalKey = 'daily_goal';

  static Future<AppPreferences> create() async {
    return AppPreferences(await SharedPreferences.getInstance());
  }

  bool get isFirstLaunch => _preferences.getBool(_firstLaunchKey) ?? true;
  bool get isDarkMode => _preferences.getBool(_darkModeKey) ?? false;
  String get selectedLanguage =>
      _preferences.getString(_selectedLanguageKey) ?? 'vi';
  int get dailyGoal => _preferences.getInt(_dailyGoalKey) ?? 15;

  Future<void> setFirstLaunch(bool value) =>
      _preferences.setBool(_firstLaunchKey, value);
  Future<void> setDarkMode(bool value) =>
      _preferences.setBool(_darkModeKey, value);
  Future<void> setSelectedLanguage(String value) =>
      _preferences.setString(_selectedLanguageKey, value);
  Future<void> setDailyGoal(int value) =>
      _preferences.setInt(_dailyGoalKey, value);
}
