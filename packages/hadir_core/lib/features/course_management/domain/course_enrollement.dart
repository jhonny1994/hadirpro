import 'package:freezed_annotation/freezed_annotation.dart';
part 'course_enrollement.freezed.dart';
part 'course_enrollement.g.dart';

@freezed
class CourseEnrollement with _$CourseEnrollement {
  const factory CourseEnrollement({
    String? id,
    required String courseId,
    required String studentId,
    required DateTime enrolledAt,
  }) = _CourseEnrollement;

  factory CourseEnrollement.fromJson(Map<String, dynamic> json) =>
      _$CourseEnrollementFromJson(json);
}
