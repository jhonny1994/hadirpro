import 'package:freezed_annotation/freezed_annotation.dart';

part 'course.freezed.dart';
part 'course.g.dart';

@freezed
class Course with _$Course {
  const factory Course({
    @JsonKey(includeToJson: false) String? id,
    required String name,
    required String description,
    @JsonKey(name: 'teacher_id') required String teacherId,
    @JsonKey(name: 'created_at', includeToJson: false) DateTime? createdAt,
    @JsonKey(name: 'updated_at', includeToJson: false) DateTime? updatedAt,
  }) = _Course;

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);
}
