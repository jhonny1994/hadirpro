import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hadir_ui/hadir_ui.dart';
import 'package:hadirproteacher/base_screen.dart';
import 'package:hadirproteacher/core/colors.dart';
import 'package:hadirproteacher/core/constants.dart';
import 'package:hadirproteacher/features/onboarding/domain/onboarding_model.dart';

class OnboardingPageContent extends StatelessWidget {
  const OnboardingPageContent({
    super.key,
    required this.image,
    required this.title,
  });
  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppConstants.kLargeSpacing * 4,
        vertical: AppConstants.kLargeSpacing,
      ),
      child: Column(
        spacing: 24,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: MediaQuery.of(context).size.height * 0.2,
            backgroundColor: AppColors.cardLight,
            child: SvgPicture.asset(image),
          ),
          Expanded(
            child: Center(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: FluentTheme.of(context).typography.subtitle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  Future<void> _nextPage() async {
    if (_currentPage < OnboardingData.pages.length - 1) {
      await _pageController.nextPage(
        duration: const Duration(
          milliseconds: AppConstants.kDefaultAnimationDuration,
        ),
        curve: Curves.easeInOut,
      );
      setState(() => _currentPage++);
    } else {
      await ref.read(onboardingNotifierProvider.notifier).toggle();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: OnboardingData.pages.length,
              onPageChanged: (index) => setState(() => _currentPage = index),
              itemBuilder: (context, index) {
                final page = OnboardingData.pages[index];
                return OnboardingPageContent(
                  image: page.image,
                  title: page.title,
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: List.generate(
                    OnboardingData.pages.length,
                    (index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: GestureDetector(
                        onTap: () async => _pageController.animateToPage(
                          index,
                          duration: const Duration(
                            milliseconds:
                                AppConstants.kDefaultAnimationDuration,
                          ),
                          curve: Curves.easeInOut,
                        ),
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: AnimatedContainer(
                            duration: const Duration(
                              milliseconds:
                                  AppConstants.kShortAnimationDuration,
                            ),
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _currentPage == index
                                  ? AppColors.accentLight
                                  : AppColors.textLight,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                FilledButton(
                  onPressed: _nextPage,
                  child: Text(
                    _currentPage == OnboardingData.pages.length - 1
                        ? 'Get Started'
                        : 'Next',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
