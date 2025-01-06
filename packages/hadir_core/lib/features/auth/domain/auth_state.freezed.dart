// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Profile profile) authenticatedTeacher,
    required TResult Function(Profile profile) authenticatedStudent,
    required TResult Function(String? message) unauthenticated,
    required TResult Function() loading,
    required TResult Function(String email) verificationRequired,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Profile profile)? authenticatedTeacher,
    TResult? Function(Profile profile)? authenticatedStudent,
    TResult? Function(String? message)? unauthenticated,
    TResult? Function()? loading,
    TResult? Function(String email)? verificationRequired,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Profile profile)? authenticatedTeacher,
    TResult Function(Profile profile)? authenticatedStudent,
    TResult Function(String? message)? unauthenticated,
    TResult Function()? loading,
    TResult Function(String email)? verificationRequired,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthenticatedTeacher value) authenticatedTeacher,
    required TResult Function(_AuthenticatedStudent value) authenticatedStudent,
    required TResult Function(_Unauthenticated value) unauthenticated,
    required TResult Function(_Loading value) loading,
    required TResult Function(_VerificationRequired value) verificationRequired,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthenticatedTeacher value)? authenticatedTeacher,
    TResult? Function(_AuthenticatedStudent value)? authenticatedStudent,
    TResult? Function(_Unauthenticated value)? unauthenticated,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_VerificationRequired value)? verificationRequired,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthenticatedTeacher value)? authenticatedTeacher,
    TResult Function(_AuthenticatedStudent value)? authenticatedStudent,
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_Loading value)? loading,
    TResult Function(_VerificationRequired value)? verificationRequired,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$AuthenticatedTeacherImplCopyWith<$Res> {
  factory _$$AuthenticatedTeacherImplCopyWith(_$AuthenticatedTeacherImpl value,
          $Res Function(_$AuthenticatedTeacherImpl) then) =
      __$$AuthenticatedTeacherImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Profile profile});

  $ProfileCopyWith<$Res> get profile;
}

/// @nodoc
class __$$AuthenticatedTeacherImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthenticatedTeacherImpl>
    implements _$$AuthenticatedTeacherImplCopyWith<$Res> {
  __$$AuthenticatedTeacherImplCopyWithImpl(_$AuthenticatedTeacherImpl _value,
      $Res Function(_$AuthenticatedTeacherImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profile = null,
  }) {
    return _then(_$AuthenticatedTeacherImpl(
      null == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as Profile,
    ));
  }

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProfileCopyWith<$Res> get profile {
    return $ProfileCopyWith<$Res>(_value.profile, (value) {
      return _then(_value.copyWith(profile: value));
    });
  }
}

/// @nodoc

class _$AuthenticatedTeacherImpl implements _AuthenticatedTeacher {
  const _$AuthenticatedTeacherImpl(this.profile);

  @override
  final Profile profile;

  @override
  String toString() {
    return 'AuthState.authenticatedTeacher(profile: $profile)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthenticatedTeacherImpl &&
            (identical(other.profile, profile) || other.profile == profile));
  }

  @override
  int get hashCode => Object.hash(runtimeType, profile);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthenticatedTeacherImplCopyWith<_$AuthenticatedTeacherImpl>
      get copyWith =>
          __$$AuthenticatedTeacherImplCopyWithImpl<_$AuthenticatedTeacherImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Profile profile) authenticatedTeacher,
    required TResult Function(Profile profile) authenticatedStudent,
    required TResult Function(String? message) unauthenticated,
    required TResult Function() loading,
    required TResult Function(String email) verificationRequired,
  }) {
    return authenticatedTeacher(profile);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Profile profile)? authenticatedTeacher,
    TResult? Function(Profile profile)? authenticatedStudent,
    TResult? Function(String? message)? unauthenticated,
    TResult? Function()? loading,
    TResult? Function(String email)? verificationRequired,
  }) {
    return authenticatedTeacher?.call(profile);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Profile profile)? authenticatedTeacher,
    TResult Function(Profile profile)? authenticatedStudent,
    TResult Function(String? message)? unauthenticated,
    TResult Function()? loading,
    TResult Function(String email)? verificationRequired,
    required TResult orElse(),
  }) {
    if (authenticatedTeacher != null) {
      return authenticatedTeacher(profile);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthenticatedTeacher value) authenticatedTeacher,
    required TResult Function(_AuthenticatedStudent value) authenticatedStudent,
    required TResult Function(_Unauthenticated value) unauthenticated,
    required TResult Function(_Loading value) loading,
    required TResult Function(_VerificationRequired value) verificationRequired,
  }) {
    return authenticatedTeacher(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthenticatedTeacher value)? authenticatedTeacher,
    TResult? Function(_AuthenticatedStudent value)? authenticatedStudent,
    TResult? Function(_Unauthenticated value)? unauthenticated,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_VerificationRequired value)? verificationRequired,
  }) {
    return authenticatedTeacher?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthenticatedTeacher value)? authenticatedTeacher,
    TResult Function(_AuthenticatedStudent value)? authenticatedStudent,
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_Loading value)? loading,
    TResult Function(_VerificationRequired value)? verificationRequired,
    required TResult orElse(),
  }) {
    if (authenticatedTeacher != null) {
      return authenticatedTeacher(this);
    }
    return orElse();
  }
}

abstract class _AuthenticatedTeacher implements AuthState {
  const factory _AuthenticatedTeacher(final Profile profile) =
      _$AuthenticatedTeacherImpl;

  Profile get profile;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthenticatedTeacherImplCopyWith<_$AuthenticatedTeacherImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthenticatedStudentImplCopyWith<$Res> {
  factory _$$AuthenticatedStudentImplCopyWith(_$AuthenticatedStudentImpl value,
          $Res Function(_$AuthenticatedStudentImpl) then) =
      __$$AuthenticatedStudentImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Profile profile});

  $ProfileCopyWith<$Res> get profile;
}

/// @nodoc
class __$$AuthenticatedStudentImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthenticatedStudentImpl>
    implements _$$AuthenticatedStudentImplCopyWith<$Res> {
  __$$AuthenticatedStudentImplCopyWithImpl(_$AuthenticatedStudentImpl _value,
      $Res Function(_$AuthenticatedStudentImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profile = null,
  }) {
    return _then(_$AuthenticatedStudentImpl(
      null == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as Profile,
    ));
  }

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProfileCopyWith<$Res> get profile {
    return $ProfileCopyWith<$Res>(_value.profile, (value) {
      return _then(_value.copyWith(profile: value));
    });
  }
}

/// @nodoc

class _$AuthenticatedStudentImpl implements _AuthenticatedStudent {
  const _$AuthenticatedStudentImpl(this.profile);

  @override
  final Profile profile;

  @override
  String toString() {
    return 'AuthState.authenticatedStudent(profile: $profile)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthenticatedStudentImpl &&
            (identical(other.profile, profile) || other.profile == profile));
  }

  @override
  int get hashCode => Object.hash(runtimeType, profile);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthenticatedStudentImplCopyWith<_$AuthenticatedStudentImpl>
      get copyWith =>
          __$$AuthenticatedStudentImplCopyWithImpl<_$AuthenticatedStudentImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Profile profile) authenticatedTeacher,
    required TResult Function(Profile profile) authenticatedStudent,
    required TResult Function(String? message) unauthenticated,
    required TResult Function() loading,
    required TResult Function(String email) verificationRequired,
  }) {
    return authenticatedStudent(profile);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Profile profile)? authenticatedTeacher,
    TResult? Function(Profile profile)? authenticatedStudent,
    TResult? Function(String? message)? unauthenticated,
    TResult? Function()? loading,
    TResult? Function(String email)? verificationRequired,
  }) {
    return authenticatedStudent?.call(profile);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Profile profile)? authenticatedTeacher,
    TResult Function(Profile profile)? authenticatedStudent,
    TResult Function(String? message)? unauthenticated,
    TResult Function()? loading,
    TResult Function(String email)? verificationRequired,
    required TResult orElse(),
  }) {
    if (authenticatedStudent != null) {
      return authenticatedStudent(profile);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthenticatedTeacher value) authenticatedTeacher,
    required TResult Function(_AuthenticatedStudent value) authenticatedStudent,
    required TResult Function(_Unauthenticated value) unauthenticated,
    required TResult Function(_Loading value) loading,
    required TResult Function(_VerificationRequired value) verificationRequired,
  }) {
    return authenticatedStudent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthenticatedTeacher value)? authenticatedTeacher,
    TResult? Function(_AuthenticatedStudent value)? authenticatedStudent,
    TResult? Function(_Unauthenticated value)? unauthenticated,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_VerificationRequired value)? verificationRequired,
  }) {
    return authenticatedStudent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthenticatedTeacher value)? authenticatedTeacher,
    TResult Function(_AuthenticatedStudent value)? authenticatedStudent,
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_Loading value)? loading,
    TResult Function(_VerificationRequired value)? verificationRequired,
    required TResult orElse(),
  }) {
    if (authenticatedStudent != null) {
      return authenticatedStudent(this);
    }
    return orElse();
  }
}

abstract class _AuthenticatedStudent implements AuthState {
  const factory _AuthenticatedStudent(final Profile profile) =
      _$AuthenticatedStudentImpl;

  Profile get profile;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthenticatedStudentImplCopyWith<_$AuthenticatedStudentImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnauthenticatedImplCopyWith<$Res> {
  factory _$$UnauthenticatedImplCopyWith(_$UnauthenticatedImpl value,
          $Res Function(_$UnauthenticatedImpl) then) =
      __$$UnauthenticatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$UnauthenticatedImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$UnauthenticatedImpl>
    implements _$$UnauthenticatedImplCopyWith<$Res> {
  __$$UnauthenticatedImplCopyWithImpl(
      _$UnauthenticatedImpl _value, $Res Function(_$UnauthenticatedImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$UnauthenticatedImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$UnauthenticatedImpl implements _Unauthenticated {
  const _$UnauthenticatedImpl({this.message});

  @override
  final String? message;

  @override
  String toString() {
    return 'AuthState.unauthenticated(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnauthenticatedImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UnauthenticatedImplCopyWith<_$UnauthenticatedImpl> get copyWith =>
      __$$UnauthenticatedImplCopyWithImpl<_$UnauthenticatedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Profile profile) authenticatedTeacher,
    required TResult Function(Profile profile) authenticatedStudent,
    required TResult Function(String? message) unauthenticated,
    required TResult Function() loading,
    required TResult Function(String email) verificationRequired,
  }) {
    return unauthenticated(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Profile profile)? authenticatedTeacher,
    TResult? Function(Profile profile)? authenticatedStudent,
    TResult? Function(String? message)? unauthenticated,
    TResult? Function()? loading,
    TResult? Function(String email)? verificationRequired,
  }) {
    return unauthenticated?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Profile profile)? authenticatedTeacher,
    TResult Function(Profile profile)? authenticatedStudent,
    TResult Function(String? message)? unauthenticated,
    TResult Function()? loading,
    TResult Function(String email)? verificationRequired,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthenticatedTeacher value) authenticatedTeacher,
    required TResult Function(_AuthenticatedStudent value) authenticatedStudent,
    required TResult Function(_Unauthenticated value) unauthenticated,
    required TResult Function(_Loading value) loading,
    required TResult Function(_VerificationRequired value) verificationRequired,
  }) {
    return unauthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthenticatedTeacher value)? authenticatedTeacher,
    TResult? Function(_AuthenticatedStudent value)? authenticatedStudent,
    TResult? Function(_Unauthenticated value)? unauthenticated,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_VerificationRequired value)? verificationRequired,
  }) {
    return unauthenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthenticatedTeacher value)? authenticatedTeacher,
    TResult Function(_AuthenticatedStudent value)? authenticatedStudent,
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_Loading value)? loading,
    TResult Function(_VerificationRequired value)? verificationRequired,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated(this);
    }
    return orElse();
  }
}

abstract class _Unauthenticated implements AuthState {
  const factory _Unauthenticated({final String? message}) =
      _$UnauthenticatedImpl;

  String? get message;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UnauthenticatedImplCopyWith<_$UnauthenticatedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'AuthState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Profile profile) authenticatedTeacher,
    required TResult Function(Profile profile) authenticatedStudent,
    required TResult Function(String? message) unauthenticated,
    required TResult Function() loading,
    required TResult Function(String email) verificationRequired,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Profile profile)? authenticatedTeacher,
    TResult? Function(Profile profile)? authenticatedStudent,
    TResult? Function(String? message)? unauthenticated,
    TResult? Function()? loading,
    TResult? Function(String email)? verificationRequired,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Profile profile)? authenticatedTeacher,
    TResult Function(Profile profile)? authenticatedStudent,
    TResult Function(String? message)? unauthenticated,
    TResult Function()? loading,
    TResult Function(String email)? verificationRequired,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthenticatedTeacher value) authenticatedTeacher,
    required TResult Function(_AuthenticatedStudent value) authenticatedStudent,
    required TResult Function(_Unauthenticated value) unauthenticated,
    required TResult Function(_Loading value) loading,
    required TResult Function(_VerificationRequired value) verificationRequired,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthenticatedTeacher value)? authenticatedTeacher,
    TResult? Function(_AuthenticatedStudent value)? authenticatedStudent,
    TResult? Function(_Unauthenticated value)? unauthenticated,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_VerificationRequired value)? verificationRequired,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthenticatedTeacher value)? authenticatedTeacher,
    TResult Function(_AuthenticatedStudent value)? authenticatedStudent,
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_Loading value)? loading,
    TResult Function(_VerificationRequired value)? verificationRequired,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements AuthState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$VerificationRequiredImplCopyWith<$Res> {
  factory _$$VerificationRequiredImplCopyWith(_$VerificationRequiredImpl value,
          $Res Function(_$VerificationRequiredImpl) then) =
      __$$VerificationRequiredImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$$VerificationRequiredImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$VerificationRequiredImpl>
    implements _$$VerificationRequiredImplCopyWith<$Res> {
  __$$VerificationRequiredImplCopyWithImpl(_$VerificationRequiredImpl _value,
      $Res Function(_$VerificationRequiredImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_$VerificationRequiredImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$VerificationRequiredImpl implements _VerificationRequired {
  const _$VerificationRequiredImpl({required this.email});

  @override
  final String email;

  @override
  String toString() {
    return 'AuthState.verificationRequired(email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerificationRequiredImpl &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VerificationRequiredImplCopyWith<_$VerificationRequiredImpl>
      get copyWith =>
          __$$VerificationRequiredImplCopyWithImpl<_$VerificationRequiredImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Profile profile) authenticatedTeacher,
    required TResult Function(Profile profile) authenticatedStudent,
    required TResult Function(String? message) unauthenticated,
    required TResult Function() loading,
    required TResult Function(String email) verificationRequired,
  }) {
    return verificationRequired(email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Profile profile)? authenticatedTeacher,
    TResult? Function(Profile profile)? authenticatedStudent,
    TResult? Function(String? message)? unauthenticated,
    TResult? Function()? loading,
    TResult? Function(String email)? verificationRequired,
  }) {
    return verificationRequired?.call(email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Profile profile)? authenticatedTeacher,
    TResult Function(Profile profile)? authenticatedStudent,
    TResult Function(String? message)? unauthenticated,
    TResult Function()? loading,
    TResult Function(String email)? verificationRequired,
    required TResult orElse(),
  }) {
    if (verificationRequired != null) {
      return verificationRequired(email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthenticatedTeacher value) authenticatedTeacher,
    required TResult Function(_AuthenticatedStudent value) authenticatedStudent,
    required TResult Function(_Unauthenticated value) unauthenticated,
    required TResult Function(_Loading value) loading,
    required TResult Function(_VerificationRequired value) verificationRequired,
  }) {
    return verificationRequired(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthenticatedTeacher value)? authenticatedTeacher,
    TResult? Function(_AuthenticatedStudent value)? authenticatedStudent,
    TResult? Function(_Unauthenticated value)? unauthenticated,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_VerificationRequired value)? verificationRequired,
  }) {
    return verificationRequired?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthenticatedTeacher value)? authenticatedTeacher,
    TResult Function(_AuthenticatedStudent value)? authenticatedStudent,
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_Loading value)? loading,
    TResult Function(_VerificationRequired value)? verificationRequired,
    required TResult orElse(),
  }) {
    if (verificationRequired != null) {
      return verificationRequired(this);
    }
    return orElse();
  }
}

abstract class _VerificationRequired implements AuthState {
  const factory _VerificationRequired({required final String email}) =
      _$VerificationRequiredImpl;

  String get email;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VerificationRequiredImplCopyWith<_$VerificationRequiredImpl>
      get copyWith => throw _privateConstructorUsedError;
}
