import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hadirproteacher/hadir_pro_teacher.dart';
import 'package:sizer/sizer.dart';

class AuthScreen extends ConsumerStatefulWidget {
  const AuthScreen({super.key, this.message, required this.isSuccess});

  final String? message;
  final bool isSuccess;

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
              title: widget.isSuccess
                  ? const Text('Success')
                  : const Text('Failed'),
              content: Text(widget.message!),
              action: IconButton(
                icon: const Icon(FluentIcons.clear),
                onPressed: close,
              ),
              severity: widget.isSuccess
                  ? InfoBarSeverity.success
                  : InfoBarSeverity.error,
            );
          },
        );
      });
    }
    return Padding(
      padding: EdgeInsets.all(1.w),
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
