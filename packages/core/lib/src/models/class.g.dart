// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'class.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClassImpl _$$ClassImplFromJson(Map<String, dynamic> json) => _$ClassImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      professorId: json['professorId'] as String,
      studentIds: (json['studentIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      startTime: DateTime.parse(json['startTime'] as String),
      endTime: DateTime.parse(json['endTime'] as String),
      weekDays: (json['weekDays'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      description: json['description'] as String?,
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$ClassImplToJson(_$ClassImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'professorId': instance.professorId,
      'studentIds': instance.studentIds,
      'startTime': instance.startTime.toIso8601String(),
      'endTime': instance.endTime.toIso8601String(),
      'weekDays': instance.weekDays,
      'createdAt': instance.createdAt.toIso8601String(),
      'description': instance.description,
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
