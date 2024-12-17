import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hadirpro/features/shared/router/app_router.dart';
import 'package:hadirpro/features/shared/theme/theme.dart';
import 'package:hadirpro/features/shared/theme/theme_provider.dart';
import 'package:hadirpro/features/shared/utils/shared_prefrences_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  final sharedPreferences = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(sharedPreferences),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    final themeMode = ref.watch(themeProvider);

    return MaterialApp.router(
      routerConfig: router,
      theme: AppTheme.getTheme(themeMode),
    );
  }
}
