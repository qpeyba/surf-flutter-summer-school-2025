import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

abstract interface class IThemeRepository {
  ThemeMode getThemeMode();

  Future<void> setThemeMode(ThemeMode themeMode);

  ValueListenable<ThemeMode> get themeModeListenable;
}
