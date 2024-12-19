import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hadirpro/features/authentication/authentication.dart';
import 'package:hadirpro/features/shared/shared.dart';
import 'package:pinput/pinput.dart';

class VerificationScreen extends ConsumerWidget {
  const VerificationScreen({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final defaultPinTheme = PinTheme(
      width: (MediaQuery.of(context).size.width / 6) - 8,
      height: MediaQuery.of(context).size.width / 6,
      textStyle: Theme.of(context).textTheme.headlineSmall,
      decoration: BoxDecoration(
        border: Border.all(
          color:
              Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.25),
        ),
        borderRadius: BorderRadius.circular(8),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Theme.of(context).colorScheme.primary),
    );
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
                child: SvgPicture.asset('assets/svg/confirm.svg'),
              ),
              const Spacer(),
              Text(
                'Enter verification code',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              Pinput(
                length: 6,
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: focusedPinTheme,
              ),
              const Spacer(),
              FilledButton(
                onPressed: () =>
                    ref.read(authProvider.notifier).verifyOtp(email, 'value'),
                style: FilledButton.styleFrom(
                  elevation: 0,
                  minimumSize: const Size(double.infinity, 48),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                ),
                child: Text(S.of(context).next),
              ),
              const Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}
