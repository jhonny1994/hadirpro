import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hadirpro/features/authentication/authentication.dart';
import 'package:hadirpro/features/authentication/presentation/verification_screen.dart';
import 'package:hadirpro/features/onboarding/onboarding.dart';
import 'package:hadirpro/features/shared/shared.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/loading',
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
        path: '/dashboard/:role',
        builder: (BuildContext context, GoRouterState state) {
          final role = state.pathParameters['role'];
          if (role == 'teacher') {
            return const SizedBox();
          } else if (role == 'student') {
            return const SizedBox();
          } else {
            return const SizedBox();
          }
        },
      ),
      GoRoute(
        path: '/loading',
        builder: (BuildContext context, GoRouterState state) =>
            const LoadingScreen(),
      ),
      GoRoute(
        path: '/verification',
        builder: (BuildContext context, GoRouterState state) {
          final email = state.uri.queryParameters['email']!;
          final decodedEmail = Uri.decodeComponent(email);
          return VerificationScreen(email: decodedEmail);
        },
      ),
      GoRoute(
        path: '/error',
        builder: (BuildContext context, GoRouterState state) {
          final errorMessage = state.uri.queryParameters['message']!;
          final decodedErrorMessage = Uri.decodeComponent(errorMessage);
          return AppErrorScreen(errorMessage: decodedErrorMessage);
        },
      ),
    ],
    redirect: (context, state) {
      final authState = ref.watch(authProvider);
      final isBoarded = ref.watch(onboardingProvider);
      final currentPath = state.fullPath;

      if (isBoarded) {
        return authState.when(
          authenticated: (user) => '/dashboard/${user.role.name}',
          verification: (email) {
            final encodedEmail = Uri.encodeComponent(email);
            return '/verification?email=$encodedEmail';
          },
          failure: (message) {
            final encodedMessage = Uri.encodeComponent(message);
            return '/error?message=$encodedMessage';
          },
          loading: () => '/loading',
          unauthenticated: () {
            if (currentPath == '/login/teacher' ||
                currentPath == '/login/student') {
              return null;
            }
            return '/login';
          },
        );
      } else {
        return '/onboarding';
      }
    },
  );
});
