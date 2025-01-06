import 'package:fpdart/fpdart.dart';
import 'package:hadir_core/hadir_core.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CourseManagment {
  CourseManagment(this._client);
  final SupabaseClient _client;

  Future<Either<Failure, Success>> createCourse(Course course) async {
    try {
      await _client.from('courses').insert(course.toJson());
      return right(const Success('Course created successfully.'));
    } on PostgrestException catch (e) {
      return left(Failure(e.message));
    }
  }

  Future<Either<Failure, Success>> deleteCourse(String id) async {
    try {
      await _client.from('courses').delete().eq('id', id);
      return right(const Success('Course deleted successfully.'));
    } on PostgrestException catch (e) {
      return left(Failure(e.message));
    }
  }

  Future<Either<Failure, Course>> getCourse(String id) async {
    try {
      final courseData =
          await _client.from('courses').select().eq('id', id).maybeSingle();
      if (courseData != null) {
        return right(Course.fromJson(courseData));
      } else {
        return left(const Failure('Course not found.'));
      }
    } on PostgrestException catch (e) {
      return left(Failure(e.message));
    }
  }

  Future<Either<Failure, List<Course>>> getCourses(String teacherId) async {
    try {
      final courseData =
          await _client.from('courses').select().eq('teacher_id', teacherId);

      return right(courseData.map((e) => Course.fromJson(e)).toList());
    } on PostgrestException catch (e) {
      return left(Failure(e.message));
    }
  }

  Stream<Either<Failure, List<Course>>> getCoursesStream(
    String teacherId,
  ) async* {
    try {
      final stream = _client
          .from('courses')
          .stream(primaryKey: ['id']).eq('teacher_id', teacherId);

      await for (final event in stream) {
        final courses = event.map((data) => Course.fromJson(data)).toList();
        yield right(courses);
      }
    } on PostgrestException catch (e) {
      yield left(Failure(e.message));
    }
  }

  Future<Either<Failure, Success>> updateCourse(Course course) async {
    try {
      await _client
          .from('courses')
          .update(course.toJson())
          .eq('id', course.id!);
      return right(const Success('Course updated successfully.'));
    } on PostgrestException catch (e) {
      return left(Failure(e.message));
    }
  }

  Future<Either<Failure, Success>> joinCourse(
    CourseEnrollement courseEnrollement,
  ) async {
    try {
      await _client
          .from('course_enrollments')
          .insert(courseEnrollement.toJson());
      return right(const Success('Joined course successfully.'));
    } on PostgrestException catch (e) {
      return left(Failure(e.message));
    }
  }

  Future<Either<Failure, Success>> leaveCourse(
    CourseEnrollement courseEnrollement,
  ) async {
    try {
      await _client
          .from('course_enrollments')
          .delete()
          .eq('course_id', courseEnrollement.courseId)
          .eq('student_id', courseEnrollement.studentId);
      return right(const Success('Left course successfully.'));
    } on PostgrestException catch (e) {
      return left(Failure(e.message));
    }
  }

  Future<Either<Failure, List<Course>>> getEnrolledCourses(
    String studentId,
  ) async {
    try {
      final courseData = await _client.from('course_enrollments').select('''
      courses:courses(*)
      ''').eq('student_id', studentId);
      return right(courseData.map(Course.fromJson).toList());
    } on PostgrestException catch (e) {
      return left(Failure(e.message));
    }
  }

  Future<Either<Failure, List<Profile>>> getEnrolledStudents(
    String courseId,
  ) async {
    try {
      final courseData = await _client.from('course_enrollments').select('''
      profiles:profiles(*)
      ''').eq('course_id', courseId);
      return right(courseData.map(Profile.fromJson).toList());
    } on PostgrestException catch (e) {
      return left(Failure(e.message));
    }
  }
}
