# Role & Privilege Reference - Mechara School SMS

## Overview

This document defines exact privileges for each of the 5 roles in the system. Each role has completely different access levels and responsibilities.

---

## Complete Privilege Matrix

| **Action** | **Admin** | **Teacher** | **Registrar** | **Finance** | **Student** |
|---|:---:|:---:|:---:|:---:|:---:|
| **View Dashboard** | ✓ Full | ✓ Limited | ✓ Limited | ✓ Limited | ✓ Personal Only |
| **View All Students** | ✓ | ✗ | ✗ | ✗ | ✗ |
| **View Own Class** | N/A | ✓ | N/A | N/A | N/A |
| **Approve Student Registration** | **✓ EXCLUSIVE** | ✗ | ✗ | ✗ | ✗ |
| **Reject Student Application** | **✓ EXCLUSIVE** | ✗ | ✗ | ✗ | ✗ |
| **Register New Student** | ✓ | ✗ | **✓** | ✗ | ✗ |
| **Edit Student Info** | ✓ All | ✗ | ✓ All | ✗ | ✗ |
| **Delete Student** | ✓ | ✗ | ✗ | ✗ | ✗ |
| **Take Attendance** | ✓ All Classes | **✓ Own Class Only** | ✗ | ✗ | ✗ |
| **View Attendance** | ✓ All | ✓ Own Class | ✗ | ✗ | ✓ Own |
| **Enter Grades** | ✓ All | **✓ Own Class Only** | ✗ | ✗ | ✗ |
| **View Grades** | ✓ All | ✓ All | ✗ | ✗ | ✓ Own |
| **Record Fee Payments** | ✓ | ✗ | ✗ | **✓** | ✗ |
| **View Fee Records** | ✓ All | ✗ | ✗ | ✓ All | ✓ Own |
| **Create User Account** | **✓ EXCLUSIVE** | ✗ | ✗ | ✗ | ✗ |
| **Edit User Role** | **✓ EXCLUSIVE** | ✗ | ✗ | ✗ | ✗ |
| **Delete User** | **✓ EXCLUSIVE** | ✗ | ✗ | ✗ | ✗ |
| **Access System Settings** | **✓ EXCLUSIVE** | ✗ | ✗ | ✗ | ✗ |
| **Edit Own Profile** | ✓ | ✓ | ✓ | ✓ | ✓ |
| **View Reports** | ✓ All Reports | ✓ Own Class Only | ✗ | ✓ Finance Only | ✗ |

---

## Pages by Role

### 1. Administrator (`admin`)
**Full System Access**

Pages Accessible:
- ✓ Dashboard (full stats + all quick actions)
- ✓ **Student Approvals** (approve/reject registrations)
- ✓ Students (view/manage all)
- ✓ Attendance (mark for any class)
- ✓ Grades (enter for any class)
- ✓ Fees (record & manage)
- ✓ Teachers (CRUD staff)
- ✓ Users (manage accounts & roles)
- ✓ Settings (system configuration)

**Unique Powers:**
- Only role that can **approve student registrations**
- Only role that can **create/delete user accounts**
- Only role that can **change user roles**
- Only role with **system settings access**

**Demo Credential:**
```
Username: admin
Password: admin123
```

---

### 2. Teacher (`teacher`)
**Academic Management - Own Class Only**

Pages Accessible:
- ✓ Dashboard (limited - own class stats)
- ✓ My Class (see only own students)
- ✓ Attendance (mark for own class ONLY)
- ✓ Grades (enter for own class ONLY)
- ✓ Settings (profile only)

**Constraints:**
- Can ONLY see students in their assigned class
- Can ONLY mark attendance for their class
- Can ONLY enter grades for their class
- Cannot see other teacher's classes
- Cannot manage students, fees, or users

**Use Case:**
Teacher logs in, marks attendance for Grade 9A, enters grades for English students in Grade 9A. Cannot see Grade 10 students.

**Demo Credential:**
```
Username: teacher
Password: teacher123
```

---

### 3. Registrar (`registrar`)
**Student Enrollment Management**

Pages Accessible:
- ✓ Dashboard (enrollment stats)
- ✓ Students (register new, manage existing)
- ✓ Student Approvals (view pending ONLY - cannot approve)
- ✓ Settings (profile only)

**Exact Powers:**
- Register new students (awaiting admin approval)
- Edit student records
- View all students (but cannot delete)
- See pending approvals (informational only)
- Cannot approve or reject applications

**Use Case:**
Registrar registers a new student (Abebe Tadesse). Application goes to pending. Admin approves. Registrar can see it's approved but didn't approve it themselves.

**Demo Credential:**
```
Username: registrar
Password: reg123
```

---

### 4. Finance (`finance`)
**Fee Management Only**

Pages Accessible:
- ✓ Dashboard (fee statistics only)
- ✓ Fees (record payments, view history)
- ✓ Reports (finance reports only)
- ✓ Settings (profile only)

**Exact Powers:**
- Record fee payments
- View fee collection reports
- View payment history per student
- Cannot: manage students, attendance, grades, users

**Use Case:**
Finance officer records that Abebe paid ETB 5,000 tuition fee on Sept 10. System shows total collected, who's paid, who owes.

**Demo Credential:**
```
Username: finance
Password: fin123
```

---

### 5. Student (`student`)
**Personal Portal - After Admin Approval**

Pages Accessible (ONLY After Approval):
- ✓ Dashboard (personal stats only)
- ✓ Settings (profile only)

**Can View:**
- Own grades (entered by teacher)
- Own attendance record
- Own fee status
- Guardian contact info

**Cannot:**
- Access system until admin approves registration
- See other students' data
- Edit grades or attendance
- Record fees
- Manage any data

**Workflow:**
1. Student uses "Student Self-Registration" button on login
2. Fills: name, email, username, password, guardian phone
3. Application goes to PENDING status
4. Admin reviews in "Student Approvals"
5. Admin clicks "Approve"
6. Student account created, student can login
7. Student sees personal portal

**Demo Credential (After Self-Registration + Admin Approval):**
```
Username: [registered username]
Password: [registered password]
```

---

## Real-World Workflows

### Workflow 1: Admit New Student

**Step 1: Registrar Registers**
1. Registrar logs in (`registrar` / `reg123`)
2. Goes to "Students" page
3. Clicks "Register New Student"
4. Fills form: Name, DOB, Guardian, etc.
5. Clicks "Submit"
6. Status: **PENDING**

**Step 2: Admin Approves**
1. Admin logs in (`admin` / `admin123`)
2. Goes to "Student Approvals" (EXCLUSIVE)
3. Sees pending student (Abebe Tadesse)
4. Clicks "Approve"
5. System automatically:
   - Creates student account in database
   - Assigns "Student" role
   - Generates username (from registration)
   - Student can now login

**Result:** Registrar + Admin worked together. Student now has account.

---

### Workflow 2: Teacher Marks Attendance

**Scenario:** Teacher Tigist teaches Grade 9A English

**Step 1: Teacher Takes Attendance**
1. Tigist logs in (`teacher` / `teacher123`)
2. Goes to "Attendance"
3. Selects "Grade 9A" (only option shown)
4. Date: Sept 10, 2026
5. Marks: Abebe (Present), Almaz (Absent), Hailu (Late)
6. Clicks "Save"

**Step 2: Student Sees It**
1. Abebe logs in
2. Goes to personal dashboard
3. Sees attendance: 19/20 days present (95%)

**Step 3: Admin Verifies**
1. Admin logs in
2. Goes to "Attendance"
3. Sees all classes, all teachers, all dates
4. Can regenerate reports

**Result:** Decentralized but verified workflow.

---

### Workflow 3: Finance Records Payment

**Scenario:** Parent pays student fees

**Step 1: Finance Records**
1. Finance officer logs in (`finance` / `fin123`)
2. Goes to "Fees"
3. Clicks "Record Payment"
4. Enters: Student ID, Amount (ETB 5,000), Date, Type (Tuition)
5. Clicks "Save"

**Step 2: Student Checks Status**
1. Abebe logs in
2. Goes to dashboard
3. Sees fee status: "ETB 5,000 paid (balanced)"

**Step 3: Admin Reports**
1. Admin goes to "Fees" page
2. Sees total collected: ETB 245,000
3. Sees who paid, who owes
4. Can export report

**Result:** Single entry point (Finance), visible to all roles (Admin sees all, Student sees own).

---

### Workflow 4: Teacher Enters Grades

**Scenario:** Exam scores need to be recorded

**Step 1: Teacher Enters Grades**
1. Tigist logs in
2. Goes to "Grades"
3. Selects "Grade 9A - English"
4. Enters scores: Abebe (85), Almaz (92), Hailu (78)
5. Clicks "Save"

**Step 2: Student Views**
1. Abebe logs in
2. Goes to dashboard
3. Sees grade: English 85/100

**Step 3: Admin Archives**
1. Admin logs in
2. Goes to "Grades"
3. Sees all subjects, all classes
4. Can generate transcript

**Result:** Teacher autonomy (enter own class grades) + Admin oversight (see everything).

---

## Access Denied Scenarios

| Attempt | What Happens | Why | Resolution |
|---|---|---|---|
| **Teacher accesses "Fees"** | Page not in nav | Teachers can't manage fees | This is by design - only Finance & Admin |
| **Registrar clicks "Approve"** | Button disabled/grayed | Only Admin can approve | Registrar can register, Admin must approve |
| **Finance goes to "Attendance"** | Access denied error | Finance role lacks permission | Finance only sees fees - ask Admin if issue |
| **Student visits "Users"** | Page not accessible | Students can't manage users | Only Admin can create/delete accounts |
| **Teacher views Grade 10A** | Sees only Grade 9A | Class filtering applied | Teachers see only their assigned class |
| **Anyone tries "System Settings"** | Access denied | Admin exclusive | Only Admin can config system |

---

## Key Differences Explained

### Admin vs Teacher
- **Admin:** Sees EVERYTHING (all classes, all students, all fees)
- **Teacher:** Sees ONLY own class (assigned by admin)
- **Admin:** Can take attendance for any class
- **Teacher:** Can take attendance for only assigned class

### Admin vs Registrar
- **Admin:** Can APPROVE student registrations (creates account)
- **Registrar:** Can REGISTER students (submits for approval)
- **Admin:** Can delete students
- **Registrar:** Can only manage registered students

### Admin vs Finance  
- **Admin:** Can see all fees (manual override possible)
- **Finance:** Can record fees (primary responsibility)
- **Admin:** Can manage users/roles
- **Finance:** Can only manage their own profile

### Teacher vs Everyone Else
- **Teacher:** ONLY academic (attendance, grades)
- **Everyone Else:** Specific business domains (student reg, fees, system mgmt)
- **Teacher:** Blocked from financial, user management

### Student vs Everyone
- **Student:** Personal data ONLY (own grades, own attendance)
- **Everyone Else:** Organizational scope (sees many students/classes)
- **Student:** Cannot edit anything until after approval

---

## Permission Levels

### Read-Only (`ro`)
User can VIEW data but CANNOT:
- Edit
- Create
- Delete  
- Modify

Example: Registrar viewing "Student Approvals" (sees pending but can't approve)

### Read-Write (`rw`)
User can VIEW, CREATE, EDIT, DELETE data.

Example: Admin approving a student (read the application, write the approval)

---

## Testing Checklisted

### Test as Admin
```
Username: admin
Password: admin123
```
- [ ] Approve a pending student registration
- [ ] Reject a pending student registration
- [ ] Record a fee payment
- [ ] Enter grades for multiple classes
- [ ] Create a new teacher account
- [ ] Delete a teacher account
- [ ] View system settings
- [ ] Mark attendance for any class

### Test as Teacher
```
Username: teacher
Password: teacher123
```
- [ ] See only own class students (not others)
- [ ] Mark attendance for own class
- [ ] Enter grades for own class
- [ ] Try to access "Fees" (should fail or be hidden)
- [ ] Try to access "Users" (should fail)

### Test as Registrar
```
Username: registrar
Password: reg123
```
- [ ] Register a new student
- [ ] See pending approvals (read-only)
- [ ] Try to approve a student (should fail)
- [ ] View all registered students

### Test as Finance
```
Username: finance
Password: fin123
```
- [ ] Record a fee payment
- [ ] View fee reports
- [ ] Try to take attendance (should fail)
- [ ] Try to enter grades (should fail)

### Test as Student
1. Click "Student Self-Registration" on login
2. Fill: name, email, username, password, phone
3. As admin, approve the registration
4. Login with student credentials
5. [ ] See personal dashboard only
6. [ ] View own grades
7. [ ] View own attendance
8. [ ] Try to view other students (should fail)
9. [ ] Try to enter grades (should fail)

---

## Important Notes

### Role Assignment
- Only **Admin** can create/assign roles
- Roles are assigned at account creation
- Staff roles: admin, teacher, registrar, finance
- Student role: assigned automatically on approval

### Class Assignment
- Admin assigns teacher to class
- Teacher can only see/manage assigned class
- Prevents teachers from seeing other classes

### Student Approval
- REQUIRED workflow: Student registers → Admin approves → Account created
- Only admin can approve
- Registrar can register (request) but cannot approve
- Student cannot login until admin approves

### Data Scoping
- **Admin:** sees all data
- **Teacher:** sees only own class data
- **Registrar:** sees all student records
- **Finance:** sees all fee records
- **Student:** sees only own records

---

## Privilege Summary Table

**Can Do These:**

| **Admin** | **Teacher** | **Registrar** | **Finance** | **Student** |
|---|---|---|---|---|
| Everything | Attend. & Grades (own class) | Register Students | Record Fees | View Personal |
| Approve Students | — | — | — | — |
| Manage Users | — | — | — | — |
| System Settings | — | — | — | — |

**Cannot Do:**

| **Admin** | **Teacher** | **Registrar** | **Finance** | **Student** |
|---|---|---|---|---|
| — | Any other class | Approve Students | Attend./Grades | Anything else |
| — | Manage fees | Approve Students | Manage Students | — |
| — | Manage users | Manage fees | Manage users | — |

---

**Last Updated:** September 10, 2026  
**Status:** ✅ Complete & Ready for Production  
**Questions?** See DEPLOYMENT.md for getting help

---

## Pages Accessible by Role

### Administrator
- ✓ Dashboard
- ✓ Student Approvals (exclusive)
- ✓ Students (manage all)
- ✓ Attendance (all classes)
- ✓ Grades (all classes)
- ✓ Fees (manage all)
- ✓ Users (exclusive - staff management)
- ✓ Settings

### Teacher
- ✓ Dashboard (limited stats)
- ✓ My Class (own students only)
- ✓ Attendance (can mark for own class)
- ✓ Grades (can enter for own class)
- ✓ Settings (profile only)

### Registrar
- ✓ Dashboard (enrollment stats)
- ✓ Students (register & manage)
- ✓ Settings (profile only)

### Finance
- ✓ Dashboard (fee stats)
- ✓ Fees (record & manage)
- ✓ Settings (profile only)

### Student
- ✓ Dashboard (personal stats only - after approval)
- ✓ Settings (profile only)

---

## Real-World Workflows

### Workflow 1: New Student Registration
1. **Student** → Uses "Student Self-Registration"
2. **Admin** → Receives in "Student Approvals"
3. **Admin** → Clicks "Approve"
4. **System** → Creates student account automatically
5. **Student** → Can now login and see portal

### Workflow 2: Teacher Takes Attendance
1. **Teacher** → Logs in
2. **Teacher** → Goes to "Attendance" page
3. **Teacher** → Selects own class & date
4. **Teacher** → Marks Present/Absent/Late for each student
5. **Teacher** → Clicks "Save"
6. **Admin** → Can view attendance records in Dashboard

### Workflow 3: Finance Records Fee Payment
1. **Finance** → Logs in
2. **Finance** → Goes to "Fees" page
3. **Finance** → Clicks "Record Payment"
4. **Finance** → Enters: Student ID, Amount, Date, Type
5. **Finance** → Clicks "Save Payment"
6. **Admin/Student** → Can see updated fee status

### Workflow 4: Student Checks Grades
1. **Student** → Logs in (after admin approval)
2. **Student** → Goes to Dashboard
3. **Student** → Sees "My Grade" stat (entered by teacher)
4. **Student** → Views own grades
5. **Student** → Views own attendance

### Workflow 5: Teacher Enters Grades
1. **Teacher** → Logs in
2. **Teacher** → Goes to "Grades" page
3. **Teacher** → Selects class
4. **Teacher** → Enters grade for each student
5. **Teacher** → Clicks "Save"
6. **Admin/Student** → Can view those grades

---

## Access Denied Scenarios

| Situation | What Happens | Why |
|---|---|---|
| Teacher tries to access "Fees" | Page hidden from nav | Teacher role doesn't include fees |
| Finance tries to "Take Attendance" | Access denied error | Finance role lacks attendance permission |
| Registrar tries to "Approve Students" | Page not accessible | Only admin can approve |
| Student tries to access "Grades" edit | Read-only mode | Students can only view their own |
| Teacher tries to view other teacher's class | See only own students | Class filtering applied |

---

## Key Differences Between Roles

### Admin vs Teacher
- **Admin** sees EVERYTHING, EVERYONE
- **Teacher** sees only OWN class students

### Admin vs Registrar
- **Admin** can APPROVE students
- **Registrar** can only REGISTER (awaiting approval)

### Teacher vs Finance
- **Teacher** manages academic (attendance, grades)
- **Finance** manages financial (fees, payments)

### Student vs All Staff
- **Student** sees ONLY own data
- All staff roles see organizational data

---

## Demo Accounts & Recommended Tests

### Test as Admin
```
Username: admin
Password: admin123
```
**Test:**
1. Approve a pending student registration
2. View all students
3. Create a new teacher account
4. View all fees collected

### Test as Teacher
```
Username: teacher
Password: teacher123
```
**Test:**
1. Mark attendance for own class
2. Enter grades for own class
3. Try to access Students page (should be hidden)
4. View Dashboard limited stats

### Test as Registrar
```
Username: registrar
Password: reg123
```
**Test:**
1. Register a new student
2. See pending approvals (info only)
3. Try to take attendance (should fail)

### Test as Finance
```
Username: finance
Password: fin123
```
**Test:**
1. Record a fee payment
2. View fee reports
3. Try to access Students (should fail)

### Test as Student
1. Use "Student Self-Registration" button
2. Fill registration form
3. As admin, approve the registration
4. Login with student credentials
5. See personal dashboard only

---

## Permission Inheritance

- **Admin** = ALL permissions + can grant/revoke permissions
- **Teacher** = Academic permissions (attendance, grades) for own class only
- **Registrar** = Registration permissions only
- **Finance** = Financial permissions only
- **Student** = Read-only personal data access

---

**Last Updated:** 2026-09-10  
**Status:** Ready for Production ✓
