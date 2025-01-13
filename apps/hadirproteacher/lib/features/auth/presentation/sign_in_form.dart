import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hadir_core/hadir_core.dart';
import 'package:hadirproteacher/core/utils/validators.dart';
import 'package:sizer/sizer.dart';

class SignInForm extends ConsumerStatefulWidget {
  const SignInForm({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignInFormState();
}

class _SignInFormState extends ConsumerState<SignInForm> {
  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  bool isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        child: Center(
          child: SizedBox(
            height: 600,
            width: 400,
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                spacing: 2.h,
                children: [
                  const Spacer(flex: 3),
                  Text(
                    'Sign In',
                    style: FluentTheme.of(context).typography.title!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(
                    'Sign in to your teacher account in HadirPro',
                    style: FluentTheme.of(context).typography.body,
                  ),
                  const Spacer(),
                  InfoLabel(
                    label: 'Email',
                    labelStyle:
                        FluentTheme.of(context).typography.body!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                    child: TextFormBox(
                      padding: EdgeInsets.all(2.h),
                      controller: emailController,
                      placeholder: 'Enter your email',
                      validator: (value) => emailValidator(value),
                    ),
                  ),
                  InfoLabel(
                    label: 'Password',
                    labelStyle:
                        FluentTheme.of(context).typography.body!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                    child: TextFormBox(
                      padding: EdgeInsets.all(2.h),
                      controller: passwordController,
                      placeholder: 'Enter your password',
                      obscureText: isPasswordVisible,
                      suffix: IconButton(
                        style: ButtonStyle(
                          iconSize: WidgetStatePropertyAll(2.5.h),
                        ),
                        icon: Icon(
                          isPasswordVisible
                              ? FluentIcons.red_eye
                              : FluentIcons.hide,
                        ),
                        iconButtonMode: IconButtonMode.large,
                        onPressed: () => setState(
                          () => isPasswordVisible = !isPasswordVisible,
                        ),
                      ),
                      validator: (value) => passwordValidator(value),
                    ),
                  ),
                  Center(
                    child: FilledButton(
                      child: const Text('Sign In'),
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          await ref.read(authNotifierProvider.notifier).signIn(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                        }
                      },
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
