# HadirPro Wireframes

## 1. Role Selection Screen

- **Elements:**
  - Welcome message
  - Role selection options
    - [ Teacher ]
    - [ Student ]

+---------------------------------+
|         Welcome to HadirPro     |
|                                 |
|   Please select your role:      |
|                                 |
|         [ Teacher ]             |
|                                 |
|         [ Student ]             |
|                                 |
+---------------------------------+

---

## 2. Login Screen (Teacher)

- **Elements:**
  - App logo
  - Username and password fields
  - Login button
  - Option for password recovery
  - Link to switch to student login

+---------------------------------+
|            HadirPro             |
|          [App Logo]             |
|                                 |
|   Username: [**************]    |
|                                 |
|   Password: [**************]    |
|                                 |
|         [ Login Button ]        |
|                                 |
|  [ Forgot Password? ]           |
|  [ Switch to Student Login ]    |
+---------------------------------+

---

## 3. Login Screen (Student)

- **Elements:**
  - App logo
  - Username and password fields
  - Login button
  - Option for password recovery
  - Link to switch to teacher login

+---------------------------------+
|            HadirPro             |
|          [App Logo]             |
|                                 |
|   Username: [**************]    |
|                                 |
|   Password: [**************]    |
|                                 |
|         [ Login Button ]        |
|                                 |
|  [ Forgot Password? ]           |
|  [ Switch to Teacher Login ]    |
+---------------------------------+

---

## 4. Teacher Dashboard

- **Elements:**
  - Welcome message
  - Navigation menu (Attendance, Students, Reports, Settings)
  - Quick access buttons for marking attendance and viewing attendance history
  - Notifications area (if needed)

+---------------------------------+
|         Welcome, Teacher!       |
|                                 |
|  [ Attendance ] [ Students ]    |
|  [ Reports ] [ Settings ]       |
|                                 |
|  [ Mark Attendance ]            |
|  [ View Attendance History ]    |
|                                 |
|  Notifications:                 |
|  - New student request          |
|  - Attendance marked            |
+---------------------------------+

---

## 5. Attendance Marking Screen

- **Elements:**
  - Class selection dropdown
  - List of students with checkboxes for marking attendance (Present/Absent)
  - QR code generation button for check-in
  - Submit button to save attendance

+---------------------------------+
|         Mark Attendance         |
|                                 |
|  Class: [ Dropdown ]            |
|                                 |
|  Students:                      |
|  [ ] Student 1                  |
|  [ ] Student 2                  |
|  [ ] Student 3                  |
|  [ ] Student 4                  |
|                                 |
|  [ Generate QR Code ]           |
|                                 |
|         [ Submit ]              |
+---------------------------------+

---

## 6. Student Management Screen

- **Elements:**
  - List of students with options to add, edit, or remove students
  - Search bar for filtering students
  - Button to approve or deny student requests to join classes

+---------------------------------+
|         Student Management      |
|                                 |
|  [ Add Student ]                |
|  [ Search: ____________ ]       |
|                                 |
|  Students List:                 |
|  [X] Student 1  [Edit] [Remove] |
|  [X] Student 2  [Edit] [Remove] |
|  [ ] Student 3  [Edit] [Remove] |
|                                 |
|  [ Approve Requests ]           |
+---------------------------------+

---

## 7. Attendance History Screen

- **Elements:**
  - Date picker for selecting attendance records
  - List of students with attendance status for the selected date

+---------------------------------+
|       Attendance History        |
|                                 |
|  Select Date: [ Date Picker ]   |
|                                 |
|  Attendance Records:            |
|  Student 1: Present             |
|  Student 2: Absent              |
|  Student 3: Present             |
|                                 |
|                                 |
+---------------------------------+

---

## 8. Onboarding Screens (for new users)

- **Elements:**
  - Series of screens guiding users through app features
  - Simple explanations and visuals for each feature
  - "Get Started" button to complete onboarding

+---------------------------------+
|         Onboarding Step 1       |
|                                 |
|  Welcome to HadirPro!           |
|  [ Next ]                       |
+---------------------------------+

+---------------------------------+
|         Onboarding Step 2       |
|                                 |
|  Here’s how to mark attendance. |
|  [ Next ]                       |
+---------------------------------+

+---------------------------------+
|         Onboarding Step 3       |
|                                 |
|  Let’s get started!             |
|  [ Get Started ]                |
+---------------------------------+

---

# User Flows

## Teacher User Flows

1. **Teacher Logging In:**
   - Teacher opens the app and sees the login screen.
   - Enters username and password.
   - Clicks the "Login" button.
   - If credentials are correct, the teacher is directed to the Teacher Dashboard.

2. **Marking Attendance:**
   - From the Teacher Dashboard, the teacher selects "Attendance."
   - Chooses a class from the dropdown menu.
   - Sees a list of students with checkboxes for marking attendance (Present/Absent).
   - Clicks the "Generate QR Code" button to create a QR code for student check-in.
   - After marking attendance, clicks the "Submit" button to save the attendance record.

3. **Managing Students:**
   - Navigates to the "Students" section from the dashboard.
   - Views the list of students and can:
     - Add a new student by entering details.
     - Edit existing student information.
     - Remove a student from the list.
     - Approve or deny student requests to join classes.

4. **Viewing Attendance History:**
   - Selects "Attendance History" from the dashboard.
   - Uses a date picker to select the date for which they want to view attendance records.
   - Sees a list of students with their attendance status for the selected date.

---

## Student User Flows

1. **Student Logging In:**
   - Student opens the app and sees the login screen.
   - Enters username and password.
   - Clicks the "Login" button.
   - If credentials are correct, the student is directed to their dashboard.

2. **Checking In:**
   - If the student is checking in using a QR code:
     - Scans the QR code generated by the teacher.
     - The app confirms the check-in and shows a success message.
   - If the student is checking in using a short code:
     - Enters the short code provided by the teacher.
     - The app confirms the check-in and shows a success message.

3. **Viewing Attendance History:**
   - After checking in, the student can navigate to their profile or dashboard.
   - Views their attendance history, showing dates and statuses (e.g., present/absent).

4. **Requesting to Join a Class:**
   - If not enrolled in a class, the student enters a class ID to request joining.
   - The request is sent to the teacher for approval.
