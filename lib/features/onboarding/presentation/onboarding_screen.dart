import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hadirpro/features/onboarding/domain/onboarding_data_model.dart';
import 'package:hadirpro/features/onboarding/providers/onboarding_provider.dart';
import 'package:hadirpro/features/shared/localization/generated/l10n.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    super.key,
    this.isActive = false,
  });
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 12,
      width: 12,
      decoration: BoxDecoration(
        color: isActive
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.primary.withValues(alpha: 0.25),
        borderRadius: const BorderRadius.all(Radius.circular(16)),
      ),
    );
  }
}

class OnboardContent extends StatelessWidget {
  const OnboardContent({
    required this.illustration,
    required this.title,
    required this.text,
    super.key,
  });
  final String illustration;

  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: AspectRatio(
            aspectRatio: 1,
            child: Image.asset(
              illustration,
              fit: BoxFit.contain,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  late final PageController _pageController;
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final onboardingNotifier = ref.watch(onboardingProvider.notifier);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(flex: 2),
            Expanded(
              flex: 14,
              child: PageView.builder(
                controller: _pageController,
                itemCount: onboardingDataList.length,
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemBuilder: (context, index) => OnboardContent(
                  illustration: onboardingDataList[index].illustration,
                  title: onboardingDataList[index].title,
                  text: onboardingDataList[index].text,
                ),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                onboardingDataList.length,
                (index) => DotIndicator(isActive: index == currentPage),
              ),
            ),
            const Spacer(flex: 2),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: FilledButton(
                onPressed: () async {
                  if (currentPage != onboardingDataList.length - 1) {
                    await _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.ease,
                    );
                  } else {
                    await onboardingNotifier.completeOnboarding();
                  }
                },
                style: FilledButton.styleFrom(
                  minimumSize: const Size(double.infinity, 48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  currentPage != onboardingDataList.length - 1
                      ? S.of(context).next
                      : S.of(context).getStarted,
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: currentPage);
  }
}
