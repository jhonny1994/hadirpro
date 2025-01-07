import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hadir_core/hadir_core.dart';

part 'session.freezed.dart';
part 'session.g.dart';

@freezed
class CourseSession with _$CourseSession {
  const factory CourseSession({
    String? id,
    required String courseId,
    required String teacherId,
    required DateTime startTime,
    required DateTime endTime,
    @Default(SessionState.active) SessionState state,
    String? currentToken,
    DateTime? tokenExpiresAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _CourseSession;

  factory CourseSession.fromJson(Map<String, dynamic> json) =>
      _$CourseSessionFromJson(json);
}
