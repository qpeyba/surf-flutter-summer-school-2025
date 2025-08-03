import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:surf_places/assets/images/app_svg_icons.dart';
import 'package:surf_places/features/splash/domain/entities/splash_state.dart';
import 'package:surf_places/features/splash/ui/screens/splash_wm.dart';

class SplashScreen extends StatefulWidget {
  final ISplashWM wm;

  const SplashScreen({
    required this.wm,
    super.key,
  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder<SplashState>(
        valueListenable: widget.wm.splashStateListenable,
        builder: (context, state, child) {
          return DecoratedBox(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFFB8D84A),
                  Color(0xFF6BBE47),
                ],
              ),
            ),
            child: Center(
              child: SvgPicture.asset(
                AppSvgIcons.icSplashLogo,
                width: 160,
                height: 160,
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    widget.wm.dispose();
    super.dispose();
  }
}
