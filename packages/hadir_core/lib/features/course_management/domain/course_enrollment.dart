import 'package:freezed_annotation/freezed_annotation.dart';
part 'course_enrollment.freezed.dart';
part 'course_enrollment.g.dart';

@freezed
class CourseEnrollement with _$CourseEnrollement {
  const factory CourseEnrollement({
    String? id,
    required String courseId,
    required String studentId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _CourseEnrollement;

  factory CourseEnrollement.fromJson(Map<String, dynamic> json) =>
      _$CourseEnrollementFromJson(json);
}
