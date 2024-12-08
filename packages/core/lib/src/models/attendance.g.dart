// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AttendanceImpl _$$AttendanceImplFromJson(Map<String, dynamic> json) =>
    _$AttendanceImpl(
      id: json['id'] as String,
      classId: json['classId'] as String,
      studentId: json['studentId'] as String,
      date: DateTime.parse(json['date'] as String),
      present: json['present'] as bool,
      createdAt: DateTime.parse(json['createdAt'] as String),
      verificationCode: json['verificationCode'] as String?,
      verifiedAt: json['verifiedAt'] == null
          ? null
          : DateTime.parse(json['verifiedAt'] as String),
      notes: json['notes'] as String?,
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$AttendanceImplToJson(_$AttendanceImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'classId': instance.classId,
      'studentId': instance.studentId,
      'date': instance.date.toIso8601String(),
      'present': instance.present,
      'createdAt': instance.createdAt.toIso8601String(),
      'verificationCode': instance.verificationCode,
      'verifiedAt': instance.verifiedAt?.toIso8601String(),
      'notes': instance.notes,
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
