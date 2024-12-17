import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hadirpro/features/onboarding/onboarding.dart';

final navigatorKey = GlobalKey<NavigatorState>();

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    debugLogDiagnostics: true,
    navigatorKey: navigatorKey,
    initialLocation: '/loading',
    routes: <RouteBase>[
      GoRoute(
        path: '/login/teacher',
        builder: (BuildContext context, GoRouterState state) =>
            const SizedBox(),
      ),
      GoRoute(
        path: '/login/student',
        builder: (BuildContext context, GoRouterState state) =>
            const SizedBox(),
      ),
      GoRoute(
        path: '/onboarding',
        builder: (BuildContext context, GoRouterState state) =>
            const OnboardingScreen(),
      ),
      GoRoute(
        path: '/dashboard/teacher',
        builder: (BuildContext context, GoRouterState state) =>
            const SizedBox(),
      ),
      GoRoute(
        path: '/attendance',
        builder: (BuildContext context, GoRouterState state) =>
            const SizedBox(),
      ),
      GoRoute(
        path: '/students',
        builder: (BuildContext context, GoRouterState state) =>
            const SizedBox(),
      ),
      GoRoute(
        path: '/loading',
        builder: (BuildContext context, GoRouterState state) =>
            const CircularProgressIndicator.adaptive(),
      ),
    ],
    redirect: (context, state) {
      final isBoarded = ref.watch(onboardingProvider);
      if (isBoarded) {
        return '/login/teacher';
      } else {
        return '/onboarding';
      }
    },
  );
});
