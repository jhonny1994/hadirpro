import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hadir_core/hadir_core.dart';
import 'package:hadir_ui/hadir_ui.dart';
import 'package:hadirproteacher/features/onboarding/presentation/onboarding_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    redirect: (context, state) {
      final state = ref.watch(authNotifierProvider);
      final boarded = ref.watch(onboardingNotifierProvider);

      if (boarded) {
        return state.when(
          authenticatedTeacher: (profile) => '/teacher',
          authenticatedStudent: (profile) => '/student',
          unauthenticated: (message) => '/signup',
          loading: () => '/',
          verificationRequired: (email) => '/verify-email',
        );
      } else {
        return '/onboarding';
      }
    },
    routes: [
      // Public routes
      GoRoute(
        path: '/',
        builder: (context, state) => const ScaffoldPage(),
      ),
      GoRoute(
        path: '/signup',
        builder: (context, state) => const ScaffoldPage(),
      ),
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: '/verify-email',
        builder: (context, state) {
          // final email = state.extra! as String;
          return const ScaffoldPage();
        },
      ),

      // Teacher routes
      GoRoute(
        path: '/teacher',
        builder: (context, state) => const ScaffoldPage(),
      ),
      GoRoute(
        path: '/teacher/sessions',
        builder: (context, state) => const ScaffoldPage(),
      ),
      GoRoute(
        path: '/teacher/sessions/:id',
        builder: (context, state) {
          // final sessionId = state.pathParameters['id'];
          return const ScaffoldPage();
        },
      ),

      // Student routes
      GoRoute(
        path: '/student',
        builder: (context, state) => const ScaffoldPage(),
      ),
      GoRoute(
        path: '/student/sessions',
        builder: (context, state) => const ScaffoldPage(),
      ),
      GoRoute(
        path: '/student/sessions/:id',
        builder: (context, state) {
          // final sessionId = state.pathParameters['id'];
          return const ScaffoldPage();
        },
      ),
    ],
  );
});
