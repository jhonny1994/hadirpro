import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hadirpro/features/authentication/application/auth_notifier.dart';
import 'package:hadirpro/features/authentication/application/auth_state.dart';
import 'package:hadirpro/features/shared/providers/supabase_provider.dart';

final authProvider = StateNotifierProvider<AuthStateNotifier, AuthState>((ref) {
  final supabase = ref.watch(supabaseClientProvider);
  return AuthStateNotifier(supabase);
});
