// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_enrollement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CourseEnrollementImpl _$$CourseEnrollementImplFromJson(
        Map<String, dynamic> json) =>
    _$CourseEnrollementImpl(
      id: json['id'] as String?,
      courseId: json['courseId'] as String,
      studentId: json['studentId'] as String,
      enrolledAt: DateTime.parse(json['enrolledAt'] as String),
    );

Map<String, dynamic> _$$CourseEnrollementImplToJson(
        _$CourseEnrollementImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'courseId': instance.courseId,
      'studentId': instance.studentId,
      'enrolledAt': instance.enrolledAt.toIso8601String(),
    };
