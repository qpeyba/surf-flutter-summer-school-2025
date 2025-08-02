import 'package:flutter/foundation.dart';
import 'package:surf_places/features/settings/domain/entities/theme_type.dart';
import 'package:surf_places/features/settings/domain/repositories/i_settings_repository.dart';

abstract interface class IThemeManager {
  ValueListenable<ThemeType> get themeTypeListenable;

  Future<void> updateThemeType(ThemeType themeType);

  Future<void> init();

  void dispose();
}

final class ThemeManager implements IThemeManager {
  final ISettingsRepository _settingsRepository;
  final ValueNotifier<ThemeType> _themeTypeNotifier = ValueNotifier(ThemeType.light);

  ThemeManager({required ISettingsRepository settingsRepository}) : _settingsRepository = settingsRepository;

  @override
  ValueListenable<ThemeType> get themeTypeListenable => _themeTypeNotifier;

  @override
  Future<void> init() async {
    final settings = await _settingsRepository.getSettings();
    _themeTypeNotifier.value = settings.themeType;
  }

  @override
  Future<void> updateThemeType(ThemeType themeType) async {
    await _settingsRepository.updateThemeType(themeType);
    _themeTypeNotifier.value = themeType;
  }

  @override
  void dispose() {
    _themeTypeNotifier.dispose();
  }
}
