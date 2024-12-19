import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hadirpro/features/authentication/application/auth_state.dart';
import 'package:hadirpro/features/authentication/domain/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as sp;

class AuthStateNotifier extends StateNotifier<AuthState> {
  AuthStateNotifier(this._supabase) : super(const AuthState()) {
    checkAuthStatus();
  }

  final sp.SupabaseClient _supabase;

  void clearError() {
    state = state.copyWith(errorMessage: null);
  }

  Future<void> checkAuthStatus() async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    final user = _supabase.auth.currentUser;
    if (user != null) {
      final userRole = await _getUserRole(user.id);
      final userData = await _fetchUserData(user.id, userRole);
      state = state.copyWith(user: userData, isLoading: false);
    } else {
      state = const AuthState();
    }
  }

  Future<void> signIn(
    String email,
    String password,
  ) async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      final response = await _supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );

      final userRole = await _getUserRole(response.user!.id);
      final user = await _fetchUserData(response.user!.id, userRole);

      state = state.copyWith(
        user: user,
        isLoading: false,
      );
    } on sp.AuthException catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: e.message,
      );
      rethrow;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: e.toString(),
      );
      rethrow;
    }
  }

  Future<void> signOut() async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      await _supabase.auth.signOut();
      state = const AuthState();
    } on sp.AuthException catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: e.message,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: e.toString(),
      );
      rethrow;
    }
  }

  Future<void> signUpStudent(
    String email,
    String password,
    String name,
    int studentId,
  ) async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      final response = await _supabase.auth.signUp(
        email: email,
        password: password,
        data: {
          'name': name,
          'student_id': studentId,
          'role': 'student',
        },
      );

      final student = User.student(
        id: response.user!.id,
        email: email,
        name: name,
        studentId: studentId,
      );

      state = state.copyWith(
        user: student,
        isLoading: false,
      );
    } on sp.AuthException catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: e.message,
      );
      rethrow;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: e.toString(),
      );
      rethrow;
    }
  }

  Future<void> signUpTeacher(
    String email,
    String password,
    String name,
  ) async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final response = await _supabase.auth.signUp(
        email: email,
        password: password,
        data: {
          'name': name,
          'role': 'teacher',
        },
      );

      final teacher = User.teacher(
        id: response.user!.id,
        email: email,
        name: name,
      );
      state = state.copyWith(
        user: teacher,
        isLoading: false,
      );
    } on sp.AuthException catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: e.message,
      );
      rethrow;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: e.toString(),
      );
      rethrow;
    }
  }

  Future<User?> _fetchUserData(String userId, String? role) async {
    try {
      if (role == 'student') {
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
      } else if (role == 'teacher') {
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
    } on sp.PostgrestException catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: e.message,
      );
      rethrow;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Failed to fetch user data. Please try again.',
      );
      rethrow;
    }
    return null;
  }

  Future<String?> _getUserRole(String userId) async {
    try {
      final studentResponse = await _supabase
          .from('students')
          .select('id')
          .eq('id', userId)
          .maybeSingle();
      if (studentResponse != null) {
        return 'student';
      }

      final teacherResponse = await _supabase
          .from('teachers')
          .select('id')
          .eq('id', userId)
          .maybeSingle();
      if (teacherResponse != null) {
        return 'teacher';
      }
    } on sp.PostgrestException catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: e.message,
      );
      rethrow;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Failed to get user role. Please try again.',
      );
      rethrow;
    }
    return null;
  }
}
