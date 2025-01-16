import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hadir_core/core/core.dart';
import 'package:hadir_core/features/features.dart';

final authNotifierProvider =
    StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final client = ref.watch(supabaseProvider);
  return AuthNotifier(client);
});

final profileProvider = FutureProvider<Profile>((ref) async {
  return ref.read(authNotifierProvider.notifier).getProfile();
});
