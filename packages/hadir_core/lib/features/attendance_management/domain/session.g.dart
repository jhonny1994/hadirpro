// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CourseSessionImpl _$$CourseSessionImplFromJson(Map<String, dynamic> json) =>
    _$CourseSessionImpl(
      id: json['id'] as String?,
      courseId: json['courseId'] as String,
      teacherId: json['teacherId'] as String,
      startTime: DateTime.parse(json['startTime'] as String),
      endTime: DateTime.parse(json['endTime'] as String),
      state: $enumDecodeNullable(_$SessionStateEnumMap, json['state']) ??
          SessionState.active,
      currentToken: json['currentToken'] as String?,
      tokenExpiresAt: json['tokenExpiresAt'] == null
          ? null
          : DateTime.parse(json['tokenExpiresAt'] as String),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$CourseSessionImplToJson(_$CourseSessionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'courseId': instance.courseId,
      'teacherId': instance.teacherId,
      'startTime': instance.startTime.toIso8601String(),
      'endTime': instance.endTime.toIso8601String(),
      'state': _$SessionStateEnumMap[instance.state]!,
      'currentToken': instance.currentToken,
      'tokenExpiresAt': instance.tokenExpiresAt?.toIso8601String(),
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

const _$SessionStateEnumMap = {
  SessionState.active: 'active',
  SessionState.cancelled: 'cancelled',
  SessionState.finished: 'finished',
};
