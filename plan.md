# Attendance Management App Development Checklist

## Phase 1: Project Setup and Foundation

- [ ] Initialize project repository with **monorepo structure** (GitHub).
- [ ] Install necessary Flutter tools and dependencies for desktop and mobile.
- [ ] Set up feature-based modular directory structure.
- [ ] Create and configure **Supabase project**.
- [ ] Configure **Row-Level Security (RLS)** and Supabase database tables.
- [ ] Set up shared packages:
  - [ ] **Core Package**: Includes authentication, database, and routing logic.
  - [ ] **UI Components Package**: Includes dynamic theming, localization, and reusable widgets.

---

# Desktop App Checklist

## Phase 2: Authentication and Core Backend Integration

- [ ] Implement user authentication using **Core Package**.
  - [ ] Sign-up and login functionality.
  - [ ] Email verification for secure sign-ups.
- [ ] Create user profiles in Supabase (`profiles` table).
- [ ] Integrate **Core Package** into the desktop app.

## Phase 3: Desktop UI Setup

- [ ] Design initial UI wireframes and prototypes (e.g., Figma).
- [ ] Implement UI using **UI Components Package**.
  - [ ] Dynamic theming (light/dark mode).
  - [ ] Localization for Arabic, English, and French.
  - [ ] Reusable widgets for buttons, forms, and layouts.
- [ ] Build UI layouts:
  - [ ] Authentication screens.
  - [ ] Teacher dashboard (course management, attendance records).

## Phase 4: Core Features Implementation (Desktop)

- [ ] Implement course management features for teachers:
  - [ ] Create courses.
  - [ ] Add students by ID.
  - [ ] View courses and enrolled students.
- [ ] Implement attendance marking for teachers:
  - [ ] QR code generation (via Attendance Package).
  - [ ] OTP generation (via Attendance Package).
  - [ ] Manual attendance marking.

## Phase 5: State Management with Riverpod (Desktop)

- [ ] Set up **Riverpod** for state management.
  - [ ] Authentication state provider (via Core Package).
  - [ ] Courses state provider (via Core Package).
  - [ ] Attendance state provider (via Attendance Package).
- [ ] Implement `StateNotifier` for state handling and updates.
- [ ] Use **ConsumerWidget** or hooks for state-based UI rendering.

## Phase 6: Testing and Debugging (Desktop)

- [ ] Write **unit tests** for business logic.
- [ ] Perform **integration testing** (e.g., authentication, attendance tracking).
- [ ] Write **widget tests** for UI validation on desktop devices.

## Phase 7: Deployment (Desktop)

- [ ] Configure **GitHub Actions** for automated build and test workflows.
- [ ] Deploy desktop app to **GitHub Releases**.

---

# Mobile App Checklist

## Phase 2: Authentication and Core Backend Integration

- [ ] Implement user authentication using **Core Package**.
  - [ ] Sign-up and login functionality.
  - [ ] Email verification for secure sign-ups.
- [ ] Create user profiles in Supabase (`profiles` table).
- [ ] Integrate **Core Package** into the mobile app.

## Phase 3: Mobile UI Setup

- [ ] Design initial UI wireframes and prototypes (e.g., Figma).
- [ ] Implement UI using **UI Components Package**.
  - [ ] Dynamic theming (light/dark mode).
  - [ ] Localization for Arabic, English, and French.
  - [ ] Reusable widgets for buttons, forms, and layouts.
- [ ] Build UI layouts:
  - [ ] Authentication screens.
  - [ ] Student dashboard (course enrollment, attendance marking).

## Phase 4: Core Features Implementation (Mobile)

- [ ] Enable students to join courses by scanning QR codes or entering OTPs.
- [ ] Create **attendance history** screen for students.
- [ ] Implement profile management functionality.

## Phase 5: State Management with Riverpod (Mobile)

- [ ] Set up **Riverpod** for state management.
  - [ ] Authentication state provider (via Core Package).
  - [ ] Courses state provider (via Core Package).
  - [ ] Attendance state provider (via Attendance Package).
- [ ] Implement `StateNotifier` for state handling and updates.
- [ ] Use **ConsumerWidget** or hooks for state-based UI rendering.

## Phase 6: Testing and Debugging (Mobile)

- [ ] Write **unit tests** for business logic.
- [ ] Perform **integration testing** (e.g., authentication, attendance tracking).
- [ ] Write **widget tests** for UI validation on mobile devices.

## Phase 7: Deployment (Mobile)

- [ ] Configure **GitHub Actions** for automated build and test workflows.
- [ ] Deploy mobile app to **Google Play Store**.

---

## Phase 8: Post-Launch Enhancements (Shared)

- [ ] Set up monitoring and error tracking (e.g., Sentry).
- [ ] Plan for offline functionality using local storage and synchronization.
- [ ] Design advanced analytics (attendance trends, reports).

---

### Progress Tracking Notes

- Use this checklist to monitor development progress for each platform.
- Regularly update the status of each task and phase.
- Revisit completed tasks during testing and debugging to ensure quality.
