import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeNotifier extends StateNotifier<ThemeMode> {
  ThemeNotifier(this.prefs) : super(ThemeMode.system) {
    _loadThemePreference(); // Load the saved theme preference on initialization
  }
  final SharedPreferences prefs;
  // Load the theme preference from shared preferences
  Future<void> _loadThemePreference() async {
    final themeIndex = prefs.getInt('theme_mode'); // Get the saved theme index

    // If no preference is saved, default to system theme
    if (themeIndex == null) {
      state = ThemeMode.system;
    } else {
      state = ThemeMode.values[themeIndex]; // Set the saved theme
    }
  }

  // Save the theme preference to shared preferences
  Future<void> _saveThemePreference() async {
    await prefs.setInt('theme_mode', state.index);
  }

  void toggleTheme() {
    state = state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    _saveThemePreference(); // Save the new theme preference
  }

  void setSystemTheme(Brightness brightness) {
    state = brightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light;
    _saveThemePreference(); // Save the new theme preference
  }
}
