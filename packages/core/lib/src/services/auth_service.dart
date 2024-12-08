import 'package:core/src/models/models.dart';
import 'package:core/src/providers/supabase_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as sp;

part 'auth_service.g.dart';

@riverpod
class AuthService extends _$AuthService {
  @override
  AuthState build() => const AuthState.initial();

  Future<void> checkAuth() async {
    state = const AuthState.loading();
    try {
      final user = ref.read(supabaseUserProvider);
      if (user == null) {
        state = const AuthState.unauthenticated();
        return;
      }
      final supabase = ref.read(supabaseClientProvider);
      final response =
          await supabase.from('users').select().eq('id', user.id).single();
      state = AuthState.authenticated(User.fromJson(response));
    } catch (e) {
      state = AuthState.error(e.toString());
    }
  }

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    state = const AuthState.loading();
    try {
      final auth = ref.read(supabaseAuthProvider);
      final response = await auth.signInWithPassword(
        email: email,
        password: password,
      );
      final supabase = ref.read(supabaseClientProvider);
      final userData = await supabase
          .from('users')
          .select()
          .eq('id', response.user!.id)
          .single();
      state = AuthState.authenticated(User.fromJson(userData));
    } catch (e) {
      state = AuthState.error(e.toString());
    }
  }

  Future<void> signUp({
    required String email,
    required String password,
    required String name,
    required bool isProfessor,
    String? studentId,
  }) async {
    state = const AuthState.loading();
    try {
      final auth = ref.read(supabaseAuthProvider);
      final supabase = ref.read(supabaseClientProvider);

      // Validate student ID if registering as student
      if (!isProfessor && (studentId == null || studentId.isEmpty)) {
        throw 'Student ID is required for student registration';
      }

      // Create auth user
      final response = await auth.signUp(
        email: email,
        password: password,
      );

      if (response.user == null) {
        throw 'Failed to create user';
      }

      // Create user profile
      final user = User(
        id: response.user!.id,
        name: name,
        email: email,
        isProfessor: isProfessor,
        studentId: studentId,
        createdAt: DateTime.now(),
      );

      await supabase.from('users').insert(user.toJson());
      state = AuthState.authenticated(user);
    } catch (e) {
      state = AuthState.error(e.toString());
    }
  }

  Future<void> resetPassword(String email) async {
    state = const AuthState.loading();
    try {
      final auth = ref.read(supabaseAuthProvider);
      await auth.resetPasswordForEmail(email);
      state = const AuthState.unauthenticated();
    } catch (e) {
      state = AuthState.error(e.toString());
    }
  }

  Future<void> updatePassword(String newPassword) async {
    state = const AuthState.loading();
    try {
      final auth = ref.read(supabaseAuthProvider);
      await auth.updateUser(
        sp.UserAttributes(
          password: newPassword,
        ),
      );
      state = const AuthState.unauthenticated();
    } catch (e) {
      state = AuthState.error(e.toString());
    }
  }

  Future<void> verifyEmail(String email) async {
    state = const AuthState.loading();
    try {
      final auth = ref.read(supabaseAuthProvider);
      await auth.verifyOTP(
        email: email,
        type: sp.OtpType.signup,
      );
      state = const AuthState.unauthenticated();
    } catch (e) {
      state = AuthState.error(e.toString());
    }
  }

  Future<void> signOut() async {
    state = const AuthState.loading();
    try {
      final auth = ref.read(supabaseAuthProvider);
      await auth.signOut();
      state = const AuthState.unauthenticated();
    } catch (e) {
      state = AuthState.error(e.toString());
    }
  }
}
