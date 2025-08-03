import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surf_places/features/splash/ui/screens/splash_model.dart';
import 'package:surf_places/features/splash/ui/screens/splash_screen.dart';
import 'package:surf_places/features/splash/ui/screens/splash_wm.dart';
import 'package:surf_places/features/splash/ui/splash_dependencies.dart';

class SplashScreenBuilder extends StatelessWidget {
  const SplashScreenBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: SplashDependencies.providers(),
      child: Builder(
        builder: (context) {
          final model = context.read<ISplashModel>();
          final wm = SplashWM(model: model, context: context);

          return SplashScreen(wm: wm);
        },
      ),
    );
  }
}
