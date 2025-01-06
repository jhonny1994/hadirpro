// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileImpl _$$ProfileImplFromJson(Map<String, dynamic> json) =>
    _$ProfileImpl(
      json['id'] as String?,
      json['fullName'] as String,
      json['email'] as String,
      $enumDecode(_$RoleEnumMap, json['role']),
      json['studentId'] as String?,
    );

Map<String, dynamic> _$$ProfileImplToJson(_$ProfileImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'email': instance.email,
      'role': _$RoleEnumMap[instance.role]!,
      'studentId': instance.studentId,
    };

const _$RoleEnumMap = {
  Role.student: 'student',
  Role.teacher: 'teacher',
};
