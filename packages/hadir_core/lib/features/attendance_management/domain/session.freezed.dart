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
  @JsonKey(includeIfNull: false)
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'course_id')
  String get courseId => throw _privateConstructorUsedError;
  @JsonKey(name: 'teacher_id')
  String get teacherId => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_time')
  DateTime get startTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_time')
  DateTime get endTime => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false, name: 'courses')
  Course? get course => throw _privateConstructorUsedError;
  SessionState get state => throw _privateConstructorUsedError;
  @JsonKey(name: 'current_token')
  String? get currentToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'token_expires_at')
  DateTime? get tokenExpiresAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at', includeToJson: false)
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', includeToJson: false)
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
      {@JsonKey(includeIfNull: false) String? id,
      @JsonKey(name: 'course_id') String courseId,
      @JsonKey(name: 'teacher_id') String teacherId,
      @JsonKey(name: 'start_time') DateTime startTime,
      @JsonKey(name: 'end_time') DateTime endTime,
      @JsonKey(includeIfNull: false, name: 'courses') Course? course,
      SessionState state,
      @JsonKey(name: 'current_token') String? currentToken,
      @JsonKey(name: 'token_expires_at') DateTime? tokenExpiresAt,
      @JsonKey(name: 'created_at', includeToJson: false) DateTime? createdAt,
      @JsonKey(name: 'updated_at', includeToJson: false) DateTime? updatedAt});

  $CourseCopyWith<$Res>? get course;
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
    Object? course = freezed,
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
      course: freezed == course
          ? _value.course
          : course // ignore: cast_nullable_to_non_nullable
              as Course?,
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

  /// Create a copy of CourseSession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CourseCopyWith<$Res>? get course {
    if (_value.course == null) {
      return null;
    }

    return $CourseCopyWith<$Res>(_value.course!, (value) {
      return _then(_value.copyWith(course: value) as $Val);
    });
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
      {@JsonKey(includeIfNull: false) String? id,
      @JsonKey(name: 'course_id') String courseId,
      @JsonKey(name: 'teacher_id') String teacherId,
      @JsonKey(name: 'start_time') DateTime startTime,
      @JsonKey(name: 'end_time') DateTime endTime,
      @JsonKey(includeIfNull: false, name: 'courses') Course? course,
      SessionState state,
      @JsonKey(name: 'current_token') String? currentToken,
      @JsonKey(name: 'token_expires_at') DateTime? tokenExpiresAt,
      @JsonKey(name: 'created_at', includeToJson: false) DateTime? createdAt,
      @JsonKey(name: 'updated_at', includeToJson: false) DateTime? updatedAt});

  @override
  $CourseCopyWith<$Res>? get course;
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
    Object? course = freezed,
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
      course: freezed == course
          ? _value.course
          : course // ignore: cast_nullable_to_non_nullable
              as Course?,
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
      {@JsonKey(includeIfNull: false) this.id,
      @JsonKey(name: 'course_id') required this.courseId,
      @JsonKey(name: 'teacher_id') required this.teacherId,
      @JsonKey(name: 'start_time') required this.startTime,
      @JsonKey(name: 'end_time') required this.endTime,
      @JsonKey(includeIfNull: false, name: 'courses') this.course,
      this.state = SessionState.active,
      @JsonKey(name: 'current_token') this.currentToken,
      @JsonKey(name: 'token_expires_at') this.tokenExpiresAt,
      @JsonKey(name: 'created_at', includeToJson: false) this.createdAt,
      @JsonKey(name: 'updated_at', includeToJson: false) this.updatedAt});

  factory _$CourseSessionImpl.fromJson(Map<String, dynamic> json) =>
      _$$CourseSessionImplFromJson(json);

  @override
  @JsonKey(includeIfNull: false)
  final String? id;
  @override
  @JsonKey(name: 'course_id')
  final String courseId;
  @override
  @JsonKey(name: 'teacher_id')
  final String teacherId;
  @override
  @JsonKey(name: 'start_time')
  final DateTime startTime;
  @override
  @JsonKey(name: 'end_time')
  final DateTime endTime;
  @override
  @JsonKey(includeIfNull: false, name: 'courses')
  final Course? course;
  @override
  @JsonKey()
  final SessionState state;
  @override
  @JsonKey(name: 'current_token')
  final String? currentToken;
  @override
  @JsonKey(name: 'token_expires_at')
  final DateTime? tokenExpiresAt;
  @override
  @JsonKey(name: 'created_at', includeToJson: false)
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at', includeToJson: false)
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'CourseSession(id: $id, courseId: $courseId, teacherId: $teacherId, startTime: $startTime, endTime: $endTime, course: $course, state: $state, currentToken: $currentToken, tokenExpiresAt: $tokenExpiresAt, createdAt: $createdAt, updatedAt: $updatedAt)';
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
            (identical(other.course, course) || other.course == course) &&
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
      course,
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
      {@JsonKey(includeIfNull: false) final String? id,
      @JsonKey(name: 'course_id') required final String courseId,
      @JsonKey(name: 'teacher_id') required final String teacherId,
      @JsonKey(name: 'start_time') required final DateTime startTime,
      @JsonKey(name: 'end_time') required final DateTime endTime,
      @JsonKey(includeIfNull: false, name: 'courses') final Course? course,
      final SessionState state,
      @JsonKey(name: 'current_token') final String? currentToken,
      @JsonKey(name: 'token_expires_at') final DateTime? tokenExpiresAt,
      @JsonKey(name: 'created_at', includeToJson: false)
      final DateTime? createdAt,
      @JsonKey(name: 'updated_at', includeToJson: false)
      final DateTime? updatedAt}) = _$CourseSessionImpl;

  factory _CourseSession.fromJson(Map<String, dynamic> json) =
      _$CourseSessionImpl.fromJson;

  @override
  @JsonKey(includeIfNull: false)
  String? get id;
  @override
  @JsonKey(name: 'course_id')
  String get courseId;
  @override
  @JsonKey(name: 'teacher_id')
  String get teacherId;
  @override
  @JsonKey(name: 'start_time')
  DateTime get startTime;
  @override
  @JsonKey(name: 'end_time')
  DateTime get endTime;
  @override
  @JsonKey(includeIfNull: false, name: 'courses')
  Course? get course;
  @override
  SessionState get state;
  @override
  @JsonKey(name: 'current_token')
  String? get currentToken;
  @override
  @JsonKey(name: 'token_expires_at')
  DateTime? get tokenExpiresAt;
  @override
  @JsonKey(name: 'created_at', includeToJson: false)
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at', includeToJson: false)
  DateTime? get updatedAt;

  /// Create a copy of CourseSession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CourseSessionImplCopyWith<_$CourseSessionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
