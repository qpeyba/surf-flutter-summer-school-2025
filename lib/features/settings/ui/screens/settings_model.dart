import 'package:flutter/foundation.dart';
import 'package:surf_places/features/app/theme/theme_manager.dart';
import 'package:surf_places/features/settings/domain/entities/app_settings.dart';
import 'package:surf_places/features/settings/domain/entities/theme_type.dart';
import 'package:surf_places/features/settings/domain/repositories/i_settings_repository.dart';

abstract interface class ISettingsModel {
  ValueListenable<AppSettings?> get settingsListenable;

  Future<void> loadSettings();

  Future<void> updateThemeType(ThemeType themeType);

  void dispose();
}

final class SettingsModel implements ISettingsModel {
  final ISettingsRepository _settingsRepository;
  final IThemeManager _themeManager;
  final ValueNotifier<AppSettings?> _settingsNotifier = ValueNotifier(null);

  SettingsModel({
    required ISettingsRepository settingsRepository,
    required IThemeManager themeManager,
  }) : _settingsRepository = settingsRepository,
       _themeManager = themeManager {
    loadSettings();
  }

  @override
  ValueListenable<AppSettings?> get settingsListenable => _settingsNotifier;

  @override
  Future<void> loadSettings() async {
    final settings = await _settingsRepository.getSettings();
    _settingsNotifier.value = settings;
  }

  @override
  Future<void> updateThemeType(ThemeType themeType) async {
    await _themeManager.updateThemeType(themeType);

    final currentSettings = _settingsNotifier.value;
    if (currentSettings != null) {
      _settingsNotifier.value = currentSettings.copyWith(themeType: themeType);
    }
  }

  @override
  void dispose() {
    _settingsNotifier.dispose();
  }
}
