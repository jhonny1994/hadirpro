import 'package:freezed_annotation/freezed_annotation.dart';

part 'class.freezed.dart';
part 'class.g.dart';

@freezed
class Class with _$Class {
  const factory Class({
    required String id,
    required String name,
    required String professorId,
    required List<String> studentIds,
    required DateTime startTime,
    required DateTime endTime,
    required List<int> weekDays,
    required DateTime createdAt,
    String? description,
    DateTime? updatedAt,
  }) = _Class;

  factory Class.fromJson(Map<String, dynamic> json) => _$ClassFromJson(json);
}
