// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CourseAttendanceImpl _$$CourseAttendanceImplFromJson(
        Map<String, dynamic> json) =>
    _$CourseAttendanceImpl(
      id: json['id'] as String?,
      sessionId: json['sessionId'] as String,
      studentId: json['studentId'] as String,
      present: json['present'] as bool? ?? true,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$CourseAttendanceImplToJson(
        _$CourseAttendanceImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sessionId': instance.sessionId,
      'studentId': instance.studentId,
      'present': instance.present,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
