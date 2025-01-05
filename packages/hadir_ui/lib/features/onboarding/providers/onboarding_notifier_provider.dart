import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hadir_ui/core/core.dart';
import 'package:hadir_ui/features/onboarding/onboarding.dart';

final onboardingNotifierProvider =
    StateNotifierProvider<OnboardingNotifier, bool>((ref) {
  return OnboardingNotifier(ref.read(sharedPreferencesProvider));
});
