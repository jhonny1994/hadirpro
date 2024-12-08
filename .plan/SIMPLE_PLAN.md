# HadirPro - Simplified Implementation Plan

## Project Overview
HadirPro (حاضر برو) is an attendance management system with:
- Desktop app for professors
- Mobile app for students
- 2FA-based attendance marking
- Simple, elegant UI
- Arabic language support

## Project Structure
```
hadirpro/
├── apps/
│   ├── hadirpro_professor/     # Desktop app
│   └── hadirpro_student/       # Mobile app
├── packages/
│   ├── core/                   # Shared logic
│   │   ├── models/            # Data models
│   │   ├── services/          # Business logic
│   │   └── utils/             # Helpers
│   └── ui_kit/                # Shared UI components
└── melos.yaml
```

## Core Features

### Authentication
- Professor login/register
- Student login/register with ID
- Simple profile management
- Password reset

### Class Management
- Create/edit classes
- Add/remove students
- View class list
- Basic class statistics

### Attendance
- Generate 2FA code
- Scan/enter code
- View attendance history
- Basic reports

### Settings
- Light/dark theme
- Arabic/English language
- Basic notifications

## UI Components

### Shared Components
- Buttons (Primary, Secondary)
- Input fields
- Cards
- Loading spinners
- Error messages
- Success messages

### Professor Desktop Screens
1. Login/Register
2. Dashboard
3. Class Management
4. Attendance Monitor
5. Reports
6. Settings

### Student Mobile Screens
1. Login/Register
2. Home
3. Class List
4. Check-in
5. History
6. Settings

## Data Models

### User
```dart
@freezed
class User with _$User {
  const factory User({
    required String id,
    required String name,
    required String email,
    String? studentId,
    required bool isProfessor,
  }) = _User;
}
```

### Class
```dart
@freezed
class Class with _$Class {
  const factory Class({
    required String id,
    required String name,
    required String professorId,
    required List<String> studentIds,
  }) = _Class;
}
```

### Attendance
```dart
@freezed
class Attendance with _$Attendance {
  const factory Attendance({
    required String id,
    required String classId,
    required String studentId,
    required DateTime date,
    required bool present,
  }) = _Attendance;
}
```

## State Management (Riverpod)

### Simple Providers
```dart
// Auth State
final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier();
});

// Theme
final themeProvider = StateProvider<ThemeMode>((ref) {
  return ThemeMode.system;
});

// Current Class
final currentClassProvider = StateProvider<Class?>((ref) {
  return null;
});
```

## Detailed Implementation Steps

### Phase 1: Project Setup (Week 1)

#### Day 1-2: Initial Setup
1. Create project structure:
   ```
   hadirpro/
   ├── apps/
   │   ├── hadirpro_professor/
   │   └── hadirpro_student/
   ├── packages/
   │   ├── core/
   │   └── ui_kit/
   └── melos.yaml
   ```

2. Set up dependencies:
   - Flutter SDK
   - Riverpod for state management
   - Go Router for navigation
   - Supabase for backend
   - Freezed for models
   - Flutter Localizations

3. Configure Melos workspace:
   - Add workspace dependencies
   - Set up build commands
   - Configure package relationships

#### Day 3-4: Core Package Setup
1. Create basic models:
   - User model
   - Class model
   - Attendance model
   - Settings model

2. Set up services:
   - Auth service
   - Database service
   - Storage service
   - Settings service

3. Add utilities:
   - Date formatters
   - Input validators
   - String extensions
   - Error handlers

#### Day 5: UI Kit Setup
1. Create base components:
   - Custom buttons
   - Text fields
   - Loading indicators
   - Error displays
   - Dialog boxes

2. Set up themes:
   - Color schemes
   - Text styles
   - Common dimensions
   - Light/dark themes

### Phase 2: Core Features (Week 2-3)

#### Week 2: Authentication
1. Day 1-2: Login Screen
   - Email/password form
   - Validation
   - Error handling
   - Loading states
   - Remember me feature

2. Day 3-4: Registration Screen
   - User type selection
   - Registration form
   - Student ID validation
   - Success/error states

3. Day 5: Profile Management
   - View profile
   - Edit basic info
   - Change password
   - Logout functionality

#### Week 3: Navigation & Base Features
1. Day 1-2: Navigation Setup
   - Route configuration
   - Navigation service
   - Deep linking
   - Screen transitions

2. Day 3-5: Settings Implementation
   - Language switching
   - Theme toggling
   - Notification preferences
   - App information

### Phase 3: Professor App (Week 4-5)

#### Week 4: Class Management
1. Day 1-2: Class Creation
   - Create class form
   - Class code generation
   - Basic class settings
   - Success/error handling

2. Day 3-4: Student Management
   - Add students manually
   - Import student list
   - Remove students
   - Student list view

3. Day 5: Class Dashboard
   - Class overview
   - Quick actions
   - Basic statistics

#### Week 5: Attendance Features
1. Day 1-2: Attendance Creation
   - Generate 2FA codes
   - Set time limits
   - QR code generation
   - Manual code entry

2. Day 3-4: Attendance Monitoring
   - Real-time updates
   - Student status view
   - Manual corrections
   - Attendance summary

3. Day 5: Basic Reports
   - Daily view
   - Weekly summary
   - Export options
   - Print functionality

### Phase 4: Student App (Week 6-7)

#### Week 6: Student Features
1. Day 1-2: Class View
   - Join class
   - View schedule
   - Class details
   - Quick attendance status

2. Day 3-4: Attendance Marking
   - QR code scanner
   - Manual code entry
   - Confirmation screen
   - Error handling

3. Day 5: History View
   - Attendance calendar
   - Monthly summary
   - Absence tracking
   - Status indicators

#### Week 7: Student Experience
1. Day 1-2: Dashboard
   - Today's classes
   - Quick actions
   - Notifications
   - Status overview

2. Day 3-4: Profile & Settings
   - Student ID management
   - Personal settings
   - App preferences
   - Help section

3. Day 5: Offline Support
   - Local storage
   - Sync mechanism
   - Offline indicators
   - Error recovery

### Phase 5: Polish & Testing (Week 8)

#### Week 8: Finalization
1. Day 1-2: UI Polish
   - Animation refinement
   - Loading states
   - Error states
   - Edge cases

2. Day 3-4: Testing
   - User flow testing
   - Performance testing
   - Arabic text testing
   - Cross-device testing

3. Day 5: Deployment Prep
   - Build optimization
   - Version check
   - Final testing
   - Store preparation

## Testing Strategy

### Unit Tests
- Auth service tests
- Model validation tests
- Utility function tests
- State management tests

### Widget Tests
- Form validation
- UI component behavior
- Navigation flow
- Error handling

### Integration Tests
- Full login flow
- Class creation flow
- Attendance marking flow
- Settings changes

### Manual Testing Checklist
1. Authentication
   - [ ] Login with valid credentials
   - [ ] Login with invalid credentials
   - [ ] Registration flow
   - [ ] Password reset

2. Class Management
   - [ ] Create new class
   - [ ] Add students
   - [ ] Remove students
   - [ ] View class details

3. Attendance
   - [ ] Generate attendance code
   - [ ] Mark attendance
   - [ ] View history
   - [ ] Export reports

4. Settings
   - [ ] Change language
   - [ ] Switch theme
   - [ ] Update notifications
   - [ ] Profile updates

## Deployment Steps

### 1. Pre-deployment
- Run all tests
- Check performance metrics
- Verify Arabic support
- Test offline functionality

### 2. Build Process
- Update version numbers
- Generate release builds
- Sign applications
- Prepare store assets

### 3. Deployment
- Submit to stores
- Monitor initial feedback
- Track crash reports
- Gather user feedback

### 4. Post-deployment
- Monitor performance
- Track user engagement
- Collect feedback
- Plan updates

## Maintenance Plan

### Regular Updates
- Weekly bug fixes
- Monthly feature updates
- Quarterly security reviews
- Version compatibility checks

### Monitoring
- User feedback tracking
- Performance metrics
- Error reporting
- Usage statistics

This expanded plan provides a clear, day-by-day breakdown of implementation tasks while keeping the technical complexity at a manageable level for mid-level developers.
