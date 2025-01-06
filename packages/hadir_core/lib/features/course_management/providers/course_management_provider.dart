import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hadir_core/hadir_core.dart';

final courseManagementProvider = Provider<CourseManagment>((ref) {
  final client = ref.watch(supabaseProvider);
  return CourseManagment(client);
});
