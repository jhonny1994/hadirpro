import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hadir_ui/hadir_ui.dart';
import 'package:hadirproteacher/core/presentation/base_screen.dart';
import 'package:hadirproteacher/core/utils/colors.dart';
import 'package:hadirproteacher/core/utils/constants.dart';
import 'package:hadirproteacher/features/onboarding/domain/onboarding_model.dart';
import 'package:sizer/sizer.dart';

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
      padding: EdgeInsets.symmetric(
        horizontal: 25.w,
        vertical: 5.h,
      ),
      child: Column(
        spacing: 5.h,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            flex: 2,
            child: CircleAvatar(
              radius: 25.h,
              backgroundColor: AppColors.cardLight,
              child: SvgPicture.asset(
                image,
                width: 25.h,
                height: 25.h,
              ),
            ),
          ),
          Flexible(
            child: Center(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: FluentTheme.of(context).typography.subtitle?.copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
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
  Key _pageViewKey = UniqueKey();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    MediaQuery.of(context).size;
  }

  @override
  void didUpdateWidget(covariant OnboardingScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    _pageViewKey = UniqueKey();
  }

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
              key: _pageViewKey,
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
            padding: EdgeInsets.all(2.5.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: List.generate(
                    OnboardingData.pages.length,
                    (index) => Padding(
                      padding: EdgeInsets.symmetric(horizontal: 0.5.w),
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
                            width: 2.5.h,
                            height: 2.5.h,
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
                  style: ButtonStyle(
                    textStyle: WidgetStatePropertyAll(
                      FluentTheme.of(context).typography.body?.copyWith(
                            fontSize: 14.sp,
                          ),
                    ),
                  ),
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
