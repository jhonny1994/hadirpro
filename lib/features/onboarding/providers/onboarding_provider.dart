import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hadirpro/features/onboarding/application/onboarding_notifier.dart';
import 'package:hadirpro/features/shared/providers/shared_preferences_provider.dart';

final onboardingProvider =
    StateNotifierProvider<OnboardingNotifier, bool>((ref) {
  final sharedPreferences = ref.watch(sharedPreferencesProvider);
  return OnboardingNotifier(sharedPreferences);
});
