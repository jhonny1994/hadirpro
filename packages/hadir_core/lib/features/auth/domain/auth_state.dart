import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hadir_core/features/auth/domain/profile.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.authenticatedTeacher(Profile profile) =
      AuthenticatedTeacher;

  const factory AuthState.authenticatedStudent(Profile profile) =
      AuthenticatedStudent;

  const factory AuthState.unauthenticated({String? message}) = Unauthenticated;

  const factory AuthState.loading() = Loading;

  const factory AuthState.verificationRequired({required String email}) =
      VerificationRequired;
}
