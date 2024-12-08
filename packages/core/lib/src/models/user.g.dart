// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      isProfessor: json['isProfessor'] as bool,
      createdAt: DateTime.parse(json['createdAt'] as String),
      studentId: json['studentId'] as String?,
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'isProfessor': instance.isProfessor,
      'createdAt': instance.createdAt.toIso8601String(),
      'studentId': instance.studentId,
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
