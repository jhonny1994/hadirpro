import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hadir_core/features/auth/domain/profile.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.authenticatedTeacher(Profile profile) =
      _AuthenticatedTeacher;

  const factory AuthState.authenticatedStudent(Profile profile) =
      _AuthenticatedStudent;

  const factory AuthState.unauthenticated({String? message}) = _Unauthenticated;

  const factory AuthState.loading() = _Loading;

  const factory AuthState.verificationRequired({required String email}) =
      _VerificationRequired;
}
