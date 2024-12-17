import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeNotifier extends StateNotifier<ThemeMode> {
  ThemeNotifier(this.prefs) : super(ThemeMode.system) {
    _loadThemePreference();
  }
  final SharedPreferences prefs;
  Future<void> _loadThemePreference() async {
    final themeIndex = prefs.getInt('theme_mode');

    if (themeIndex == null) {
      state = ThemeMode.system;
    } else {
      state = ThemeMode.values[themeIndex];
    }
  }

  Future<void> _saveThemePreference() async {
    await prefs.setInt('theme_mode', state.index);
  }

  void toggleTheme() {
    state = state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    _saveThemePreference();
  }

  void setSystemTheme(Brightness brightness) {
    state = brightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light;
    _saveThemePreference();
  }
}
