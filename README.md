# HadirPro (حاضر برو) 🎓

A modern attendance management system built with Flutter, designed for educational institutions.

![Flutter Version](https://img.shields.io/badge/flutter-%3E%3D3.0.0-blue.svg)
![License](https://img.shields.io/badge/license-MIT-green.svg)

## 🌟 Features

### For Professors 👨‍🏫
- Create and manage classes
- Generate attendance QR codes
- Monitor real-time attendance
- Export attendance reports
- View class statistics

### For Students 👨‍🎓
- Join classes with unique codes
- Mark attendance via QR scan
- View attendance history
- Track attendance percentage
- Request attendance corrections

## 🚀 Getting Started

### Prerequisites
- Flutter SDK
- Dart SDK
- Android Studio / VS Code
- Git

### Installation

1. Clone the repository
```bash
git clone https://github.com/jhonny1994/hadirpro.git
cd hadirpro
```

2. Install dependencies
```bash
melos bootstrap
```

3. Run the app
```bash
# For professor app (desktop)
cd apps/hadirpro_professor
flutter run -d windows

# For student app (mobile)
cd apps/hadirpro_student
flutter run
```

## 📱 Screenshots

[Coming Soon]

## 🛠️ Built With

- **Frontend**: Flutter
- **State Management**: Riverpod
- **Backend**: Supabase
- **Navigation**: Go Router
- **Localization**: Flutter Intl
- **2FA**: QR Code Generation/Scanning

## 📦 Project Structure

```
hadirpro/
├── apps/
│   ├── hadirpro_professor/    # Desktop app
│   └── hadirpro_student/      # Mobile app
├── packages/
│   ├── core/                  # Shared logic
│   └── ui_kit/               # Shared UI components
└── melos.yaml
```

## 🌍 Localization

HadirPro supports:
- English (en)
- Arabic (ar)

## 🔒 Security Features

- Email/Password authentication
- Two-factor attendance verification
- Secure QR code generation
- Role-based access control

## 📋 Development Checklist

### Phase 1: Project Setup
- [ ] Initial Setup
  - [ ] Create project structure
  - [ ] Set up Flutter SDK
  - [ ] Configure Riverpod
  - [ ] Set up Go Router
  - [ ] Initialize Supabase
  - [ ] Configure Freezed

- [ ] Core Package Setup
  - [ ] Create User model
  - [ ] Create Class model
  - [ ] Create Attendance model
  - [ ] Set up Auth service
  - [ ] Set up Database service
  - [ ] Add utility functions

- [ ] UI Kit Setup
  - [ ] Create custom buttons
  - [ ] Create text fields
  - [ ] Add loading indicators
  - [ ] Create error displays
  - [ ] Set up theme system

### Phase 2: Core Features
- [ ] Authentication
  - [ ] Login screen
    - [ ] Email/password form
    - [ ] Validation
    - [ ] Error handling
    - [ ] Remember me
  - [ ] Registration screen
    - [ ] User type selection
    - [ ] Student ID validation
  - [ ] Profile management
    - [ ] View/edit profile
    - [ ] Change password

- [ ] Navigation & Settings
  - [ ] Route configuration
  - [ ] Navigation service
  - [ ] Language switching
  - [ ] Theme toggling
  - [ ] Notification preferences

### Phase 3: Professor App
- [ ] Class Management
  - [ ] Class creation form
  - [ ] Student management
  - [ ] Class dashboard
  - [ ] Basic statistics

- [ ] Attendance Features
  - [ ] 2FA code generation
  - [ ] QR code system
  - [ ] Real-time monitoring
  - [ ] Basic reporting
  - [ ] Export functionality

### Phase 4: Student App
- [ ] Student Features
  - [ ] Class view
  - [ ] QR code scanner
  - [ ] Manual code entry
  - [ ] Attendance history
  - [ ] Status tracking

- [ ] Student Experience
  - [ ] Dashboard
  - [ ] Quick actions
  - [ ] Notifications
  - [ ] Offline support
  - [ ] Profile settings

### Phase 5: Polish & Testing
- [ ] UI Polish
  - [ ] Animation refinement
  - [ ] Loading states
  - [ ] Error states
  - [ ] Edge cases

- [ ] Testing
  - [ ] Unit tests
    - [ ] Auth service
    - [ ] Models
    - [ ] Utils
  - [ ] Widget tests
    - [ ] Forms
    - [ ] Navigation
    - [ ] State management
  - [ ] Integration tests
    - [ ] Full login flow
    - [ ] Attendance flow
  - [ ] Manual testing
    - [ ] Arabic support
    - [ ] Cross-device testing

- [ ] Deployment Prep
  - [ ] Build optimization
  - [ ] Version check
  - [ ] Store assets
  - [ ] Documentation

### Post-Launch
- [ ] Monitor performance
- [ ] Track user engagement
- [ ] Collect feedback
- [ ] Plan updates
- [ ] Regular maintenance

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📝 License

This project is licensed under the MIT License.

## 👥 Authors

- Douadi mohamed abderraouf (jhonny1994)

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Supabase for the backend infrastructure
- All contributors who help improve the project

## 📞 Support

For support, email or create an issue in the repository.

---
Made with ❤️ for education