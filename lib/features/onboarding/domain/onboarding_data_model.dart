import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboarding_data_model.freezed.dart';

@freezed
class OnboardingData with _$OnboardingData {
  const factory OnboardingData({
    required String illustration,
    required String title,
    required String text,
  }) = _OnboardingData;
}
