import 'package:flutter/foundation.dart';

@immutable
sealed class SplashState {
  const SplashState();
}

final class SplashStateLoading extends SplashState {
  const SplashStateLoading();
}

final class SplashStateCompleted extends SplashState {
  final bool isFirstLaunch;

  const SplashStateCompleted({required this.isFirstLaunch});

  @override
  int get hashCode => isFirstLaunch.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SplashStateCompleted && runtimeType == other.runtimeType && isFirstLaunch == other.isFirstLaunch;
}
