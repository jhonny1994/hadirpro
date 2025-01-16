import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hadir_core/hadir_core.dart';

part 'session.freezed.dart';
part 'session.g.dart';

@freezed
class CourseSession with _$CourseSession {
  const factory CourseSession({
    @JsonKey(includeIfNull: false) String? id,
    @JsonKey(name: 'course_id') required String courseId,
    @JsonKey(name: 'teacher_id') required String teacherId,
    @JsonKey(name: 'start_time') required DateTime startTime,
    @JsonKey(name: 'end_time') required DateTime endTime,
    @JsonKey(includeIfNull: false, name: 'courses') Course? course,
    @Default(SessionState.active) SessionState state,
    @JsonKey(name: 'current_token') String? currentToken,
    @JsonKey(name: 'token_expires_at') DateTime? tokenExpiresAt,
    @JsonKey(name: 'created_at', includeToJson: false) DateTime? createdAt,
    @JsonKey(name: 'updated_at', includeToJson: false) DateTime? updatedAt,
  }) = _CourseSession;

  factory CourseSession.fromJson(Map<String, dynamic> json) =>
      _$CourseSessionFromJson(json);
}
