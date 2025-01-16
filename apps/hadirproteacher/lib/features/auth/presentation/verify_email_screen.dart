import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' as mt;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hadir_core/hadir_core.dart';
import 'package:hadirproteacher/hadir_pro_teacher.dart';
import 'package:pinput/pinput.dart';
import 'package:sizer/sizer.dart';

class VerifyEmailScreen extends ConsumerWidget {
  const VerifyEmailScreen({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final defaultPinTheme = PinTheme(
      width: 10.w,
      height: 10.h,
      textStyle: FluentTheme.of(context).typography.subtitle!.copyWith(
            fontWeight: FontWeight.bold,
          ),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.accentLight),
        borderRadius: BorderRadius.circular(16),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: AppColors.accentDark),
    );

    return Padding(
      padding: EdgeInsets.all(1.w),
      child: mt.Material(
        child: Card(
          child: Center(
            child: SizedBox(
              height: 600,
              width: 400,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                spacing: 2.h,
                children: [
                  const Spacer(flex: 3),
                  Text(
                    'Verify Email',
                    style: FluentTheme.of(context).typography.title!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(
                    'Verify your teacher account in HadirPro',
                    style: FluentTheme.of(context).typography.body,
                  ),
                  const Spacer(),
                  InfoLabel(
                    label: 'Enter the code sent to $email',
                    labelStyle:
                        FluentTheme.of(context).typography.body!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                    child: Pinput(
                      defaultPinTheme: defaultPinTheme,
                      focusedPinTheme: focusedPinTheme,
                      length: 6,
                      onCompleted: (value) => ref
                          .read(authNotifierProvider.notifier)
                          .verifyEmail(email: email, otp: value),
                    ),
                  ),
                  const Spacer(flex: 3),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
