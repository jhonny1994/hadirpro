// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboarding_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OnboardingData {
  String get illustration => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;

  /// Create a copy of OnboardingData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OnboardingDataCopyWith<OnboardingData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnboardingDataCopyWith<$Res> {
  factory $OnboardingDataCopyWith(
          OnboardingData value, $Res Function(OnboardingData) then) =
      _$OnboardingDataCopyWithImpl<$Res, OnboardingData>;
  @useResult
  $Res call({String illustration, String title, String text});
}

/// @nodoc
class _$OnboardingDataCopyWithImpl<$Res, $Val extends OnboardingData>
    implements $OnboardingDataCopyWith<$Res> {
  _$OnboardingDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OnboardingData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? illustration = null,
    Object? title = null,
    Object? text = null,
  }) {
    return _then(_value.copyWith(
      illustration: null == illustration
          ? _value.illustration
          : illustration // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OnboardingDataImplCopyWith<$Res>
    implements $OnboardingDataCopyWith<$Res> {
  factory _$$OnboardingDataImplCopyWith(_$OnboardingDataImpl value,
          $Res Function(_$OnboardingDataImpl) then) =
      __$$OnboardingDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String illustration, String title, String text});
}

/// @nodoc
class __$$OnboardingDataImplCopyWithImpl<$Res>
    extends _$OnboardingDataCopyWithImpl<$Res, _$OnboardingDataImpl>
    implements _$$OnboardingDataImplCopyWith<$Res> {
  __$$OnboardingDataImplCopyWithImpl(
      _$OnboardingDataImpl _value, $Res Function(_$OnboardingDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of OnboardingData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? illustration = null,
    Object? title = null,
    Object? text = null,
  }) {
    return _then(_$OnboardingDataImpl(
      illustration: null == illustration
          ? _value.illustration
          : illustration // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OnboardingDataImpl implements _OnboardingData {
  const _$OnboardingDataImpl(
      {required this.illustration, required this.title, required this.text});

  @override
  final String illustration;
  @override
  final String title;
  @override
  final String text;

  @override
  String toString() {
    return 'OnboardingData(illustration: $illustration, title: $title, text: $text)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnboardingDataImpl &&
            (identical(other.illustration, illustration) ||
                other.illustration == illustration) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.text, text) || other.text == text));
  }

  @override
  int get hashCode => Object.hash(runtimeType, illustration, title, text);

  /// Create a copy of OnboardingData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OnboardingDataImplCopyWith<_$OnboardingDataImpl> get copyWith =>
      __$$OnboardingDataImplCopyWithImpl<_$OnboardingDataImpl>(
          this, _$identity);
}

abstract class _OnboardingData implements OnboardingData {
  const factory _OnboardingData(
      {required final String illustration,
      required final String title,
      required final String text}) = _$OnboardingDataImpl;

  @override
  String get illustration;
  @override
  String get title;
  @override
  String get text;

  /// Create a copy of OnboardingData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OnboardingDataImplCopyWith<_$OnboardingDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}