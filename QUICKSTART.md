# Quick Start Guide

## 🎯 1 Minute Setup

### Run Locally
```bash
cd c:/msspro
npm start
```
Opens at **http://localhost:3000**

### Demo Credentials
Copy-paste any of these:

**Admin** (Full Access)
```
Username: admin
Password: admin123
```

**Teacher** (Class Management)
```
Username: teacher
Password: teacher123
```

**Registrar** (Student Registration)
```
Username: registrar
Password: reg123
```

**Finance** (Fee Management)
```
Username: finance
Password: fin123
```

---

## 🎓 Test Student Self-Registration

1. Click **"Student Self-Registration"** on login page
2. Fill form:
   - Name: `John Doe`
   - Email: `john@email.com`
   - Username: `johndoe`
   - Password: `password123`
   - Guardian Phone: `+251 911 111 111`
3. Click **"Request Registration"**
4. ✅ You'll see confirmation message

### Now Approve as Admin
1. Log out
2. Log in as **admin** (admin123)
3. You'll see **"Student Approvals"** in sidebar
4. Click **"Approve"** for John Doe
5. ✅ Student account created automatically

### Login as Student
1. Log out
2. Log in with student credentials:
   - Username: `johndoe`
   - Password: `password123`
3. ✅ Access personal student portal!

---

## 📖 Role Quick Reference

| Role | What They Can Do | How Many Pages |
|------|------------------|---|
| 👮 **Admin** | Everything + approve students | 8 |
| 👩‍🏫 **Teacher** | Attendance + Grades (own class) | 5 |
| 📋 **Registrar** | Register students | 3 |
| 💰 **Finance** | Record & view fees | 4 |
| 🎓 **Student** | View own data | 2 |

---

## 🔍 What to Test

### As Admin
- [ ] Approve a pending student
- [ ] View all students
- [ ] Check "Student Approvals" page
- [ ] See all fees collected
- [ ] Access "Users" page (staff management)

### As Teacher
- [ ] Take attendance (select a class)
- [ ] Enter grades
- [ ] See only own students
- [ ] Try accessing "Fees" (should be hidden)

### As Registrar
- [ ] Register a new student
- [ ] Manage student records
- [ ] Try taking attendance (should fail)

### As Finance
- [ ] Record a fee payment
- [ ] View fee reports
- [ ] Try accessing "Students" (should be hidden)

### As Student
- [ ] Register yourself
- [ ] Wait for admin approval
- [ ] Login and see personal portal
- [ ] View grades (will show "—" if not entered)

---

## 💾 Data Storage

All data saved in **browser localStorage** — persists across sessions!

To reset all data:
1. Press **F12** (Developer Tools)
2. Go to **Console** tab
3. Type: `localStorage.clear()`
4. Press Enter
5. Refresh page

---

## 🚀 Deploy to Vercel (3 Steps)

### Step 1: Install Vercel
```bash
npm install -g vercel
```

### Step 2: Login
```bash
vercel login
```
(Choose "Continue with GitHub" or email)

### Step 3: Deploy
```bash
vercel --prod
```

✅ Done! Your app is live at `https://[project].vercel.app`

---

## 📁 File Structure

```
c:/msspro/
├── MSSMS/
│   └── frontend.html           ← Main app (single file!)
├── package.json                ← NPM config
├── vercel.json                 ← Deploy config
├── DEPLOYMENT.md               ← Full deployment guide
├── ROLES.md                    ← Role privileges detail
├── README.md                   ← Project overview
└── QUICKSTART.md              ← This file
```

---

## ⚠️ Common Issues

### "Login fails with demo credentials"
→ Make sure you typed exactly: `admin` / `admin123`

### "Student registration not appearing in approvals"
→ Log in as admin, go to "Student Approvals" page

### "Teacher can't see attendance page"
→ Attend is "Take Attendance" (enter marks), not view

### "Data disappears on browser close"
→ Normal! localStorage cleared. Use different browser to test persistence.

### "Deployed site shows blank page"
→ Hard refresh: `Ctrl+Shift+R` (Windows) or `Cmd+Shift+R` (Mac)

---

## ✨ Cool Features to Try

- 🎨 Smooth gradient backgrounds & animations
- 📱 Resize browser to see responsive design
- 🔔 Toast notifications when you save data
- 🎯 Role-based navigation (different for each role)
- 🔐 Access control enforced on every page
- ⚡ Instant page switching (no loading)

---

## 📞 Need Help?

1. **Syntax Error?** → Check DEPLOYMENT.md
2. **Role Question?** → Check ROLES.md
3. **Deployment?** → Check DEPLOYMENT.md
4. **General Info?** → Check README.md

---

## 🎉 You're Ready!

```
✓ App running locally
✓ Demo accounts tested
✓ Student registration working
✓ Roles & privileges understood
✓ Ready to deploy to Vercel
```

**Next Step:** Deploy to Vercel using 3 steps above! 🚀

---

**Happy Managing!** 🎓
