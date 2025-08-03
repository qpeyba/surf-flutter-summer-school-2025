abstract interface class IOnboardingRepository {
  Future<bool> isOnboardingCompleted();
  Future<void> markOnboardingCompleted();
}
