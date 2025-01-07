import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hadir_core/hadir_core.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

enum SessionState { active, cancelled, finished }

class AttendanceManagement {
  AttendanceManagement(this._client);
  final SupabaseClient _client;

  Future<Either<Failure, CourseSession>> createSession(
    CourseSession session,
  ) async {
    try {
      final response = await _client
          .from('sessions')
          .insert(session.toJson())
          .select()
          .single();
      return right(CourseSession.fromJson(response));
    } on PostgrestException catch (e) {
      return left(Failure(e.message));
    }
  }

  Future<Either<Failure, Success>> deleteSession(String id) async {
    try {
      await _client.from('sessions').delete().eq('id', id);
      return right(const Success('Session deleted successfully.'));
    } on PostgrestException catch (e) {
      return left(Failure(e.message));
    }
  }

  Future<Either<Failure, Success>> cancelSession(String id) async {
    try {
      final session =
          await _client.from('sessions').select().eq('id', id).maybeSingle();

      if (session == null) {
        return left(const Failure('Session not found.'));
      }

      if (session['state'] == SessionState.cancelled ||
          session['state'] == SessionState.finished) {
        return left(const Failure('Session is already cancelled or finished.'));
      }

      await _client
          .from('sessions')
          .update({'state': SessionState.cancelled}).eq('id', id);

      return right(const Success('Session cancelled successfully.'));
    } on PostgrestException catch (e) {
      return left(Failure(e.message));
    }
  }

  Future<Either<Failure, CourseSession>> getSession(String id) async {
    try {
      final response =
          await _client.from('sessions').select().eq('id', id).maybeSingle();
      if (response == null) {
        return left(const Failure('Session not found.'));
      } else {
        return right(CourseSession.fromJson(response));
      }
    } on PostgrestException catch (e) {
      return left(Failure(e.message));
    }
  }

  Future<Either<Failure, List<CourseSession>>> getSessionsForTeacher(
    String teacherId,
  ) async {
    try {
      final response =
          await _client.from('sessions').select().eq('teacher_id', teacherId);
      return right(response.map((e) => CourseSession.fromJson(e)).toList());
    } on PostgrestException catch (e) {
      return left(Failure(e.message));
    }
  }

  Future<Either<Failure, List<CourseSession>>> getSessionsForCourse(
    String courseId,
  ) async {
    try {
      final response =
          await _client.from('sessions').select().eq('course_id', courseId);
      return right(response.map((e) => CourseSession.fromJson(e)).toList());
    } on PostgrestException catch (e) {
      return left(Failure(e.message));
    }
  }

  Future<Either<Failure, Success>> updateSession(CourseSession session) async {
    try {
      await _client
          .from('sessions')
          .update(session.toJson())
          .eq('id', session.id!);
      return right(const Success('Session updated successfully.'));
    } on PostgrestException catch (e) {
      return left(Failure(e.message));
    }
  }

  Future<Either<Failure, Success>> markAttendance(
    CourseAttendance attendance,
    String token,
  ) async {
    try {
      final validationResult =
          await _validateToken(attendance.sessionId, token);
      return validationResult.fold(
        (failure) => left(failure),
        (_) async {
          final enrollment = await _client
              .from('enrollments')
              .select()
              .eq('id', attendance.id!)
              .maybeSingle();

          if (enrollment == null) {
            return left(
              const Failure('Student is not enrolled in this course.'),
            );
          }
          await _client.from('attendances').insert(attendance.toJson());
          return right(const Success('Attendance marked successfully.'));
        },
      );
    } on PostgrestException catch (e) {
      return left(Failure(e.message));
    }
  }

  Future<Either<Failure, Success>> updateAttendance(
    CourseAttendance attendance,
  ) async {
    try {
      await _client
          .from('attendances')
          .update(attendance.toJson())
          .eq('id', attendance.id!);
      return right(const Success('Attendance updated successfully.'));
    } on PostgrestException catch (e) {
      return left(Failure(e.message));
    }
  }

  Future<Either<Failure, List<CourseAttendance>>> getAttendanceForStudent(
    String studentId,
  ) async {
    try {
      final response = await _client
          .from('attendances')
          .select()
          .eq('student_id', studentId);
      return right(response.map((e) => CourseAttendance.fromJson(e)).toList());
    } on PostgrestException catch (e) {
      return left(Failure(e.message));
    }
  }

  Future<Either<Failure, List<CourseAttendance>>> getAttendanceForSession(
    String sessionId,
  ) async {
    try {
      final response = await _client
          .from('attendances')
          .select()
          .eq('session_id', sessionId);
      return right(response.map((e) => CourseAttendance.fromJson(e)).toList());
    } on PostgrestException catch (e) {
      return left(Failure(e.message));
    }
  }

  Future<Either<Failure, Widget>> createQrCode(CourseSession session) async {
    try {
      final tokenResult = await _fetchSessionToken(session.id!);
      return tokenResult.fold(
        (failure) => left(failure),
        (token) {
          final qrData = json.encode({
            'sessionId': session.id,
            'token': token,
          });

          return right(
            PrettyQrView.data(
              data: qrData,
              decoration: const PrettyQrDecoration(
                image: PrettyQrDecorationImage(
                  image: AssetImage('images/flutter.png'),
                ),
              ),
            ),
          );
        },
      );
    } on PostgrestException catch (e) {
      return left(Failure(e.message));
    }
  }

  Future<Either<Failure, String>> _fetchSessionToken(String sessionId) async {
    try {
      final response = await _client
          .from('sessions')
          .select('current_token, token_expires_at')
          .eq('id', sessionId)
          .single();

      // Check if the token is still valid
      final expiresAt = DateTime.parse(response['token_expires_at'] as String);
      if (expiresAt.isBefore(DateTime.now())) {
        return left(const Failure('Token has expired.'));
      }

      return right(response['current_token'] as String);
    } on PostgrestException catch (e) {
      return left(Failure(e.message));
    }
  }

  Future<Either<Failure, Success>> _validateToken(
    String sessionId,
    String token,
  ) async {
    try {
      final response = await _client
          .from('sessions')
          .select('current_token, token_expires_at')
          .eq('id', sessionId)
          .single();
      if (response['current_token'] == token &&
          DateTime.parse(response['token_expires_at'] as String)
              .isAfter(DateTime.now())) {
        return right(const Success('Token is valid.'));
      } else {
        return left(const Failure('Invalid or expired token.'));
      }
    } on PostgrestException catch (e) {
      return left(Failure(e.message));
    }
  }
}
