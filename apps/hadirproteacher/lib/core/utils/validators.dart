// Email validation
String? emailValidator(String? value) {
  final regex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
  if (value == null || value.isEmpty) {
    return 'Please enter your email';
  }
  if (!regex.hasMatch(value)) {
    return 'Please enter a valid email';
  }
  return null;
}

// Password validation
String? passwordValidator(String? value) {
  final regex = RegExp(r'^(?=.*\d).{8,}$');
  if (value == null || value.isEmpty) {
    return 'Please enter your password';
  }
  if (!regex.hasMatch(value)) {
    return 'Password must be at least 8 characters long and include at least one digit.';
  }
  return null;
}

// Full Name validation
String? fullNameValidator(String? value) {
  final regex = RegExp(r'^[a-zA-Z\s]{2,}$');
  if (value == null || value.isEmpty) {
    return 'Please enter your full name';
  }
  if (!regex.hasMatch(value)) {
    return 'Please enter a valid full name';
  }
  return null;
}
