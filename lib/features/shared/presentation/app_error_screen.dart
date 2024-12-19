import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hadirpro/features/authentication/authentication.dart';
import 'package:hadirpro/features/shared/localization/generated/l10n.dart';

class AppErrorScreen extends ConsumerWidget {
  const AppErrorScreen({
    super.key,
    required this.errorMessage,
  });
  final String errorMessage;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                child: SvgPicture.asset('assets/svg/error.svg'),
              ),
              const Spacer(),
              ErrorInfo(
                description: errorMessage,
                press: () => ref.read(authProvider.notifier).checkAuthStatus(),
              ),
              const Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}

class ErrorInfo extends StatelessWidget {
  const ErrorInfo({
    super.key,
    required this.description,
    this.button,
    this.btnText,
    required this.press,
  });

  final String description;
  final Widget? button;
  final String? btnText;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              description,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            button ??
                FilledButton(
                  onPressed: press,
                  style: FilledButton.styleFrom(
                    elevation: 0,
                    minimumSize: const Size(double.infinity, 48),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                  ),
                  child: Text(btnText ?? S.of(context).retry),
                ),
          ],
        ),
      ),
    );
  }
}
