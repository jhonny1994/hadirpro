import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hadir_core/hadir_core.dart';
import 'package:hadir_ui/hadir_ui.dart';
import 'package:hadirproteacher/core/presentation/loading_screen.dart';
import 'package:hadirproteacher/features/auth/presentation/auth_screen.dart';
import 'package:hadirproteacher/features/auth/presentation/verify_email_screen.dart';
import 'package:hadirproteacher/features/onboarding/presentation/onboarding_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/loading',
    redirect: (context, state) {
      final authState = ref.watch(authNotifierProvider);
      final boarded = ref.watch(onboardingNotifierProvider);
      if (!boarded) {
        return '/onboarding';
      }
      return authState.whenOrNull(
        authenticatedTeacher: (profile) => '/teacher',
        unauthenticated: (message) {
          if (message != null) {
            return '/auth?message=${Uri.encodeComponent(message)}';
          } else {
            return '/auth';
          }
        },
        loading: () => null,
        verificationRequired: (email) => '/verify-email?email=$email',
      );
    },
    routes: [
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: '/auth',
        builder: (context, state) {
          final errorMessage = state.uri.queryParameters['message'] != null
              ? Uri.decodeComponent(state.uri.queryParameters['message']!)
              : null;
          return AuthScreen(message: errorMessage);
        },
      ),
      GoRoute(
        path: '/verify-email',
        builder: (context, state) {
          final email = state.uri.queryParameters['email']!;
          return VerifyEmailScreen(email: email);
        },
      ),
      GoRoute(
        path: '/teacher',
        builder: (context, state) => const ScaffoldPage(),
      ),
      GoRoute(
        path: '/loading',
        builder: (context, state) => const LoadingScreen(),
      ),
    ],
  );
});
