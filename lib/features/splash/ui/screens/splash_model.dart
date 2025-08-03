import 'package:flutter/foundation.dart';
import 'package:surf_places/core/domain/entities/result/result.dart';
import 'package:surf_places/features/splash/domain/entities/splash_state.dart';
import 'package:surf_places/features/splash/domain/repositories/i_first_launch_repository.dart';

abstract class ISplashModel {
  ValueListenable<SplashState> get splashStateListenable;

  void dispose();

  Future<void> initializeSplash();
}

final class SplashModel implements ISplashModel {
  final IFirstLaunchRepository _firstLaunchRepository;
  final _splashState = ValueNotifier<SplashState>(const SplashStateLoading());

  SplashModel({required IFirstLaunchRepository firstLaunchRepository}) : _firstLaunchRepository = firstLaunchRepository;

  @override
  ValueListenable<SplashState> get splashStateListenable => _splashState;

  @override
  void dispose() {
    _splashState.dispose();
  }

  @override
  Future<void> initializeSplash() async {
    await Future.delayed(const Duration(seconds: 2));

    final result = await _firstLaunchRepository.isFirstLaunch();

    switch (result) {
      case ResultOk(data: final isFirstLaunch):
        _splashState.value = SplashStateCompleted(isFirstLaunch: isFirstLaunch);
        if (isFirstLaunch) {
          await _firstLaunchRepository.setFirstLaunchCompleted();
        }
      case ResultFailed():
        _splashState.value = const SplashStateCompleted(isFirstLaunch: false);
    }
  }
}
