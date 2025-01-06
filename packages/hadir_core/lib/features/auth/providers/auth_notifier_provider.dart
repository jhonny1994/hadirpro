import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hadir_core/core/core.dart';
import 'package:hadir_core/features/auth/application/auth_notifier.dart';
import 'package:hadir_core/features/auth/domain/auth_state.dart';

final authNotifierProvider =
    StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final client = ref.watch(supabaseProvider);
  return AuthNotifier(client);
});
