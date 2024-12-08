# HadirPro - DDD Architecture

## Domain Layer Structure

```
feature/
├── domain/
│   ├── entities/           # Core business objects
│   │   ├── user.dart
│   │   ├── class.dart
│   │   └── attendance.dart
│   ├── value_objects/      # Immutable value objects
│   │   ├── student_id.dart
│   │   ├── class_code.dart
│   │   └── verification_code.dart
│   ├── failures/           # Domain-specific failures
│   │   ├── attendance_failure.dart
│   │   └── auth_failure.dart
│   └── repositories/       # Abstract repository interfaces
│       ├── i_auth_repository.dart
│       └── i_attendance_repository.dart
├── application/
│   ├── providers/          # Riverpod providers
│   │   ├── auth_providers.dart
│   │   └── attendance_providers.dart
│   └── services/          # Application services
│       ├── attendance_service.dart
│       └── auth_service.dart
├── infrastructure/
│   ├── repositories/      # Concrete repository implementations
│   │   ├── auth_repository.dart
│   │   └── attendance_repository.dart
│   └── dtos/             # Data Transfer Objects
│       ├── user_dto.dart
│       └── attendance_dto.dart
└── presentation/
    ├── pages/            # UI Pages
    ├── widgets/          # Feature-specific widgets
    └── providers/        # UI-specific providers
```

## Feature Organization

### Core Features
1. **Authentication Feature**
```
auth/
├── domain/
│   ├── entities/
│   │   └── user.dart
│   ├── value_objects/
│   │   ├── email.dart
│   │   └── password.dart
│   └── repositories/
│       └── i_auth_repository.dart
└── application/
    └── providers/
        ├── auth_state.dart
        └── auth_notifier.dart
```

2. **Attendance Feature**
```
attendance/
├── domain/
│   ├── entities/
│   │   └── attendance_record.dart
│   ├── value_objects/
│   │   └── verification_code.dart
│   └── repositories/
│       └── i_attendance_repository.dart
└── application/
    └── providers/
        ├── attendance_state.dart
        └── attendance_notifier.dart
```

## Shared Kernel
```
core/
├── domain/
│   ├── value_objects/
│   │   ├── unique_id.dart
│   │   └── timestamp.dart
│   └── failures/
│       └── core_failures.dart
└── infrastructure/
    └── supabase/
        └── supabase_injectable_module.dart
```

## Best Practices Implementation

### 1. Value Objects
- Use Value Objects for validated data:
```dart
@freezed
class StudentId with _$StudentId {
  const factory StudentId(String value) = _StudentId;

  factory StudentId.fromString(String str) {
    // Validation logic
    return StudentId(str);
  }
}
```

### 2. Entity Guidelines
- Keep entities pure and behavior-rich:
```dart
@freezed
class AttendanceRecord with _$AttendanceRecord {
  const factory AttendanceRecord({
    required UniqueId id,
    required StudentId studentId,
    required VerificationCode code,
    required AttendanceStatus status,
    required Timestamp timestamp,
  }) = _AttendanceRecord;

  bool isValid() {
    return timestamp.isWithinWindow && code.isValid;
  }
}
```

### 3. Repository Pattern
```dart
abstract class IAttendanceRepository {
  Future<Either<AttendanceFailure, Unit>> markAttendance(
    AttendanceRecord record,
  );
  
  Future<Either<AttendanceFailure, List<AttendanceRecord>>> getAttendanceHistory(
    ClassId classId,
  );
}
```

### 4. State Management
```dart
@riverpod
class AttendanceNotifier extends _$AttendanceNotifier {
  final IAttendanceRepository _repository;

  Future<Either<AttendanceFailure, Unit>> markAttendance(
    AttendanceRecord record,
  ) async {
    state = const AsyncValue.loading();
    final result = await _repository.markAttendance(record);
    state = AsyncValue.data(result);
    return result;
  }
}
```

## Error Handling Strategy

### Domain Errors
```dart
@freezed
class AttendanceFailure with _$AttendanceFailure {
  const factory AttendanceFailure.serverError() = _ServerError;
  const factory AttendanceFailure.invalidCode() = _InvalidCode;
  const factory AttendanceFailure.sessionExpired() = _SessionExpired;
  const factory AttendanceFailure.locationRequired() = _LocationRequired;
}
```

### Error Propagation
```dart
Future<Either<AttendanceFailure, Unit>> markAttendance(
  AttendanceRecord record,
) async {
  try {
    final result = await _repository.markAttendance(record);
    return right(unit);
  } on ServerException {
    return left(const AttendanceFailure.serverError());
  } on InvalidCodeException {
    return left(const AttendanceFailure.invalidCode());
  }
}
```

## State Management Strategy

### Provider Organization
```dart
// Feature Providers
final attendanceProvider = StateNotifierProvider<AttendanceNotifier, AttendanceState>((ref) {
  return AttendanceNotifier(ref.watch(attendanceRepositoryProvider));
});

// Global Providers
final themeProvider = StateNotifierProvider<ThemeNotifier, ThemeState>((ref) {
  return ThemeNotifier();
});
```

### State Classes
```dart
@freezed
class AttendanceState with _$AttendanceState {
  const factory AttendanceState({
    required bool isLoading,
    required Option<AttendanceFailure> failureOption,
    required List<AttendanceRecord> records,
  }) = _AttendanceState;

  factory AttendanceState.initial() => AttendanceState(
        isLoading: false,
        failureOption: none(),
        records: [],
      );
}
```

## Testing Strategy

### Domain Layer Tests
```dart
void main() {
  group('AttendanceRecord', () {
    test('should be valid when within time window', () {
      final record = AttendanceRecord(
        timestamp: DateTime.now(),
        code: ValidCode('123456'),
      );
      expect(record.isValid(), true);
    });
  });
}
```

### Application Layer Tests
```dart
void main() {
  late AttendanceNotifier notifier;
  late MockAttendanceRepository repository;

  setUp(() {
    repository = MockAttendanceRepository();
    notifier = AttendanceNotifier(repository);
  });

  test('markAttendance success', () async {
    // Arrange
    when(repository.markAttendance(any))
        .thenAnswer((_) async => right(unit));

    // Act
    final result = await notifier.markAttendance(validRecord);

    // Assert
    expect(result.isRight(), true);
  });
}
```

## Dependency Injection

### Module Registration
```dart
final serviceLocator = GetIt.instance;

Future<void> initializeDependencies() async {
  // Core
  serviceLocator.registerLazySingleton<INetworkInfo>(
    () => NetworkInfoImpl(),
  );

  // Features
  serviceLocator.registerLazySingleton<IAttendanceRepository>(
    () => AttendanceRepository(
      networkInfo: serviceLocator(),
      remoteDataSource: serviceLocator(),
      localDataSource: serviceLocator(),
    ),
  );
}
```

### Usage in Features
```dart
@riverpod
AttendanceNotifier attendanceNotifier(AttendanceNotifierRef ref) {
  return AttendanceNotifier(
    serviceLocator<IAttendanceRepository>(),
  );
}
```

## Performance Optimization

### Caching Strategy
```dart
class AttendanceRepository implements IAttendanceRepository {
  final ILocalDataSource _localDataSource;
  final IRemoteDataSource _remoteDataSource;

  Future<Either<Failure, List<AttendanceRecord>>> getRecords() async {
    try {
      // Check cache first
      final localRecords = await _localDataSource.getRecords();
      if (localRecords.isNotEmpty) {
        return right(localRecords);
      }

      // Fetch from remote
      final remoteRecords = await _remoteDataSource.getRecords();
      await _localDataSource.cacheRecords(remoteRecords);
      return right(remoteRecords);
    } catch (e) {
      return left(CacheFailure());
    }
  }
}
```

### Offline Support
```dart
class OfflineFirstAttendanceRepository implements IAttendanceRepository {
  final Queue<AttendanceRecord> _pendingRecords = Queue();

  Future<void> syncPendingRecords() async {
    while (_pendingRecords.isNotEmpty) {
      final record = _pendingRecords.removeFirst();
      try {
        await _remoteDataSource.markAttendance(record);
      } catch (e) {
        _pendingRecords.addFirst(record);
        break;
      }
    }
  }
}
```

## Clean Architecture Guidelines

1. **Dependency Rule**: 
   - Domain layer has no dependencies
   - Application layer depends only on Domain
   - Infrastructure depends on Application and Domain
   - Presentation depends on Application

2. **Data Flow**:
   UI → Providers → Services → Repositories → External Data Sources

3. **Error Handling**:
   - Use Either<Failure, Success> for domain errors
   - Handle infrastructure errors at repository level
   - Present user-friendly errors at UI level

4. **Testing Strategy**:
   - Domain: Unit tests
   - Application: Integration tests
   - Infrastructure: Integration tests
   - Presentation: Widget tests
