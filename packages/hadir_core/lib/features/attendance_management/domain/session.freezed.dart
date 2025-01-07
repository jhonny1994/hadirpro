// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CourseSession _$CourseSessionFromJson(Map<String, dynamic> json) {
  return _CourseSession.fromJson(json);
}

/// @nodoc
mixin _$CourseSession {
  String? get id => throw _privateConstructorUsedError;
  String get courseId => throw _privateConstructorUsedError;
  String get teacherId => throw _privateConstructorUsedError;
  DateTime get startTime => throw _privateConstructorUsedError;
  DateTime get endTime => throw _privateConstructorUsedError;
  SessionState get state => throw _privateConstructorUsedError;
  String? get currentToken => throw _privateConstructorUsedError;
  DateTime? get tokenExpiresAt => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this CourseSession to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CourseSession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CourseSessionCopyWith<CourseSession> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourseSessionCopyWith<$Res> {
  factory $CourseSessionCopyWith(
          CourseSession value, $Res Function(CourseSession) then) =
      _$CourseSessionCopyWithImpl<$Res, CourseSession>;
  @useResult
  $Res call(
      {String? id,
      String courseId,
      String teacherId,
      DateTime startTime,
      DateTime endTime,
      SessionState state,
      String? currentToken,
      DateTime? tokenExpiresAt,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$CourseSessionCopyWithImpl<$Res, $Val extends CourseSession>
    implements $CourseSessionCopyWith<$Res> {
  _$CourseSessionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CourseSession
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? courseId = null,
    Object? teacherId = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? state = null,
    Object? currentToken = freezed,
    Object? tokenExpiresAt = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      courseId: null == courseId
          ? _value.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as String,
      teacherId: null == teacherId
          ? _value.teacherId
          : teacherId // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as SessionState,
      currentToken: freezed == currentToken
          ? _value.currentToken
          : currentToken // ignore: cast_nullable_to_non_nullable
              as String?,
      tokenExpiresAt: freezed == tokenExpiresAt
          ? _value.tokenExpiresAt
          : tokenExpiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CourseSessionImplCopyWith<$Res>
    implements $CourseSessionCopyWith<$Res> {
  factory _$$CourseSessionImplCopyWith(
          _$CourseSessionImpl value, $Res Function(_$CourseSessionImpl) then) =
      __$$CourseSessionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String courseId,
      String teacherId,
      DateTime startTime,
      DateTime endTime,
      SessionState state,
      String? currentToken,
      DateTime? tokenExpiresAt,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$$CourseSessionImplCopyWithImpl<$Res>
    extends _$CourseSessionCopyWithImpl<$Res, _$CourseSessionImpl>
    implements _$$CourseSessionImplCopyWith<$Res> {
  __$$CourseSessionImplCopyWithImpl(
      _$CourseSessionImpl _value, $Res Function(_$CourseSessionImpl) _then)
      : super(_value, _then);

  /// Create a copy of CourseSession
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? courseId = null,
    Object? teacherId = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? state = null,
    Object? currentToken = freezed,
    Object? tokenExpiresAt = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$CourseSessionImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      courseId: null == courseId
          ? _value.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as String,
      teacherId: null == teacherId
          ? _value.teacherId
          : teacherId // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as SessionState,
      currentToken: freezed == currentToken
          ? _value.currentToken
          : currentToken // ignore: cast_nullable_to_non_nullable
              as String?,
      tokenExpiresAt: freezed == tokenExpiresAt
          ? _value.tokenExpiresAt
          : tokenExpiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CourseSessionImpl implements _CourseSession {
  const _$CourseSessionImpl(
      {this.id,
      required this.courseId,
      required this.teacherId,
      required this.startTime,
      required this.endTime,
      this.state = SessionState.active,
      this.currentToken,
      this.tokenExpiresAt,
      this.createdAt,
      this.updatedAt});

  factory _$CourseSessionImpl.fromJson(Map<String, dynamic> json) =>
      _$$CourseSessionImplFromJson(json);

  @override
  final String? id;
  @override
  final String courseId;
  @override
  final String teacherId;
  @override
  final DateTime startTime;
  @override
  final DateTime endTime;
  @override
  @JsonKey()
  final SessionState state;
  @override
  final String? currentToken;
  @override
  final DateTime? tokenExpiresAt;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'CourseSession(id: $id, courseId: $courseId, teacherId: $teacherId, startTime: $startTime, endTime: $endTime, state: $state, currentToken: $currentToken, tokenExpiresAt: $tokenExpiresAt, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CourseSessionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.courseId, courseId) ||
                other.courseId == courseId) &&
            (identical(other.teacherId, teacherId) ||
                other.teacherId == teacherId) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.currentToken, currentToken) ||
                other.currentToken == currentToken) &&
            (identical(other.tokenExpiresAt, tokenExpiresAt) ||
                other.tokenExpiresAt == tokenExpiresAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      courseId,
      teacherId,
      startTime,
      endTime,
      state,
      currentToken,
      tokenExpiresAt,
      createdAt,
      updatedAt);

  /// Create a copy of CourseSession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CourseSessionImplCopyWith<_$CourseSessionImpl> get copyWith =>
      __$$CourseSessionImplCopyWithImpl<_$CourseSessionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CourseSessionImplToJson(
      this,
    );
  }
}

abstract class _CourseSession implements CourseSession {
  const factory _CourseSession(
      {final String? id,
      required final String courseId,
      required final String teacherId,
      required final DateTime startTime,
      required final DateTime endTime,
      final SessionState state,
      final String? currentToken,
      final DateTime? tokenExpiresAt,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$CourseSessionImpl;

  factory _CourseSession.fromJson(Map<String, dynamic> json) =
      _$CourseSessionImpl.fromJson;

  @override
  String? get id;
  @override
  String get courseId;
  @override
  String get teacherId;
  @override
  DateTime get startTime;
  @override
  DateTime get endTime;
  @override
  SessionState get state;
  @override
  String? get currentToken;
  @override
  DateTime? get tokenExpiresAt;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of CourseSession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CourseSessionImplCopyWith<_$CourseSessionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
