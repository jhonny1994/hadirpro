import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hadir_core/hadir_core.dart';
import 'package:hadir_ui/hadir_ui.dart';
import 'package:hadirproteacher/hadir_pro_teacher.dart';

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
        authenticatedTeacher: (profile) {
          if (state.uri.path.startsWith('/teacher/courses') ||
              state.uri.path.startsWith('/teacher/sessions')) {
            return null;
          } else {
            return '/teacher';
          }
        },
        unauthenticated: (message, isSuccess) {
          if (message != null) {
            return '/auth?message=${Uri.encodeComponent(message)}&isSuccess=$isSuccess';
          } else {
            return '/auth';
          }
        },
        loading: () => null,
        verificationRequired: (email) => '/verify-email?email=$email',
      );
    },
    routes: [
      ShellRoute(
        builder: (context, state, child) => BaseScreen(child: child),
        routes: [
          GoRoute(
            path: '/loading',
            builder: (context, state) => const LoadingScreen(),
          ),
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
              final isSuccess =
                  bool.parse(state.uri.queryParameters['isSuccess'] ?? 'false');
              return AuthScreen(
                message: errorMessage,
                isSuccess: isSuccess,
              );
            },
          ),
          GoRoute(
            path: '/verify-email',
            builder: (context, state) {
              final email = state.uri.queryParameters['email']!;
              return VerifyEmailScreen(email: email);
            },
          ),
          ShellRoute(
            builder: (context, state, child) =>
                DashboardNavigationScreen(child: child),
            routes: [
              GoRoute(
                path: '/teacher',
                builder: (context, state) => const DashboardScreen(),
                routes: [
                  GoRoute(
                    path: 'courses',
                    builder: (context, state) => const CoursesScreen(),
                  ),
                  GoRoute(
                    path: 'sessions',
                    builder: (context, state) => const SessionsScreen(),
                    routes: [
                      GoRoute(
                        path: '/:sessionId',
                        name: 'session',
                        builder: (context, state) {
                          final sessionId = state.pathParameters['sessionId']!;
                          return Text(sessionId);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
});
