import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:surf_places/features/common/domain/repositories/i_theme_repository.dart';

class ThemeRepository implements IThemeRepository {
  static const String _themeKey = 'theme_mode';

  final ValueNotifier<ThemeMode> _themeModeNotifier = ValueNotifier(ThemeMode.system);

  @override
  ValueListenable<ThemeMode> get themeModeListenable => _themeModeNotifier;

  @override
  ThemeMode getThemeMode() => _themeModeNotifier.value;

  @override
  Future<void> setThemeMode(ThemeMode themeMode) async {
    _themeModeNotifier.value = themeMode;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_themeKey, themeMode.name);
  }

  Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    final savedTheme = prefs.getString(_themeKey);
    if (savedTheme != null) {
      try {
        _themeModeNotifier.value = ThemeMode.values.byName(savedTheme);
      } catch (err) {
        // Если неизвестное значение, то ThemeMode.system
      }
    }
  }
}
