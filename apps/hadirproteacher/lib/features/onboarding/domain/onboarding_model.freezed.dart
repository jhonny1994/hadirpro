// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboarding_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OnboardingPageModel {
  String get title => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;

  /// Create a copy of OnboardingPageModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OnboardingPageModelCopyWith<OnboardingPageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnboardingPageModelCopyWith<$Res> {
  factory $OnboardingPageModelCopyWith(
          OnboardingPageModel value, $Res Function(OnboardingPageModel) then) =
      _$OnboardingPageModelCopyWithImpl<$Res, OnboardingPageModel>;
  @useResult
  $Res call({String title, String image});
}

/// @nodoc
class _$OnboardingPageModelCopyWithImpl<$Res, $Val extends OnboardingPageModel>
    implements $OnboardingPageModelCopyWith<$Res> {
  _$OnboardingPageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OnboardingPageModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? image = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OnboardingPageModelImplCopyWith<$Res>
    implements $OnboardingPageModelCopyWith<$Res> {
  factory _$$OnboardingPageModelImplCopyWith(_$OnboardingPageModelImpl value,
          $Res Function(_$OnboardingPageModelImpl) then) =
      __$$OnboardingPageModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String image});
}

/// @nodoc
class __$$OnboardingPageModelImplCopyWithImpl<$Res>
    extends _$OnboardingPageModelCopyWithImpl<$Res, _$OnboardingPageModelImpl>
    implements _$$OnboardingPageModelImplCopyWith<$Res> {
  __$$OnboardingPageModelImplCopyWithImpl(_$OnboardingPageModelImpl _value,
      $Res Function(_$OnboardingPageModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of OnboardingPageModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? image = null,
  }) {
    return _then(_$OnboardingPageModelImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OnboardingPageModelImpl implements _OnboardingPageModel {
  const _$OnboardingPageModelImpl({required this.title, required this.image});

  @override
  final String title;
  @override
  final String image;

  @override
  String toString() {
    return 'OnboardingPageModel(title: $title, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnboardingPageModelImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.image, image) || other.image == image));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, image);

  /// Create a copy of OnboardingPageModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OnboardingPageModelImplCopyWith<_$OnboardingPageModelImpl> get copyWith =>
      __$$OnboardingPageModelImplCopyWithImpl<_$OnboardingPageModelImpl>(
          this, _$identity);
}

abstract class _OnboardingPageModel implements OnboardingPageModel {
  const factory _OnboardingPageModel(
      {required final String title,
      required final String image}) = _$OnboardingPageModelImpl;

  @override
  String get title;
  @override
  String get image;

  /// Create a copy of OnboardingPageModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OnboardingPageModelImplCopyWith<_$OnboardingPageModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
