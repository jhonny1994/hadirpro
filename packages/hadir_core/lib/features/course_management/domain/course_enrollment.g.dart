// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_enrollment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CourseEnrollementImpl _$$CourseEnrollementImplFromJson(
        Map<String, dynamic> json) =>
    _$CourseEnrollementImpl(
      id: json['id'] as String?,
      courseId: json['courseId'] as String,
      studentId: json['studentId'] as String,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$CourseEnrollementImplToJson(
        _$CourseEnrollementImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'courseId': instance.courseId,
      'studentId': instance.studentId,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
