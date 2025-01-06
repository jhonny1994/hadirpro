import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hadir_core/features/auth/auth.dart';

part 'profile.freezed.dart';
part 'profile.g.dart';

@freezed
class Profile with _$Profile {
  const factory Profile(
    String? id,
    String fullName,
    String email,
    Role role,
    String? studentId,
  ) = _Profile;

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);
}
