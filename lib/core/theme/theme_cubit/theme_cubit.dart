import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ThemeCubit extends Cubit<ThemeMode> {
  static const String _prefsKey = 'selected_theme';
  final SharedPreferences _prefs;

  ThemeCubit(this._prefs)
    : super(
        ThemeMode.values.firstWhere(
          (e) => e.name == _prefs.getString(_prefsKey),
          orElse: () => ThemeMode.system,
        ),
      );

  Future<void> setTheme(ThemeMode mode) async {
    await _prefs.setString(_prefsKey, mode.name);
    emit(mode);
  }

  void toggleTheme() {
    switch (state) {
      case ThemeMode.system:
        setTheme(ThemeMode.light);
        break;
      case ThemeMode.light:
        setTheme(ThemeMode.dark);
        break;
      case ThemeMode.dark:
        setTheme(ThemeMode.system);
        break;
    }
  }
}
