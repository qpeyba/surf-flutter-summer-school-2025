import 'package:shared_preferences/shared_preferences.dart';
import 'package:surf_places/core/data/repositories/base_repository.dart';
import 'package:surf_places/core/domain/entities/result/result.dart';
import 'package:surf_places/features/settings/data/mappers/theme_type_mapper.dart';
import 'package:surf_places/features/settings/domain/entities/app_settings.dart';
import 'package:surf_places/features/settings/domain/entities/theme_type.dart';
import 'package:surf_places/features/settings/domain/repositories/i_settings_repository.dart';

final class SettingsRepository extends BaseRepository implements ISettingsRepository {
  static const String _themeTypeKey = 'theme_type';

  @override
  Future<AppSettings> getSettings() async {
    final result = await makeApiCall(() async {
      final prefs = await SharedPreferences.getInstance();
      final themeTypeString = prefs.getString(_themeTypeKey);
      final themeType = ThemeTypeMapper.fromStorage(themeTypeString);

      return AppSettings(themeType: themeType);
    });

    return switch (result) {
      ResultOk(:final data) => data,
      ResultFailed() => const AppSettings(themeType: ThemeType.light),
    };
  }

  @override
  Future<void> saveSettings(AppSettings settings) async {
    await makeApiCall(() async {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(
        _themeTypeKey,
        ThemeTypeMapper.toStorage(settings.themeType),
      );
    });
  }

  @override
  Future<void> updateThemeType(ThemeType themeType) async {
    await makeApiCall(() async {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(
        _themeTypeKey,
        ThemeTypeMapper.toStorage(themeType),
      );
    });
  }
}
