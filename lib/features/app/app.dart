import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surf_places/features/app/di/app_dependencies.dart';
import 'package:surf_places/features/tabs_screen/tabs_screen.dart';
import 'package:surf_places/uikit/themes/app_theme_data.dart';

/// Виджет приложения.
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [...AppDependencies.providers()],
      child: MaterialApp(debugShowCheckedModeBanner: false, theme: AppThemeData.lightTheme, home: TabsScreen()),
    );
  }
}
