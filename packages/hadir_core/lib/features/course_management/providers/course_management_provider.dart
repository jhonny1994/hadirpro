import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hadir_core/hadir_core.dart';

final courseManagementProvider = Provider<CourseManagment>((ref) {
  final client = ref.watch(supabaseProvider);
  return CourseManagment(client);
});

final coursesProvider =
    FutureProvider<Either<Failure, List<Course>>>((ref) async {
  final userId = ref.read(authNotifierProvider.notifier).userId;
  return ref.watch(courseManagementProvider).getCourses(userId);
});
