import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hadir_core/hadir_core.dart';

final attendanceManagementProvider = Provider<AttendanceManagement>((ref) {
  final client = ref.watch(supabaseProvider);
  return AttendanceManagement(client);
});
