import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class User with _$User {
  const factory User.student({
    required String id,
    required String email,
    required String name,
    required int studentId,
    @Default('student') String role,
  }) = Student;

  const factory User.teacher({
    required String id,
    required String email,
    required String name,
    @Default('teacher') String role,
  }) = Teacher;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
