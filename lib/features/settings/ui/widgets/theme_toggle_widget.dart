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

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorTheme.scaffold,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colorTheme.textSecondary.withValues(alpha: 0.2)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Тема приложения',
                  style: textTheme.smallBold.copyWith(color: colorTheme.textSecondary),
                ),
                const SizedBox(height: 4),
                Text(
                  currentTheme == ThemeType.light ? 'Светлая' : 'Темная',
                  style: textTheme.smallBold.copyWith(color: colorTheme.textSecondary.withValues(alpha: 0.7)),
                ),
              ],
            ),
          ),
          Switch(
            value: currentTheme == ThemeType.dark,
            onChanged: (isDark) {
              onThemeChanged(isDark ? ThemeType.dark : ThemeType.light);
            },
            activeColor: colorTheme.accent,
          ),
        ],
      ),
    );
  }
}
