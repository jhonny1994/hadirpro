import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboarding_model.freezed.dart';

@freezed
class OnboardingPageModel with _$OnboardingPageModel {
  const factory OnboardingPageModel({
    required String title,
    required String image,
  }) = _OnboardingPageModel;
}

class OnboardingData {
  static final List<OnboardingPageModel> pages = [
    const OnboardingPageModel(
      image: 'assets/svgs/welcome.svg',
      title:
          'Welcome to HadirPro Teacher! Simplify attendance tracking and course management with our easy-to-use tools.',
    ),
    const OnboardingPageModel(
      image: 'assets/svgs/qr_code.svg',
      title:
          'Track attendance effortlessly with dynamic QR codes that refresh every 10 seconds for security.',
    ),
    const OnboardingPageModel(
      image: 'assets/svgs/course_management.svg',
      title:
          'Create and manage courses, add students, and view attendance records in one place.',
    ),
    const OnboardingPageModel(
      image: 'assets/svgs/get_started.svg',
      title:
          "You're all set! Start managing your courses and attendance with ease.",
    ),
  ];
}
