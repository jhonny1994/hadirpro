import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hadir_core/hadir_core.dart';
import 'package:hadirproteacher/core/utils/validators.dart';
import 'package:sizer/sizer.dart';

class SignUpForm extends ConsumerStatefulWidget {
  const SignUpForm({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpFormState();
}

class _SignUpFormState extends ConsumerState<SignUpForm> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final fullNameController = TextEditingController();
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
                  Center(
                    child: Column(
                      spacing: 1.h,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Sign Up',
                          style: FluentTheme.of(context)
                              .typography
                              .title!
                              .copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        Text(
                          'Create an account to join HadirPro as a teacher',
                          style: FluentTheme.of(context).typography.body,
                        ),
                      ],
                    ),
                  ),
                  InfoLabel(
                    label: 'Full Name',
                    labelStyle:
                        FluentTheme.of(context).typography.body!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                    child: TextFormBox(
                      padding: EdgeInsets.all(2.h),
                      controller: fullNameController,
                      placeholder: 'Enter your full name',
                      validator: (value) => fullNameValidator(value),
                    ),
                  ),
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
                      obscureText: true,
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
                      child: const Text('Sign Up'),
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          await ref.read(authNotifierProvider.notifier).signUp(
                                fullName: fullNameController.text,
                                email: emailController.text,
                                password: passwordController.text,
                                role: Role.teacher,
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
