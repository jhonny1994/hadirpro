// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StudentImpl _$$StudentImplFromJson(Map<String, dynamic> json) =>
    _$StudentImpl(
      id: json['id'] as String,
      email: json['email'] as String,
      name: json['name'] as String,
      studentId: (json['studentId'] as num).toInt(),
      role: json['role'] as String? ?? 'student',
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$StudentImplToJson(_$StudentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'studentId': instance.studentId,
      'role': instance.role,
      'runtimeType': instance.$type,
    };

_$TeacherImpl _$$TeacherImplFromJson(Map<String, dynamic> json) =>
    _$TeacherImpl(
      id: json['id'] as String,
      email: json['email'] as String,
      name: json['name'] as String,
      role: json['role'] as String? ?? 'teacher',
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$TeacherImplToJson(_$TeacherImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'role': instance.role,
      'runtimeType': instance.$type,
    };
