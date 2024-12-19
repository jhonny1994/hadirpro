import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hadirpro/features/shared/localization/generated/l10n.dart';

part 'onboarding_data_model.freezed.dart';

@freezed
class OnboardingData with _$OnboardingData {
  const factory OnboardingData({
    required String illustration,
    required String title,
    required String text,
  }) = _OnboardingData;
}

final onboardingDataList = [
  OnboardingData(
    illustration: 'assets/png/1.png',
    title: S.current.onboarding1Title,
    text: S.current.onboarding1Text,
  ),
  OnboardingData(
    illustration: 'assets/png/2.png',
    title: S.current.onboarding2Title,
    text: S.current.onboarding2Text,
  ),
  OnboardingData(
    illustration: 'assets/png/3.png',
    title: S.current.onboarding3Title,
    text: S.current.onboarding3Text,
  ),
  OnboardingData(
    illustration: 'assets/png/4.png',
    title: S.current.onboarding4Title,
    text: S.current.onboarding4Text,
  ),
];
