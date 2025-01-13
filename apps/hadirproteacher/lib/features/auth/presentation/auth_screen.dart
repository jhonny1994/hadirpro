import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hadirproteacher/core/presentation/base_screen.dart';
import 'package:hadirproteacher/features/auth/presentation/sign_in_form.dart';
import 'package:hadirproteacher/features/auth/presentation/sign_up_form.dart';
import 'package:sizer/sizer.dart';

class AuthScreen extends ConsumerStatefulWidget {
  const AuthScreen({super.key, this.message});

  final String? message;

  @override
  ConsumerState<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends ConsumerState<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    if (widget.message != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        displayInfoBar(
          context,
          builder: (context, close) {
            return InfoBar(
              title: const Text('Failed'),
              content: Text(widget.message!),
              action: IconButton(
                icon: const Icon(FluentIcons.clear),
                onPressed: close,
              ),
              severity: InfoBarSeverity.error,
            );
          },
        );
      });
    }
    return BaseScreen(
      child: Row(
        children: [
          const SignUpForm(),
          SizedBox(width: 1.w),
          const SignInForm(),
        ],
      ),
    );
  }
}
