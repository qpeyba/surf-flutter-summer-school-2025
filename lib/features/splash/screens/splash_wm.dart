import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:surf_places/features/splash/domain/entities/splash_state.dart';
import 'package:surf_places/features/splash/ui/screens/splash_model.dart';

abstract class ISplashWM {
  ValueListenable<SplashState> get splashStateListenable;

  void dispose();
}

final class SplashWM implements ISplashWM {
  final ISplashModel _model;
  final BuildContext _context;

  SplashWM({required ISplashModel model, required BuildContext context}) : _model = model, _context = context {
    _model.splashStateListenable.addListener(_handleStateChange);
    _model.initializeSplash();
  }

  @override
  ValueListenable<SplashState> get splashStateListenable => _model.splashStateListenable;

  @override
  void dispose() {
    _model.splashStateListenable.removeListener(_handleStateChange);
    _model.dispose();
  }

  void _handleStateChange() {
    final state = _model.splashStateListenable.value;
    if (state is SplashStateCompleted) {
      if (state.isFirstLaunch) {
        Navigator.pushReplacementNamed(_context, '/onboarding');
      } else {
        Navigator.pushReplacementNamed(_context, '/places');
      }
    }
  }
}
