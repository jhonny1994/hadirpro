import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hadir_core/hadir_core.dart';

final attendanceManagementProvider = Provider<AttendanceManagement>((ref) {
  final client = ref.watch(supabaseProvider);
  return AttendanceManagement(client);
});

final sessionsProvider =
    FutureProvider<Either<Failure, List<CourseSession>>>((ref) async {
  final user = ref.watch(authNotifierProvider.notifier).userId;
  return ref.watch(attendanceManagementProvider).getSessionsForTeacher(user);
});
