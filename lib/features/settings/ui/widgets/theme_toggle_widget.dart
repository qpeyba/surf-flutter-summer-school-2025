import 'package:flutter/material.dart';
import 'package:surf_places/features/settings/domain/entities/theme_type.dart';
import 'package:surf_places/uikit/themes/colors/app_color_theme.dart';
import 'package:surf_places/uikit/themes/text/app_text_theme.dart';

class ThemeToggleWidget extends StatelessWidget {
  final ThemeType currentTheme;

  final ValueChanged<ThemeType> onThemeChanged;

  const ThemeToggleWidget({
    required this.currentTheme,
    required this.onThemeChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colorTheme = AppColorTheme.of(context);
    final textTheme = AppTextTheme.of(context);

    return Row(
      children: [
        Text(
          'Тёмная тема',
          style: textTheme.text.copyWith(color: colorTheme.textPrimary),
        ),
        const Spacer(),
        Switch(
          value: currentTheme == ThemeType.dark,
          onChanged: (isDark) {
            onThemeChanged(isDark ? ThemeType.dark : ThemeType.light);
          },
          activeColor: colorTheme.accent,
        ),
      ],
    );
  }
}
