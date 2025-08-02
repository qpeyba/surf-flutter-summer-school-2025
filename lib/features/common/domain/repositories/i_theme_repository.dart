import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

abstract interface class IThemeRepository {
  /// Получить текущую тему
  ThemeMode getThemeMode();

  /// Установить тему
  Future<void> setThemeMode(ThemeMode themeMode);

  /// Слушатель изменений темы
  ValueListenable<ThemeMode> get themeModeListenable;
}
