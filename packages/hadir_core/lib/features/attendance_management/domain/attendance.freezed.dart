// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attendance.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CourseAttendance _$CourseAttendanceFromJson(Map<String, dynamic> json) {
  return _CourseAttendance.fromJson(json);
}

/// @nodoc
mixin _$CourseAttendance {
  String? get id => throw _privateConstructorUsedError;
  String get sessionId => throw _privateConstructorUsedError;
  String get studentId => throw _privateConstructorUsedError;
  bool get present => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this CourseAttendance to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CourseAttendance
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CourseAttendanceCopyWith<CourseAttendance> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourseAttendanceCopyWith<$Res> {
  factory $CourseAttendanceCopyWith(
          CourseAttendance value, $Res Function(CourseAttendance) then) =
      _$CourseAttendanceCopyWithImpl<$Res, CourseAttendance>;
  @useResult
  $Res call(
      {String? id,
      String sessionId,
      String studentId,
      bool present,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$CourseAttendanceCopyWithImpl<$Res, $Val extends CourseAttendance>
    implements $CourseAttendanceCopyWith<$Res> {
  _$CourseAttendanceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CourseAttendance
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? sessionId = null,
    Object? studentId = null,
    Object? present = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      sessionId: null == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
      studentId: null == studentId
          ? _value.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as String,
      present: null == present
          ? _value.present
          : present // ignore: cast_nullable_to_non_nullable
              as bool,
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
abstract class _$$CourseAttendanceImplCopyWith<$Res>
    implements $CourseAttendanceCopyWith<$Res> {
  factory _$$CourseAttendanceImplCopyWith(_$CourseAttendanceImpl value,
          $Res Function(_$CourseAttendanceImpl) then) =
      __$$CourseAttendanceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String sessionId,
      String studentId,
      bool present,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$$CourseAttendanceImplCopyWithImpl<$Res>
    extends _$CourseAttendanceCopyWithImpl<$Res, _$CourseAttendanceImpl>
    implements _$$CourseAttendanceImplCopyWith<$Res> {
  __$$CourseAttendanceImplCopyWithImpl(_$CourseAttendanceImpl _value,
      $Res Function(_$CourseAttendanceImpl) _then)
      : super(_value, _then);

  /// Create a copy of CourseAttendance
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? sessionId = null,
    Object? studentId = null,
    Object? present = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$CourseAttendanceImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      sessionId: null == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
      studentId: null == studentId
          ? _value.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as String,
      present: null == present
          ? _value.present
          : present // ignore: cast_nullable_to_non_nullable
              as bool,
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
class _$CourseAttendanceImpl implements _CourseAttendance {
  const _$CourseAttendanceImpl(
      {this.id,
      required this.sessionId,
      required this.studentId,
      this.present = true,
      this.createdAt,
      this.updatedAt});

  factory _$CourseAttendanceImpl.fromJson(Map<String, dynamic> json) =>
      _$$CourseAttendanceImplFromJson(json);

  @override
  final String? id;
  @override
  final String sessionId;
  @override
  final String studentId;
  @override
  @JsonKey()
  final bool present;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'CourseAttendance(id: $id, sessionId: $sessionId, studentId: $studentId, present: $present, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CourseAttendanceImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.studentId, studentId) ||
                other.studentId == studentId) &&
            (identical(other.present, present) || other.present == present) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, sessionId, studentId, present, createdAt, updatedAt);

  /// Create a copy of CourseAttendance
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CourseAttendanceImplCopyWith<_$CourseAttendanceImpl> get copyWith =>
      __$$CourseAttendanceImplCopyWithImpl<_$CourseAttendanceImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CourseAttendanceImplToJson(
      this,
    );
  }
}

abstract class _CourseAttendance implements CourseAttendance {
  const factory _CourseAttendance(
      {final String? id,
      required final String sessionId,
      required final String studentId,
      final bool present,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$CourseAttendanceImpl;

  factory _CourseAttendance.fromJson(Map<String, dynamic> json) =
      _$CourseAttendanceImpl.fromJson;

  @override
  String? get id;
  @override
  String get sessionId;
  @override
  String get studentId;
  @override
  bool get present;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of CourseAttendance
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CourseAttendanceImplCopyWith<_$CourseAttendanceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
