import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hadirpro/features/authentication/authentication.dart';
import 'package:hadirpro/features/onboarding/onboarding.dart';
import 'package:hadirpro/features/shared/shared.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    debugLogDiagnostics: true,
    initialLocation: '/dashboard',
    routes: <RouteBase>[
      GoRoute(
        path: '/login',
        builder: (BuildContext context, GoRouterState state) =>
            const RoleScreen(),
        routes: [
          GoRoute(
            path: 'teacher',
            builder: (BuildContext context, GoRouterState state) =>
                const TeacherAuthScreen(),
          ),
          GoRoute(
            path: 'student',
            builder: (BuildContext context, GoRouterState state) =>
                const StudentAuthScreen(),
          ),
        ],
      ),
      GoRoute(
        path: '/onboarding',
        builder: (BuildContext context, GoRouterState state) =>
            const OnboardingScreen(),
      ),
      GoRoute(
        path: '/dashboard',
        builder: (BuildContext context, GoRouterState state) {
          final authState = ref.read(authProvider);
          return authState.user!.map(
            student: (_) => const SizedBox(),
            teacher: (_) => const SizedBox(),
          );
        },
      ),
      GoRoute(
        path: '/loading',
        builder: (BuildContext context, GoRouterState state) =>
            const LoadingScreen(),
      ),
      GoRoute(
        path: '/error',
        builder: (BuildContext context, GoRouterState state) {
          final errorMessage =
              state.uri.queryParameters['message'] ?? 'Unknown error';
          final decodedErrorMessage = Uri.decodeComponent(errorMessage);
          return AppErrorScreen(errorMessage: decodedErrorMessage);
        },
      ),
    ],
    redirect: (context, state) {
      final authState = ref.watch(authProvider);
      final isBoarded = ref.watch(onboardingProvider);
      final currentPath = state.fullPath;

      if (authState.isLoading) {
        return '/loading';
      } else if (authState.errorMessage != null) {
        final errorMessage = Uri.encodeComponent(authState.errorMessage!);
        return '/error?message=$errorMessage';
      } else if (authState.user == null) {
        if (!isBoarded) {
          return '/onboarding';
        } else if (currentPath == '/login/teacher' ||
            currentPath == '/login/student') {
          return null;
        } else {
          return '/login';
        }
      } else {
        if (currentPath == '/' ||
            currentPath == '/login' ||
            currentPath == '/login/teacher' ||
            currentPath == '/login/student' ||
            currentPath == '/onboarding') {
          return '/dashboard';
        } else {
          return null;
        }
      }
    },
  );
});
