import 'package:surf_places/features/settings/domain/entities/app_settings.dart';
import 'package:surf_places/features/settings/domain/entities/theme_type.dart';

abstract interface class ISettingsRepository {
  Future<AppSettings> getSettings();

  Future<void> saveSettings(AppSettings settings);

  Future<void> updateThemeType(ThemeType themeType);
}
