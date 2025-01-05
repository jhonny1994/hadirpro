import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hadir_ui/core/core.dart';
import 'package:hadir_ui/features/dynamic_theme/dynamic_theme.dart';

final dynamicThemeNotifierProvider =
    StateNotifierProvider<DynamicThemeNotifier, bool>(
  (ref) => DynamicThemeNotifier(ref.read(sharedPreferencesProvider)),
);
