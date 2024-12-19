import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hadirpro/features/authentication/domain/user_model.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.authenticated(User user) = _Authenticated;

  const factory AuthState.verification(String email) = _Verification;

  const factory AuthState.failure(String message) = _Failure;

  const factory AuthState.loading() = _Loading;

  const factory AuthState.unauthenticated() = _Unauthenticated;
}
