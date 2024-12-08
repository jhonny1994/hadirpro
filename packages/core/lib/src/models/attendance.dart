import 'package:freezed_annotation/freezed_annotation.dart';

part 'attendance.freezed.dart';
part 'attendance.g.dart';

@freezed
class Attendance with _$Attendance {
  const factory Attendance({
    required String id,
    required String classId,
    required String studentId,
    required DateTime date,
    required bool present,
    required DateTime createdAt,
    String? verificationCode,
    DateTime? verifiedAt,
    String? notes,
    DateTime? updatedAt,
  }) = _Attendance;

  factory Attendance.fromJson(Map<String, dynamic> json) =>
      _$AttendanceFromJson(json);
}
