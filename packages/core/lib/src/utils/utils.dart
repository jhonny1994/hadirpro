// Constants
const kEmailRegex = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
const kStudentIdRegex = r'^\d{8}$'; // 8-digit student ID

// Validators
bool isValidEmail(String email) {
  return RegExp(kEmailRegex).hasMatch(email);
}

bool isValidStudentId(String studentId) {
  return RegExp(kStudentIdRegex).hasMatch(studentId);
}

bool isValidPassword(String password) {
  return password.length >= 8;
}

// Date Formatters
String formatDate(DateTime date) {
  return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
}

String formatTime(DateTime time) {
  return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
}

// Navigation Routes
const String kLoginRoute = '/login';
const String kHomeRoute = '/home';
const String kClassesRoute = '/classes';
const String kAttendanceRoute = '/attendance';
const String kSettingsRoute = '/settings';
