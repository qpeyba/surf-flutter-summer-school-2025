import 'package:flutter/foundation.dart';
import 'package:surf_places/features/splash/domain/entities/splash_state.dart';
import 'package:surf_places/features/splash/ui/screens/splash_model.dart';

abstract class ISplashWM {
  ValueListenable<SplashState> get splashStateListenable;

  void dispose();
}

final class SplashWM implements ISplashWM {
  final ISplashModel _model;

  SplashWM({required ISplashModel model}) : _model = model {
    _model.initializeSplash().then((_) => _handleSplashCompleted());
  }

  @override
  ValueListenable<SplashState> get splashStateListenable => _model.splashStateListenable;

  @override
  void dispose() {
    _model.dispose();
  }

  void _handleSplashCompleted() {
    final state = _model.splashStateListenable.value;
    if (state is SplashStateCompleted) {
      // TODO: afsdfasddf
    }
  }
}
