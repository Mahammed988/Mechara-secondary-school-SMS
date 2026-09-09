# Mechara School SMS - Quick Reference Guide

## 🎯 One-Minute Overview

A **role-based school management system** where:
- **Admin** approves student registrations and manages everything
- **Teacher** marks attendance & enters grades (own class only)
- **Registrar** registers new students (admin must approve)
- **Finance** records fee payments
- **Student** views personal grades, attendance, fees (after admin approval)

---

## ⚡ Quick Start (60 seconds)

### Step 1: Start Server
```bash
python -m http.server 3000
```

### Step 2: Open Browser
```
http://localhost:3000
```

### Step 3: Login
| Role | Username | Password |
|------|----------|----------|
| **Admin** | `admin` | `admin123` |
| **Teacher** | `teacher` | `teacher123` |
| **Registrar** | `registrar` | `reg123` |
| **Finance** | `finance` | `fin123` |
| **Student** | Click "Student Self-Reg" |

---

## 📋 What Each Role Does

### Admin
- Approves student registrations ⭐ (main job)
- Sees everything (all students, fees, attendance, grades)
- Creates/deletes user accounts
- System settings

### Teacher
- Marks attendance for own class ⭐
- Enters grades for own class ⭐
- Cannot see other teachers' classes

### Registrar
- Registers new students ⭐ (fills form, submits)
- Manages student info
- Sees pending approvals (can't approve them)

### Finance
- Records fee payments ⭐
- Views payment reports
- That's it - focused role

### Student
- Views own grades
- Views own attendance
- Views own fee status
- Must be approved by admin first

---

## 👥 Student Registration Workflow

```
STUDENT: Clicks "Student Self-Registration"
         Fills: name, email, username, password, phone
         Clicks "Request"
         ↓ Status: PENDING
         
ADMIN:   Sees new student in "Student Approvals"
         Clicks "Approve" button
         ↓ System creates account automatically
         
STUDENT: Can now login with registered username/password
         Sees personal dashboard
```

**Key:** Student CANNOT login until admin approves.

---

## 🔑 Access by Page

| Page | Admin | Teacher | Registrar | Finance | Student |
|------|:---:|:---:|:---:|:---:|:---:|
| Dashboard | ✓ | ✓ | ✓ | ✓ | ✓ |
| Students | ✓ | ✗ | ✓ | ✗ | ✗ |
| Attendance | ✓ | ✓* | ✗ | ✗ | ✗ |
| Grades | ✓ | ✓* | ✗ | ✗ | ✗ |
| Fees | ✓ | ✗ | ✗ | ✓ | ✗ |
| Users | ✓ | ✗ | ✗ | ✗ | ✗ |
| Settings | ✓ | ✓ | ✓ | ✓ | ✓ |

*= Teacher limited to own class only

---

## 🚀 Deploy to Vercel (5 minutes)

### Easy Way: CLI
```bash
npm install -g vercel
vercel login
vercel
vercel --prod
```

Done! Your app is now live at `https://[project-name].vercel.app`

### OR: GitHub Integration
1. Push code to GitHub
2. Go to [vercel.com/new](https://vercel.com/new)
3. Select repo → Deploy

---

## 💾 Data Storage

- ✓ Saved in browser localStorage
- ✓ Persists after page refresh
- ✗ NOT synced between browsers
- ✗ Lost if cache cleared

**Backup:** See [DEPLOYMENT.md](./DEPLOYMENT.md) for export script

---

## 🧪 Test Checklist (Quick)

- [ ] Login as admin (should see "Student Approvals")
- [ ] Login as teacher (should NOT see "Students")
- [ ] Register new student ("Student Self-Registration")
- [ ] As admin, approve the student
- [ ] Login as that student (should succeed now)
- [ ] Login as finance (should NOT see "Attendance")

---

## ❓ Common Questions

**Q: How do I make a student account?**  
A: Student clicks "Student Self-Registration" → Admin must approve → Account created

**Q: Can teacher see other classes?**  
A: No. Teacher only sees own class attendance/grades. By design.

**Q: Where is data stored?**  
A: Browser's localStorage. Lost if cache cleared.

**Q: Can I use this on my phone?**  
A: Yes! Works on any device. Responsive design.

**Q: How many students can I have?**  
A: Unlimited (depends on browser localStorage limits, ~5-10MB typically)

**Q: Can teachers see student grades entered by other teachers?**  
A: No. Each teacher only sees grades they entered for their class.

**Q: What if I forget admin password?**  
A: Clear localStorage and reload. Recreate admin account.

---

## 📁 File Overview

| File | Purpose |
|------|---------|
| `MSSMS/frontend.html` | The entire application (single file) |
| `ROLES.md` | Complete privilege matrix |
| `DEPLOYMENT.md` | How to deploy & troubleshoot |
| `README.md` | Full documentation |
| `vercel.json` | Vercel deployment config |
| `package.json` | Project metadata |

---

## 🔴 Red Flags (What Should Happen)

| What | Should Happen |
|------|---|
| Student tries to approve another student | Access denied ✓ |
| Finance tries to enter grades | Access denied ✓ |
| Teacher tries to view Grade 10 (not their class) | Page shows only their class ✓ |
| Registrar clicks "Approve" button | Button disabled or hidden ✓ |
| Student tries to access before approval | Blocked from login ✓ |

---

## 🆘 Troubleshooting

### "Can't login"
→ Check username/password in quick reference above  
→ For students, did admin approve first?

### "Data disappeared after refresh"
→ Likely browser cache. Use private/incognito window

### "Teacher sees other classes"
→ Not possible in current code. Try clearing cache

### "Deployment not working"
→ See [DEPLOYMENT.md](./DEPLOYMENT.md) "Troubleshooting" section

### "Button/feature not working"
→ Open DevTools (F12) → Console → Look for red errors

---

## 📞 Getting Help

1. **For Roles/Privileges:** Read [ROLES.md](./ROLES.md)
2. **For Deployment:** Read [DEPLOYMENT.md](./DEPLOYMENT.md)
3. **For Full Details:** Read [README.md](./README.md)
4. **For Code Issues:** Open browser Console (F12)

---

## 📊 Privilege Hierarchy

```
Admin (Full Access)
 ├─ Student Approval ← ONLY Admin
 ├─ User Management ← ONLY Admin
 └─ System Settings ← ONLY Admin

Teacher (Academic Only)
 ├─ Own Class Attendance
 └─ Own Class Grades

Registrar (Registration Only)
 └─ Student Registration (awaiting approval)

Finance (Fees Only)
 └─ Fee Management

Student (Personal Only)
 └─ View Own Data
```

---

## ✅ Ready to Deploy?

Check these 5 things:

- [ ] Test login as each role (demo creds work)
- [ ] Register a student & approve as admin
- [ ] Mark attendance as teacher
- [ ] Record fee as finance
- [ ] Works on mobile (landscape & portrait)

Then → `vercel --prod` → Live! 🎉

---

**Version:** 1.0.0  
**Last Updated:** September 10, 2026  
**Status:** ✅ Production Ready
