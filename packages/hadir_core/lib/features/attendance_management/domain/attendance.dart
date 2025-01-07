import 'package:freezed_annotation/freezed_annotation.dart';

part 'attendance.freezed.dart';
part 'attendance.g.dart';

@freezed
class CourseAttendance with _$CourseAttendance {
  const factory CourseAttendance({
    String? id,
    required String sessionId,
    required String studentId,
    @Default(true) bool present,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _CourseAttendance;

  factory CourseAttendance.fromJson(Map<String, dynamic> json) =>
      _$CourseAttendanceFromJson(json);
}
