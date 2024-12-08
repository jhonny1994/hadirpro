import 'package:core/src/models/models.dart';
import 'package:core/src/providers/supabase_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'class_service.g.dart';

@riverpod
class ClassService extends _$ClassService {
  @override
  FutureOr<List<Class>> build() => [];

  Future<void> createClass(Class classData) async {
    state = const AsyncValue.loading();
    try {
      final supabase = ref.read(supabaseClientProvider);
      await supabase.from('classes').insert(classData.toJson());
      final newState = await getClasses();
      state = AsyncValue.data(newState);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<void> updateClass(Class classData) async {
    state = const AsyncValue.loading();
    try {
      final supabase = ref.read(supabaseClientProvider);
      await supabase
          .from('classes')
          .update(classData.toJson())
          .eq('id', classData.id);
      final newState = await getClasses();
      state = AsyncValue.data(newState);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<List<Class>> getClasses() async {
    final supabase = ref.read(supabaseClientProvider);
    final user = ref.read(supabaseUserProvider);
    if (user == null) return [];

    final response = await supabase
        .from('classes')
        .select()
        .eq('professor_id', user.id)
        .order('created_at');

    return response.map(Class.fromJson).toList();
  }

  Future<void> deleteClass(String classId) async {
    state = const AsyncValue.loading();
    try {
      final supabase = ref.read(supabaseClientProvider);
      await supabase.from('classes').delete().eq('id', classId);
      final newState = await getClasses();
      state = AsyncValue.data(newState);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  // New methods for enhanced features
  Future<void> joinClass({
    required String classId,
    required String studentId,
  }) async {
    state = const AsyncValue.loading();
    try {
      final supabase = ref.read(supabaseClientProvider);

      // Get current class data
      final response =
          await supabase.from('classes').select().eq('id', classId).single();

      final currentClass = Class.fromJson(response);
      final updatedStudentIds = List<String>.from(currentClass.studentIds)
        ..add(studentId);

      // Update class with new student
      await supabase.from('classes').update({
        'student_ids': updatedStudentIds,
        'updated_at': DateTime.now().toIso8601String(),
      }).eq('id', classId);

      final newState = await getClasses();
      state = AsyncValue.data(newState);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<void> removeStudent({
    required String classId,
    required String studentId,
  }) async {
    state = const AsyncValue.loading();
    try {
      final supabase = ref.read(supabaseClientProvider);

      // Get current class data
      final response =
          await supabase.from('classes').select().eq('id', classId).single();

      final currentClass = Class.fromJson(response);
      final updatedStudentIds = List<String>.from(currentClass.studentIds)
        ..remove(studentId);

      // Update class without the student
      await supabase.from('classes').update({
        'student_ids': updatedStudentIds,
        'updated_at': DateTime.now().toIso8601String(),
      }).eq('id', classId);

      final newState = await getClasses();
      state = AsyncValue.data(newState);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<List<Class>> getStudentClasses(String studentId) async {
    final supabase = ref.read(supabaseClientProvider);
    final response = await supabase
        .from('classes')
        .select()
        .contains('student_ids', [studentId]).order('created_at');

    return response.map(Class.fromJson).toList();
  }
}
