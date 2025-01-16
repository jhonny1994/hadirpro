import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hadir_core/features/auth/auth.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as sp;

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier(this._client) : super(const AuthState.loading()) {
    checkAuth();
  }

  final sp.SupabaseClient _client;

  String get userId => _client.auth.currentUser!.id;

  @override
  Stream<AuthState> get stream async* {
    yield state;
  }

  Future<void> checkAuth() async {
    if (state != const AuthState.loading()) {
      state = const AuthState.loading();
    }
    final user = _client.auth.currentUser;
    if (user != null) {
      if (user.emailConfirmedAt == null) {
        state = AuthState.verificationRequired(email: user.email!);
      } else {
        final profile = await getProfile();
        if (profile.role == Role.student) {
          state = AuthState.authenticatedStudent(profile);
        } else if (profile.role == Role.teacher) {
          state = AuthState.authenticatedTeacher(profile);
        }
      }
    } else {
      state = const AuthState.unauthenticated();
    }
  }

  Future<Profile> getProfile() async {
    final profileData = await _client
        .from('profiles')
        .select()
        .eq('id', _client.auth.currentUser!.id)
        .single();
    return Profile.fromJson(profileData);
  }

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    if (state != const AuthState.loading()) {
      state = const AuthState.loading();
    }
    try {
      await _client.auth.signInWithPassword(
        email: email,
        password: password,
      );
      await checkAuth();
    } on sp.AuthException catch (e) {
      if (e.code == 'email_not_confirmed') {
        state = AuthState.verificationRequired(email: email);
      } else {
        state = AuthState.unauthenticated(message: e.message);
      }
    }
  }

  Future<void> signOut() async {
    if (state != const AuthState.loading()) {
      state = const AuthState.loading();
    }
    await _client.auth.signOut();
    state = const AuthState.unauthenticated(
      message: 'Signed out successfully.',
      isSuccess: true,
    );
  }

  Future<void> signUp({
    required String fullName,
    required String email,
    required String password,
    required Role role,
    String? studentId,
  }) async {
    if (state != const AuthState.loading()) {
      state = const AuthState.loading();
    }
    try {
      await _client.auth.signUp(
        email: email,
        password: password,
        data: {
          'name': fullName,
          'role': role == Role.student ? 'student' : 'teacher',
          if (role == Role.student) 'student_id': studentId,
        },
      );
      state = AuthState.verificationRequired(email: email);
    } on sp.AuthException catch (e) {
      state = AuthState.unauthenticated(message: e.message);
    }
  }

  Future<void> verifyEmail({
    required String email,
    required String otp,
  }) async {
    if (state != const AuthState.loading()) {
      state = const AuthState.loading();
    }
    try {
      await _client.auth.verifyOTP(
        email: email,
        type: sp.OtpType.signup,
        token: otp,
      );
      await checkAuth();
    } on sp.AuthException catch (e) {
      state = AuthState.unauthenticated(message: e.message);
    } on TimeoutException catch (_) {
      state =
          const AuthState.unauthenticated(message: 'Verification timed out.');
    }
  }
}

enum Role { student, teacher }
