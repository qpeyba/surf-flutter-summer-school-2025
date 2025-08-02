import 'package:surf_places/features/settings/domain/entities/theme_type.dart';

class AppSettings {
  const AppSettings({
    required this.themeType,
  });

  final ThemeType themeType;

  AppSettings copyWith({
    ThemeType? themeType,
  }) {
    return AppSettings(
      themeType: themeType ?? this.themeType,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AppSettings && other.themeType == themeType;
  }

  @override
  int get hashCode => themeType.hashCode;
}
