import 'package:core/src/models/models.dart';
import 'package:core/src/providers/supabase_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'attendance_service.g.dart';

@riverpod
class AttendanceService extends _$AttendanceService {
  @override
  FutureOr<List<Attendance>> build() => [];

  Future<void> markAttendance(String classId, String studentId) async {
    state = const AsyncValue.loading();
    try {
      final supabase = ref.read(supabaseClientProvider);
      final attendance = Attendance(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        classId: classId,
        studentId: studentId,
        date: DateTime.now(),
        present: true,
        createdAt: DateTime.now(),
      );
      await supabase.from('attendance').insert(attendance.toJson());
      final newState = await getAttendance(classId);
      state = AsyncValue.data(newState);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<List<Attendance>> getAttendance(String classId) async {
    final supabase = ref.read(supabaseClientProvider);
    final response = await supabase
        .from('attendance')
        .select()
        .eq('class_id', classId)
        .order('created_at');

    return response.map(Attendance.fromJson).toList();
  }

  Future<List<Attendance>> getStudentAttendance(String studentId) async {
    final supabase = ref.read(supabaseClientProvider);
    final response = await supabase
        .from('attendance')
        .select()
        .eq('student_id', studentId)
        .order('created_at');

    return response.map(Attendance.fromJson).toList();
  }

  Future<List<Attendance>> getAttendanceByDateRange(
    String classId,
    DateTime startDate,
    DateTime endDate,
  ) async {
    final supabase = ref.read(supabaseClientProvider);
    final response = await supabase
        .from('attendance')
        .select()
        .eq('class_id', classId)
        .gte('date', startDate.toIso8601String())
        .lte('date', endDate.toIso8601String())
        .order('date');

    return response.map(Attendance.fromJson).toList();
  }

  Future<void> generateVerificationCode(String classId) async {
    state = const AsyncValue.loading();
    try {
      final supabase = ref.read(supabaseClientProvider);
      final code =
          DateTime.now().millisecondsSinceEpoch.toString().substring(7);
      await supabase
          .from('classes')
          .update({'verification_code': code}).eq('id', classId);
      final newState = await getAttendance(classId);
      state = AsyncValue.data(newState);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<bool> verifyAttendance(String classId, String code) async {
    try {
      final supabase = ref.read(supabaseClientProvider);
      final response = await supabase
          .from('classes')
          .select('verification_code')
          .eq('id', classId)
          .single();
      return response['verification_code'] == code;
    } catch (e) {
      return false;
    }
  }

  Future<void> markBatchAttendance({
    required String classId,
    required List<String> studentIds,
    required bool present,
  }) async {
    state = const AsyncValue.loading();
    try {
      final supabase = ref.read(supabaseClientProvider);
      final now = DateTime.now();

      final attendanceRecords = studentIds
          .map(
            (studentId) => {
              'id': '${now.millisecondsSinceEpoch}_$studentId',
              'class_id': classId,
              'student_id': studentId,
              'date': now.toIso8601String(),
              'present': present,
              'created_at': now.toIso8601String(),
            },
          )
          .toList();

      await supabase.from('attendance').insert(attendanceRecords);
      final newState = await getAttendance(classId);
      state = AsyncValue.data(newState);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}
