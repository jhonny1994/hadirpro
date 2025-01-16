// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CourseSessionImpl _$$CourseSessionImplFromJson(Map<String, dynamic> json) =>
    _$CourseSessionImpl(
      id: json['id'] as String?,
      courseId: json['course_id'] as String,
      teacherId: json['teacher_id'] as String,
      startTime: DateTime.parse(json['start_time'] as String),
      endTime: DateTime.parse(json['end_time'] as String),
      course: json['courses'] == null
          ? null
          : Course.fromJson(json['courses'] as Map<String, dynamic>),
      state: $enumDecodeNullable(_$SessionStateEnumMap, json['state']) ??
          SessionState.active,
      currentToken: json['current_token'] as String?,
      tokenExpiresAt: json['token_expires_at'] == null
          ? null
          : DateTime.parse(json['token_expires_at'] as String),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$CourseSessionImplToJson(_$CourseSessionImpl instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      'course_id': instance.courseId,
      'teacher_id': instance.teacherId,
      'start_time': instance.startTime.toIso8601String(),
      'end_time': instance.endTime.toIso8601String(),
      if (instance.course case final value?) 'courses': value,
      'state': _$SessionStateEnumMap[instance.state]!,
      'current_token': instance.currentToken,
      'token_expires_at': instance.tokenExpiresAt?.toIso8601String(),
    };

const _$SessionStateEnumMap = {
  SessionState.active: 'active',
  SessionState.cancelled: 'cancelled',
  SessionState.finished: 'finished',
};
