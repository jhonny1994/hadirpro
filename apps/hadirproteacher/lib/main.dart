import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hadir_ui/hadir_ui.dart';
import 'package:hadirproteacher/hadir_pro_teacher.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:system_theme/system_theme.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();
  await SystemTheme.accentColor.load();
  await dotenv.load();
  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL'] ?? '',
    anonKey: dotenv.env['SUPABASE_ANON_KEY'] ?? '',
  );
  const windowOptions = WindowOptions(
    size: Size(720, 720),
    minimumSize: Size(720, 720),
    title: 'HadirPro Teacher',
    alwaysOnTop: true,
    titleBarStyle: TitleBarStyle.hidden,
  );
  await windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });
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
    final idDarkTheme = ref.watch(dynamicThemeNotifierProvider);
    final router = ref.watch(routerProvider);
    return Sizer(
      builder: (context, orientation, screenType) => FluentApp.router(
        routerConfig: router,
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          FluentLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        themeMode: idDarkTheme ? ThemeMode.dark : ThemeMode.light,
        darkTheme: AppTheme.darkTheme,
        theme: AppTheme.lightTheme,
      ),
    );
  }
}
