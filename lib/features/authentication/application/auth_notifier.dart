import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hadirpro/features/authentication/application/auth_state.dart';
import 'package:hadirpro/features/authentication/domain/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as sp;

class AuthStateNotifier extends StateNotifier<AuthState> {
  AuthStateNotifier(this._supabase) : super(const AuthState.loading()) {
    checkAuthStatus();
  }

  final sp.SupabaseClient _supabase;

  Future<User?> _getCurrentUser(sp.User? user) async {
    if (user != null) {
      final userRole = UserRole.values.firstWhere(
        (element) =>
            element.name == _supabase.auth.currentUser!.userMetadata!['role'],
      );
      final userData = await _fetchUserData(
        user.id,
        userRole,
      );
      return userData;
    } else {
      return null;
    }
  }

  Future<void> checkAuthStatus() async {
    if (state != const AuthState.loading()) {
      state = const AuthState.loading();
    }
    final user = _supabase.auth.currentUser;
    final userData = await _getCurrentUser(user);
    if (userData != null) {
      if (user?.emailConfirmedAt == null) {
        state = AuthState.verification(userData.email);
      } else {
        state = AuthState.authenticated(userData);
      }
    } else {
      state = const AuthState.unauthenticated();
    }
  }

  Future<void> verifyOtp(String email, String otp) async {
    if (state != const AuthState.loading()) {
      state = const AuthState.loading();
    }
    try {
      await _supabase.auth.verifyOTP(
        type: sp.OtpType.email,
        email: email,
        token: otp,
      );

      final user = _supabase.auth.currentUser;
      final userData = await _getCurrentUser(user);
      if (userData != null) {
        state = AuthState.authenticated(userData);
      } else {
        state = const AuthState.unauthenticated();
      }
    } on sp.AuthException catch (e) {
      state = AuthState.failure(e.message);
      rethrow;
    } catch (e) {
      state = AuthState.failure(e.toString());
      rethrow;
    }
  }

  Future<void> signIn(
    String email,
    String password,
  ) async {
    if (state != const AuthState.loading()) {
      state = const AuthState.loading();
    }
    try {
      final response = await _supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );

      final userData = await _getCurrentUser(response.user);

      if (userData != null) {
        state = AuthState.authenticated(userData);
      } else {
        state = const AuthState.unauthenticated();
      }
    } on sp.AuthException catch (e) {
      if (e.code == 'email_not_confirmed') {
        state = AuthState.verification(email);
      } else {
        state = AuthState.failure(e.message);
      }
      rethrow;
    } catch (e) {
      state = AuthState.failure(e.toString());
      rethrow;
    }
  }

  Future<void> signOut() async {
    if (state != const AuthState.loading()) {
      state = const AuthState.loading();
    }
    try {
      await _supabase.auth.signOut();
      state = const AuthState.unauthenticated();
    } on sp.AuthException catch (e) {
      state = AuthState.failure(e.message);
      rethrow;
    } catch (e) {
      state = AuthState.failure(e.toString());
      rethrow;
    }
  }

  Future<void> signUpStudent(
    String email,
    String password,
    String name,
    int studentId,
  ) async {
    if (state != const AuthState.loading()) {
      state = const AuthState.loading();
    }
    try {
      await _supabase.auth.signUp(
        email: email,
        password: password,
        data: {
          'name': name,
          'student_id': studentId,
          'role': 'student',
        },
      );

      state = AuthState.verification(email);
    } on sp.AuthException catch (e) {
      state = AuthState.failure(e.message);
      rethrow;
    } catch (e) {
      state = AuthState.failure(e.toString());
      rethrow;
    }
  }

  Future<void> signUpTeacher(
    String email,
    String password,
    String name,
  ) async {
    if (state != const AuthState.loading()) {
      state = const AuthState.loading();
    }
    try {
      await _supabase.auth.signUp(
        email: email,
        password: password,
        data: {
          'name': name,
          'role': 'teacher',
        },
      );
      state = AuthState.verification(email);
    } on sp.AuthException catch (e) {
      state = AuthState.failure(e.message);
      rethrow;
    } catch (e) {
      state = AuthState.failure(e.toString());
      rethrow;
    }
  }

  Future<User?> _fetchUserData(String userId, UserRole? role) async {
    try {
      if (role == UserRole.student) {
        final studentResponse = await _supabase
            .from('students')
            .select('id, email, name, student_id')
            .eq('id', userId)
            .maybeSingle();
        if (studentResponse != null) {
          return User.student(
            id: studentResponse['id'] as String,
            email: studentResponse['email'] as String,
            name: studentResponse['name'] as String,
            studentId: studentResponse['student_id'] as int,
          );
        }
      } else if (role == UserRole.teacher) {
        final teacherResponse = await _supabase
            .from('teachers')
            .select('id, email, name')
            .eq('id', userId)
            .maybeSingle();
        if (teacherResponse != null) {
          return User.teacher(
            id: teacherResponse['id'] as String,
            email: teacherResponse['email'] as String,
            name: teacherResponse['name'] as String,
          );
        }
      }
    } on sp.AuthException catch (e) {
      state = AuthState.failure(e.message);
      rethrow;
    } catch (e) {
      state = AuthState.failure(e.toString());
      rethrow;
    }
    return null;
  }
}
