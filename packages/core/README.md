# Core Package - HadirPro

The core package provides the foundational services, models, and utilities for the HadirPro attendance management system. It handles authentication, class management, and attendance tracking functionalities.

## Features

### Authentication
- User sign-up and sign-in
- Password reset functionality
- Email verification
- Role-based access control (professors and students)

### Class Management
- Create, update, and delete classes
- Join and leave classes
- Student enrollment management
- Class statistics and metrics

### Attendance Tracking
- Mark individual and batch attendance
- Generate and verify attendance codes
- View attendance history
- Date-range based attendance queries
- Attendance statistics and reporting

## Getting Started

### Prerequisites
- Flutter SDK >=3.0.0
- Dart SDK >=3.0.0
- Supabase account and project

### Installation

Add this package to your app's `pubspec.yaml`:

```yaml
dependencies:
  core:
    path: ../packages/core
```

### Configuration

1. Initialize Supabase in your app:

```dart
void main() async {
  await Supabase.initialize(
    url: 'YOUR_SUPABASE_URL',
    anonKey: 'YOUR_SUPABASE_ANON_KEY',
  );
  runApp(const MyApp());
}
```

2. Set up providers in your app:

```dart
void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}
```

## Usage

### Authentication

```dart
// Sign up a new user
await ref.read(authServiceProvider.notifier).signUp(
      email: 'user@example.com',
      password: 'password123',
      isProfessor: true,
    );

// Sign in
await ref.read(authServiceProvider.notifier).signIn(
      email: 'user@example.com',
      password: 'password123',
    );
```

### Class Management

```dart
// Create a new class
await ref.read(classServiceProvider.notifier).createClass(
      name: 'Mathematics 101',
      description: 'Introduction to Mathematics',
    );

// Join a class
await ref.read(classServiceProvider.notifier).joinClass(
      classId: 'class_id',
      studentId: 'student_id',
    );
```

### Attendance

```dart
// Mark attendance
await ref.read(attendanceServiceProvider.notifier).markAttendance(
      classId: 'class_id',
      studentId: 'student_id',
    );

// Get attendance history
final attendance = await ref.read(attendanceServiceProvider.notifier)
    .getStudentAttendance('student_id');
```

## Architecture

The package follows a feature-first architecture with:
- Models: Data classes using Freezed for immutability
- Services: Business logic and API interactions
- Providers: State management using Riverpod
- Utils: Common utilities and helper functions

## Dependencies

- `flutter_riverpod`: ^2.6.1 - State management
- `freezed_annotation`: ^2.4.4 - Code generation for data classes
- `supabase_flutter`: ^2.8.1 - Backend services
- `json_annotation`: ^4.9.0 - JSON serialization

## Contributing

1. Ensure all tests pass: `flutter test`
2. Run the code generator: `flutter pub run build_runner build`
3. Follow the linting rules: `flutter analyze`

## License

This package is for internal use within the HadirPro project.
