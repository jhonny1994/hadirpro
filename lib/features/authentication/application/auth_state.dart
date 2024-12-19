import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hadirpro/features/authentication/domain/user_model.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    User? user,
    @Default(false) bool isLoading,
    String? errorMessage,
  }) = _AuthState;
}
