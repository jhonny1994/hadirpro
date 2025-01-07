// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'course_enrollment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CourseEnrollement _$CourseEnrollementFromJson(Map<String, dynamic> json) {
  return _CourseEnrollement.fromJson(json);
}

/// @nodoc
mixin _$CourseEnrollement {
  String? get id => throw _privateConstructorUsedError;
  String get courseId => throw _privateConstructorUsedError;
  String get studentId => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this CourseEnrollement to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CourseEnrollement
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CourseEnrollementCopyWith<CourseEnrollement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourseEnrollementCopyWith<$Res> {
  factory $CourseEnrollementCopyWith(
          CourseEnrollement value, $Res Function(CourseEnrollement) then) =
      _$CourseEnrollementCopyWithImpl<$Res, CourseEnrollement>;
  @useResult
  $Res call(
      {String? id,
      String courseId,
      String studentId,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$CourseEnrollementCopyWithImpl<$Res, $Val extends CourseEnrollement>
    implements $CourseEnrollementCopyWith<$Res> {
  _$CourseEnrollementCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CourseEnrollement
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? courseId = null,
    Object? studentId = null,
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
      studentId: null == studentId
          ? _value.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as String,
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
abstract class _$$CourseEnrollementImplCopyWith<$Res>
    implements $CourseEnrollementCopyWith<$Res> {
  factory _$$CourseEnrollementImplCopyWith(_$CourseEnrollementImpl value,
          $Res Function(_$CourseEnrollementImpl) then) =
      __$$CourseEnrollementImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String courseId,
      String studentId,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$$CourseEnrollementImplCopyWithImpl<$Res>
    extends _$CourseEnrollementCopyWithImpl<$Res, _$CourseEnrollementImpl>
    implements _$$CourseEnrollementImplCopyWith<$Res> {
  __$$CourseEnrollementImplCopyWithImpl(_$CourseEnrollementImpl _value,
      $Res Function(_$CourseEnrollementImpl) _then)
      : super(_value, _then);

  /// Create a copy of CourseEnrollement
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? courseId = null,
    Object? studentId = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$CourseEnrollementImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      courseId: null == courseId
          ? _value.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as String,
      studentId: null == studentId
          ? _value.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as String,
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
class _$CourseEnrollementImpl implements _CourseEnrollement {
  const _$CourseEnrollementImpl(
      {this.id,
      required this.courseId,
      required this.studentId,
      this.createdAt,
      this.updatedAt});

  factory _$CourseEnrollementImpl.fromJson(Map<String, dynamic> json) =>
      _$$CourseEnrollementImplFromJson(json);

  @override
  final String? id;
  @override
  final String courseId;
  @override
  final String studentId;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'CourseEnrollement(id: $id, courseId: $courseId, studentId: $studentId, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CourseEnrollementImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.courseId, courseId) ||
                other.courseId == courseId) &&
            (identical(other.studentId, studentId) ||
                other.studentId == studentId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, courseId, studentId, createdAt, updatedAt);

  /// Create a copy of CourseEnrollement
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CourseEnrollementImplCopyWith<_$CourseEnrollementImpl> get copyWith =>
      __$$CourseEnrollementImplCopyWithImpl<_$CourseEnrollementImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CourseEnrollementImplToJson(
      this,
    );
  }
}

abstract class _CourseEnrollement implements CourseEnrollement {
  const factory _CourseEnrollement(
      {final String? id,
      required final String courseId,
      required final String studentId,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$CourseEnrollementImpl;

  factory _CourseEnrollement.fromJson(Map<String, dynamic> json) =
      _$CourseEnrollementImpl.fromJson;

  @override
  String? get id;
  @override
  String get courseId;
  @override
  String get studentId;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of CourseEnrollement
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CourseEnrollementImplCopyWith<_$CourseEnrollementImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
