import 'package:flutter/material.dart';
import 'package:surf_places/assets/strings/app_strings.dart';
import 'package:surf_places/features/settings/ui/screens/settings_wm.dart';
import 'package:surf_places/features/settings/ui/widgets/theme_toggle_widget.dart';
import 'package:surf_places/uikit/themes/colors/app_color_theme.dart';

class SettingsScreen extends StatelessWidget {
  final ISettingsWM wm;

  const SettingsScreen({
    required this.wm,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colorTheme = AppColorTheme.of(context);

    return Scaffold(
      backgroundColor: colorTheme.background,
      body: NestedScrollView(
        headerSliverBuilder:
            (_, __) => [
              SliverAppBar(
                title: const Text(AppStrings.placesScreenBottomNavSettings),
                floating: true,
                snap: true,
                backgroundColor: colorTheme.scaffold,
              ),
            ],
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: ValueListenableBuilder(
            valueListenable: wm.settingsListenable,
            builder: (context, settings, _) {
              if (settings == null) {
                return const Center(child: CircularProgressIndicator());
              }

              return Column(
                children: [
                  ThemeToggleWidget(
                    currentTheme: settings.themeType,
                    onThemeChanged: wm.onThemeChanged,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
