import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surf_places/features/app/di/app_dependencies.dart';
import 'package:surf_places/features/app/theme/theme_manager.dart';
import 'package:surf_places/features/settings/domain/entities/theme_type.dart';
import 'package:surf_places/features/splash/ui/screens/splash_screen_builder.dart';
import 'package:surf_places/features/tabs_screen/tabs_screen.dart';
import 'package:surf_places/uikit/themes/app_theme_data.dart';

/// Виджет приложения.
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: AppDependencies.providers(),
      child: const _AppInitializer(),
    );
  }
}

class _AppInitializer extends StatefulWidget {
  const _AppInitializer();

  @override
  State<_AppInitializer> createState() => _AppInitializerState();
}

class _AppInitializerState extends State<_AppInitializer> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<IThemeManager>().init();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<IThemeManager>(
      builder: (context, themeManager, _) {
        return ValueListenableBuilder<ThemeType>(
          valueListenable: themeManager.themeTypeListenable,
          builder: (context, themeType, _) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: themeType == ThemeType.light ? AppThemeData.lightTheme : AppThemeData.darkTheme,
              home: const SplashScreenBuilder(),
              routes: {
                '/places': (context) => const TabsScreen(),
                '/onboarding': (context) => const Placeholder(),
              },
            );
          },
        );
      },
    );
  }
}
