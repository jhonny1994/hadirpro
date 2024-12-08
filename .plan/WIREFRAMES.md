# HadirPro Wireframes Documentation

## Design System (core_ui)

### Atoms

#### Colors
```
Primary: #1A73E8     // Professional blue
Secondary: #34A853   // Success green
Error: #EA4335      // Error red
Warning: #FBBC04    // Warning yellow
Background: #FFFFFF  // Pure white
Surface: #F8F9FA    // Light gray
Text Primary: #202124
Text Secondary: #5F6368
```

#### Typography
- Primary Font: Roboto (English)
- Arabic Font: Cairo
- Headings: Bold, size range 24-32
- Body: Regular, size range 14-16
- Captions: Light, size 12

#### Basic Components
- Buttons (Primary, Secondary, Text)
- Input Fields (Text, Password, Code)
- Icons
- Loading Spinners
- Error States
- Success States

### Molecules
- Forms
- Cards
- Dialogs
- Navigation Bars
- Tab Bars
- Lists

## Feature Screens

### Authentication Feature (features/authentication)

#### Professor Desktop
```
// Login Screen
┌────────────────────────────────┐
│        [App Logo/Name]         │
│                               │
│  ┌─────────────────────────┐  │
│  │    Email Address        │  │
│  └─────────────────────────┘  │
│                               │
│  ┌─────────────────────────┐  │
│  │    Password             │  │
│  └─────────────────────────┘  │
│                               │
│  [      Login Button       ]  │
│                               │
│  [Create Account] [Forgot?]   │
└────────────────────────────────┘

// Register Screen
┌────────────────────────────────┐
│        [App Logo/Name]         │
│                               │
│  ┌─────────────────────────┐  │
│  │    Full Name            │  │
│  └─────────────────────────┘  │
│  ┌─────────────────────────┐  │
│  │    Email Address        │  │
│  └─────────────────────────┘  │
│  ┌─────────────────────────┐  │
│  │    Password             │  │
│  └─────────────────────────┘  │
│  ┌─────────────────────────┐  │
│  │    Confirm Password     │  │
│  └─────────────────────────┘  │
│                               │
│  [    Register Button      ]  │
│                               │
│  [Already have an account?]   │
└────────────────────────────────┘
```

#### Student Mobile
```
// Login Screen
┌──────────────────┐
│    [App Logo]    │
│                  │
│  ┌──────────┐   │
│  │ Student ID│   │
│  └──────────┘   │
│                  │
│  ┌──────────┐   │
│  │ Password │   │
│  └──────────┘   │
│                  │
│  [Login Button]  │
│                  │
│  [Register Now]  │
└──────────────────┘

// Register Screen
┌──────────────────┐
│    [App Logo]    │
│                  │
│  ┌──────────┐   │
│  │ Full Name │   │
│  └──────────┘   │
│                  │
│  ┌──────────┐   │
│  │ Student ID│   │
│  └──────────┘   │
│                  │
│  ┌──────────┐   │
│  │ Password │   │
│  └──────────┘   │
│                  │
│  [Register Button]│
│                  │
│  [Already have an account?]│
└──────────────────┘
```

### Class Management Feature (features/class)

#### Professor Desktop
```
// Class List Screen
┌────────────────────────────────────────────┐
│ [Back] Class Management     [Create New]   │
├────────────────────────────────────────────┤
│ [Filter] [Sort] [Search]                   │
├────────────┬───────────────────────────────┤
│            │                               │
│ Filters    │     Class Grid               │
│            │  ┌────────────────────────┐  │
│ Status     │  │ Class Card             │  │
│ □ Active   │  │ - Name                 │  │
│ □ Archived │  │ - Student Count        │  │
│            │  │ - Last Activity        │  │
│ Term       │  └────────────────────────┘  │
│ □ Current  │                               │
│ □ Past     │                               │
│            │                               │
└────────────┴───────────────────────────────┘

// Create/Edit Class Screen
┌────────────────────────────────────────────┐
│ [Back] Create New Class        [Save]      │
├────────────────────────────────────────────┤
│                                           │
│  Class Details                            │
│  ┌─────────────────────────┐              │
│  │    Class Name           │              │
│  └─────────────────────────┘              │
│  ┌─────────────────────────┐              │
│  │    Subject              │              │
│  └─────────────────────────┘              │
│  ┌─────────────────────────┐              │
│  │    Description          │              │
│  └─────────────────────────┘              │
│                                           │
│  Schedule (Optional)                      │
│  ┌─────────────────────────┐              │
│  │    Days & Time          │              │
│  └─────────────────────────┘              │
│                                           │
│  Attendance Settings                      │
│  [ ] Allow Late Check-in                  │
│  [ ] Enable Location Verification         │
│                                           │
│  Late Check-in Window: [15 min ▼]         │
│                                           │
└────────────────────────────────────────────┘
```

#### Student Mobile
```
// Class List Screen
┌──────────────────┐
│   My Classes     │
│                  │
│ ┌────────────┐  │
│ │ Math 101   │  │
│ │ Prof. Ahmed│  │
│ │ 85% Present│  │
│ └────────────┘  │
│                  │
│ [Join Class +]   │
└──────────────────┘

// Join Class Screen
┌──────────────────┐
│   Join Class     │
│                  │
│  Enter Class Code│
│  ┌──────────┐   │
│  │ ABC123   │   │
│  └──────────┘   │
│                  │
│     - or -      │
│                  │
│  [Scan QR Code] │
│                  │
│  [Join Request] │
└──────────────────┘
```

### Attendance Feature (features/attendance)

#### Professor Desktop
```
// Attendance Monitor
┌────────────────────────────────────────────┐
│ [Back] Class Name              [Actions ▼] │
├────────────────────────────────────────────┤
│ [Generate 2FA Code] [Export] [Settings]    │
├────────────┬───────────────────────────────┤
│            │                               │
│ Student    │     Attendance Grid           │
│ List       │  ┌────────────────────────┐  │
│            │  │ ID | Name | Status     │  │
│ - Search   │  │ ---------------------- │  │
│ - Filter   │  │ □ Mohamed  Present     │  │
│ - Sort     │  │ □ Ahmed    Absent      │  │
│            │  │ □ Sara     Present     │  │
│            │  └────────────────────────┘  │
│            │                               │
└────────────┴───────────────────────────────┘

// Attendance History Screen
┌────────────────────────────────────────────┐
│ [Back] Attendance History     [Export ▼]   │
├────────────────────────────────────────────┤
│ Date Range: [Start ▼] to [End ▼]          │
├────────────┬───────────────────────────────┤
│            │                               │
│ Report     │     Attendance Overview       │
│ Types      │  ┌────────────────────────┐  │
│            │  │    Attendance Chart     │  │
│ □ Daily    │  │         [Graph]        │  │
│ □ Weekly   │  └────────────────────────┘  │
│ □ Monthly  │                               │
│            │     Detailed Statistics       │
│ Classes    │  ┌────────────────────────┐  │
│ □ Class A  │  │ Present: 85%           │  │
│ □ Class B  │  │ Absent:  15%           │  │
│            │  │ Late:    5%            │  │
│            │  └────────────────────────┘  │
└────────────┴───────────────────────────────┘
```

#### Student Mobile
```
// Check-in Screen
┌──────────────────┐
│   Check In       │
│                  │
│   [QR Scanner]   │
│                  │
│      - or -      │
│                  │
│  ┌──────────┐   │
│  │Enter Code│   │
│  └──────────┘   │
│                  │
│  [Submit Code]   │
└──────────────────┘

// History Screen
┌──────────────────┐
│    History       │
│                  │
│ Filter: [All ▼]  │
│                  │
│ December 2024    │
│ ┌────────────┐  │
│ │ S M T W T F S│  │
│ │ □ ■ ▢ ■ □ ■ □│  │
│ └────────────┘  │
│                  │
│ List View        │
│ 12/8 - Present   │
│ 12/7 - Absent    │
│ 12/6 - Present   │
│                  │
└──────────────────┘
```

### Reports Feature (features/reports) - Professor Only

```
// Reports Dashboard
┌────────────────────────────────────────────┐
│ [Back] Reports & Analytics    [Export ▼]   │
├────────────────────────────────────────────┤
│ Date Range: [Start ▼] to [End ▼]          │
├────────────┬───────────────────────────────┤
│            │                               │
│ Report     │     Attendance Overview       │
│ Types      │  ┌────────────────────────┐  │
│            │  │    Attendance Chart     │  │
│ □ Daily    │  │         [Graph]        │  │
│ □ Weekly   │  └────────────────────────┘  │
│ □ Monthly  │                               │
│            │     Detailed Statistics       │
│ Classes    │  ┌────────────────────────┐  │
│ □ Class A  │  │ Present: 85%           │  │
│ □ Class B  │  │ Absent:  15%           │  │
│            │  │ Late:    5%            │  │
│            │  └────────────────────────┘  │
└────────────┴───────────────────────────────┘

// Detailed Reports...
{{ ... rest of report screens ... }}
```

### Settings Feature (features/settings)

#### Shared Components
```
// Settings Screen Base
┌────────────────────┐
│    Settings        │
│                    │
│ Theme             │
│ ○ Light           │
│ ○ Dark            │
│ ○ System          │
│                    │
│ Language          │
│ [Arabic ▼]        │
│                    │
│ Notifications     │
│ [ ] Enabled       │
└────────────────────┘
```

#### Professor Desktop
```
// Settings Screen
┌────────────────────────────────────────────┐
│ [Back] Settings                           │
├────────────────────────────────────────────┤
│                                           │
│  Appearance                               │
│  ○ Light Mode                             │
│  ○ Dark Mode                              │
│  ○ System Default                         │
│                                           │
│  Language                                 │
│  [Arabic ▼]                               │
│                                           │
│  Notifications                            │
│  [ ] Email Notifications                  │
│  [ ] Desktop Notifications                │
│                                           │
│  Class Defaults                           │
│  [ ] Auto-approve Students                │
│  [ ] Allow Late Check-in                  │
│  Late Check-in Window: [15 min ▼]         │
│                                           │
│  Export Preferences                       │
│  [ ] Include Student Details              │
│  [ ] Include Analytics                    │
│  Default Format: [PDF ▼]                  │
│                                           │
└────────────────────────────────────────────┘
```

#### Student Mobile
```
// Settings Screen
┌────────────────────┐
│    Settings        │
│                    │
│ Theme             │
│ ○ Light           │
│ ○ Dark            │
│ ○ System          │
│                    │
│ Language          │
│ [Arabic ▼]        │
│                    │
│ Notifications     │
│ [ ] Class Start    │
│ [ ] Reminders      │
│                    │
│ [About App]        │
│ [Help & Support]   │
│ [Log Out]          │
└────────────────────┘
```

## Responsive Breakpoints
- Mobile: < 600px
- Tablet: 600px - 1024px
- Desktop: > 1024px

## Animation Guidelines
- Use subtle animations for state changes
- Keep transitions under 300ms
- Implement loading skeletons for data fetching
- Smooth page transitions
- Gentle feedback animations for user actions

## State & Error Handling

### Loading States
```
// Skeleton Loading
┌──────────────────┐
│ ▒▒▒▒▒▒▒▒▒▒▒▒    │
│ ▒▒▒▒ ▒▒▒▒▒      │
│ ▒▒▒▒▒▒▒▒        │
└──────────────────┘

// Spinner Loading
┌──────────────────┐
│     ↻            │
│   Loading...     │
└──────────────────┘

// Progress Loading
┌──────────────────┐
│ [===========   ] │
│      85%         │
└──────────────────┘
```

### Error States
```
// Network Error
┌──────────────────┐
│       📡         │
│  No Connection   │
│                  │
│ Please check your│
│ internet connect-│
│ ion and try again│
│                  │
│    [Retry]       │
└──────────────────┘

// Input Error
┌──────────────────┐
│ Student ID       │
│ ┌──────────┐    │
│ │1234      │    │
│ └──────────┘    │
│ ⚠️ Invalid ID    │
└──────────────────┘

// Server Error
┌──────────────────┐
│       ⚠️         │
│  Server Error    │
│                  │
│ Something went   │
│ wrong. Please try│
│ again later.     │
│                  │
│    [Retry]       │
└──────────────────┘
```

### Success States
```
// Action Success
┌──────────────────┐
│        ✓         │
│    Success!      │
│                  │
│ Attendance       │
│ marked           │
│ successfully     │
└──────────────────┘

// Upload Success
┌──────────────────┐
│        ✓         │
│   Uploaded!      │
│                  │
│ Your file has    │
│ been uploaded    │
│ successfully     │
└──────────────────┘
```

## Navigation Patterns

### Mobile Navigation
```
// Bottom Navigation
┌──────────────────┐
│    Content       │
│                  │
│                  │
│                  │
├──────────────────┤
│ 🏠  📋  ⚙️  👤   │
└──────────────────┘

// Drawer Navigation
┌─────┬────────────┐
│ 👤  │  Content   │
│ Home│            │
│ Class│           │
│ Stats│           │
│ Help│            │
│     │            │
└─────┴────────────┘
```

### Desktop Navigation
```
// Sidebar Navigation
┌────┬─────────────┐
│Logo│   Content   │
│Home│             │
│Class│            │
│Stats│            │
│Help│             │
│    │             │
└────┴─────────────┘

// Top Navigation
┌──────────────────┐
│Logo Home Class ⚙️│
├──────────────────┤
│    Content       │
│                  │
└──────────────────┘
```

## Animation Guidelines

### Transitions
- Page transitions: Slide or fade, 300ms
- Modal dialogs: Fade up, 200ms
- Loading spinners: Continuous rotation
- Success/Error: Bounce in, 400ms

### Micro-interactions
- Button press: Scale down 95%, 100ms
- Form validation: Shake effect, 300ms
- List items: Slide in, staggered 50ms
- Refresh: Pull to refresh with custom animation

### Feedback
- Success: Check mark animation
- Error: Warning symbol bounce
- Loading: Pulse effect
- Progress: Smooth progress bar

## Accessibility Features

### Visual
- High contrast mode
- Adjustable text size
- Color blind friendly palette
- Clear focus indicators

### Input
- Touch targets >= 48x48px
- Keyboard navigation
- Voice control support
- Gesture alternatives

### Screen Readers
- Meaningful labels
- Proper heading hierarchy
- Image descriptions
- Status announcements

## Responsive Design

### Breakpoints
- Mobile: < 600px
- Tablet: 600px - 1024px
- Desktop: > 1024px

### Layout Adjustments
- Stack on mobile
- Grid on tablet
- Full layout on desktop
- Flexible spacing

### Component Adaptations
- Simplified navigation on mobile
- Touch-friendly inputs
- Optimized tables
- Responsive images
