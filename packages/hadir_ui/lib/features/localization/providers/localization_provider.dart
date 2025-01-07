import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hadir_ui/core/core.dart';
import 'package:hadir_ui/features/localization/localization.dart';

final localizationNotifierProvider =
    StateNotifierProvider<LocalizationNotifier, Locale>((ref) {
  return LocalizationNotifier(ref.read(sharedPreferencesProvider));
});
