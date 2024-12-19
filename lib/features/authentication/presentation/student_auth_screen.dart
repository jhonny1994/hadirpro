import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hadirpro/features/authentication/authentication.dart';
import 'package:hadirpro/features/shared/shared.dart';

class StudentAuthScreen extends ConsumerStatefulWidget {
  const StudentAuthScreen({super.key});

  @override
  ConsumerState<StudentAuthScreen> createState() => _StudentAuthScreenState();
}

class _StudentAuthScreenState extends ConsumerState<StudentAuthScreen> {
  bool isSignUp = false;

  // Controllers for text fields
  final TextEditingController _emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _studentIdController = TextEditingController();

  @override
  void dispose() {
    // Dispose controllers to avoid memory leaks
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _studentIdController.dispose();
    super.dispose();
  }

  Future<void> _handleSignIn() async {
    if (_formKey.currentState!.validate()) {
      final authNotifier = ref.read(authProvider.notifier);
      await authNotifier.signIn(
        _emailController.text.trim(),
        _passwordController.text,
      );
    }
  }

  Future<void> _handleSignUp() async {
    if (_formKey.currentState!.validate()) {
      final authNotifier = ref.read(authProvider.notifier);
      await authNotifier.signUpStudent(
        _emailController.text.trim(),
        _passwordController.text,
        _nameController.text.trim(),
        int.parse(_studentIdController.text),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = ref.watch(themeProvider) == ThemeMode.dark;

    final authOutlineInputBorder = OutlineInputBorder(
      borderSide: BorderSide(
        color: Theme.of(context).colorScheme.onSurface.withAlpha(0x80),
      ),
      borderRadius: const BorderRadius.all(Radius.circular(8)),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(isSignUp ? S.of(context).signUp : S.of(context).signIn),
        actions: [
          IconButton(
            onPressed: () => ref.read(themeProvider.notifier).toggleTheme(),
            icon:
                Icon(!isDark ? Icons.nightlight_round : Icons.wb_sunny_rounded),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          child: Column(
            children: [
              const Spacer(flex: 2),
              Text(
                isSignUp
                    ? S.of(context).createAccount
                    : S.of(context).welcomeBack,
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const Spacer(flex: 2),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    if (isSignUp)
                      Column(
                        children: [
                          TextFormField(
                            controller: _nameController,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              hintText: S.of(context).enterYourFullName,
                              labelText: S.of(context).name,
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              suffixIcon: const Icon(Icons.person),
                              border: authOutlineInputBorder,
                              enabledBorder: authOutlineInputBorder,
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return S.of(context).nameIsRequired;
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16),
                          TextFormField(
                            controller: _studentIdController,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: S.of(context).enterYourStudentId,
                              labelText: S.of(context).studentId,
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              suffixIcon: const Icon(Icons.numbers),
                              border: authOutlineInputBorder,
                              enabledBorder: authOutlineInputBorder,
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return S.of(context).studentIdIsRequired;
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16),
                        ],
                      ),
                    TextFormField(
                      controller: _emailController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: S.of(context).enterYourEmail,
                        labelText: S.of(context).email,
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        suffixIcon: const Icon(Icons.mail),
                        border: authOutlineInputBorder,
                        enabledBorder: authOutlineInputBorder,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return S.of(context).emailIsRequired;
                        }
                        if (!value.contains('@')) {
                          return S.of(context).invalidEmail;
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        hintText: S.of(context).enterYourPassword,
                        labelText: S.of(context).password,
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        suffixIcon: const Icon(Icons.lock),
                        border: authOutlineInputBorder,
                        enabledBorder: authOutlineInputBorder,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return S.of(context).passwordIsRequired;
                        }

                        return null;
                      },
                    ),
                    const SizedBox(height: 32),
                    FilledButton(
                      onPressed: (isSignUp ? _handleSignUp : _handleSignIn),
                      style: FilledButton.styleFrom(
                        elevation: 0,
                        minimumSize: const Size(double.infinity, 48),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                      ),
                      child: Text(
                        isSignUp
                            ? S.of(context).createAccount
                            : S.of(context).signIn,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Or',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context)
                                .colorScheme
                                .onSurface
                                .withAlpha(0x80),
                          ),
                    ),
                    const SizedBox(height: 8),
                    FilledButton.tonal(
                      onPressed: () {
                        setState(() {
                          isSignUp = !isSignUp;
                        });
                      },
                      style: FilledButton.styleFrom(
                        elevation: 0,
                        minimumSize: const Size(double.infinity, 48),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                      ),
                      child: Text(
                        !isSignUp
                            ? S.of(context).createAccount
                            : S.of(context).signIn,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}
