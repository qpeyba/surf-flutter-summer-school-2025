import 'package:surf_places/features/settings/domain/entities/theme_type.dart';

class ThemeTypeMapper {
  static String toStorage(ThemeType themeType) {
    switch (themeType) {
      case ThemeType.light:
        return 'light';
      case ThemeType.dark:
        return 'dark';
    }
  }

  static ThemeType fromStorage(String? value) {
    switch (value) {
      case 'light':
        return ThemeType.light;
      case 'dark':
        return ThemeType.dark;
      default:
        return ThemeType.light;
    }
  }
}
