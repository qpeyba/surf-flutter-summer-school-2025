import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surf_places/features/settings/ui/screens/settings_dependencies.dart';
import 'package:surf_places/features/settings/ui/screens/settings_screen.dart';
import 'package:surf_places/features/settings/ui/screens/settings_wm.dart';

class SettingsScreenBuilder extends StatelessWidget {
  const SettingsScreenBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: SettingsDependencies.providers(),
      child: Consumer<ISettingsWM>(
        builder: (context, wm, _) => SettingsScreen(wm: wm),
      ),
    );
  }
}
