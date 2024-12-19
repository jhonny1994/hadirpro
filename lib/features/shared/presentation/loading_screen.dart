import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          child: Column(
            children: [
              const Spacer(flex: 2),
              AspectRatio(
                aspectRatio: 1,
                child: SvgPicture.asset(
                  'assets/svg/loading.svg',
                ),
              ),
              const Spacer(),
              Text(
                'Loading...',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const CircularProgressIndicator.adaptive(),
              const Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}
