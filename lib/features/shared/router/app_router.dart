import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final navigatorKey = GlobalKey<NavigatorState>();

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: navigatorKey,
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) =>
            const SizedBox(),
      ),
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
            const SizedBox(),
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
    ],
  );
});
