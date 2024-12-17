import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingNotifier extends StateNotifier<bool> {
  OnboardingNotifier(this.prefs) : super(false) {
    _loadOnboardingStatus();
  }

  final SharedPreferences prefs;

  // Mark onboarding as completed
  Future<void> completeOnboarding() async {
    await prefs.setBool('onboarding_completed', true); // Save status
    state = true;
  }

  // Load the onboarding status from shared preferences
  Future<void> _loadOnboardingStatus() async {
    final completed =
        prefs.getBool('onboarding_completed') ?? false; // Default to false
    state = completed;
  }
}
