import 'package:flutter/foundation.dart';
import 'package:surf_places/features/settings/domain/entities/app_settings.dart';
import 'package:surf_places/features/settings/domain/entities/theme_type.dart';
import 'package:surf_places/features/settings/ui/screens/settings_model.dart';

abstract interface class ISettingsWM {
  ValueListenable<AppSettings?> get settingsListenable;

  void onThemeChanged(ThemeType themeType);

  void dispose();
}

final class SettingsWM implements ISettingsWM {
  final ISettingsModel _model;

  SettingsWM({required ISettingsModel model}) : _model = model;

  @override
  ValueListenable<AppSettings?> get settingsListenable => _model.settingsListenable;

  @override
  void onThemeChanged(ThemeType themeType) {
    _model.updateThemeType(themeType);
  }

  @override
  void dispose() {
    _model.dispose();
  }
}
