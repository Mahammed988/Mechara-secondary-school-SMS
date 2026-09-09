# Mechara Secondary School - Management System (SMS)

A complete, production-ready **Role-Based School Management System** with student self-registration, admin verification, attendance tracking, grade management, and fee collection.

## ✨ Features

- ✅ **5 User Roles** with distinct privileges (Admin, Teacher, Registrar, Finance, Student)
- ✅ **Student Self-Registration** with admin approval workflow
- ✅ **Attendance Management** (teachers mark for own class)
- ✅ **Grade Management** (teachers enter for own class)
- ✅ **Fee Tracking** (finance records, students view status)
- ✅ **Role-Based Access Control** (automatic nav, page filtering)
- ✅ **100% Client-Side** (no backend needed)
- ✅ **localStorage Persistence** (survives page refresh)
- ✅ **Responsive Design** (works on desktop, tablet, mobile)
- ✅ **Ready for Vercel** (one-click deployment)

## 🚀 Quick Start

### Local Development
```bash
# Start local server
python -m http.server 3000

# Open browser
# http://localhost:3000
```

### Demo Credentials
| Role | Username | Password |
|------|----------|----------|
| Admin | `admin` | `admin123` |
| Teacher | `teacher` | `teacher123` |
| Registrar | `registrar` | `reg123` |
| Finance | `finance` | `fin123` |
| Student | Click "Student Self-Registration" |

## 📋 Roles & Privileges

### 1. Administrator
- ✓ Full system access
- ✓ **Approve/reject student registrations** ← Key role
- ✓ View all students, attendance, grades, fees
- ✓ Create/edit/delete user accounts
- ✓ System configuration

### 2. Teacher
- ✓ **Mark attendance for own class**
- ✓ **Enter grades for own class**
- ✓ View own class students only
- ✗ Cannot: manage fees, users, other classes

### 3. Registrar
- ✓ **Register new students** (submit for approval)
- ✓ Manage student records
- ✓ View pending approvals
- ✗ Cannot: approve, take attendance, manage fees

### 4. Finance
- ✓ **Record fee payments**
- ✓ View fee reports
- ✗ Cannot: manage students, attendance, grades

### 5. Student
- ✓ View own grades (after approval)
- ✓ View own attendance
- ✓ View own fee status
- ✗ Cannot: access until admin approves registration

**Full Matrix:** See [ROLES.md](./ROLES.md)

## 📱 Student Registration Workflow

```
1. Student clicks "Student Self-Registration"
   ↓
2. Student fills form & submits
   ↓
3. Status: PENDING (awaiting admin approval)
   ↓
4. Admin logs in → "Student Approvals" → Reviews → Clicks "Approve"
   ↓
5. System creates student account automatically
   ↓
6. Student can now login with registered credentials
   ↓
7. Student sees personal dashboard (grades, attendance, fees)
```

## 🌐 Deploy to Vercel

### Option 1: CLI (Fastest)
```bash
npm install -g vercel
vercel login
vercel
vercel --prod
```

### Option 2: GitHub Integration
1. Push code to GitHub
2. Visit [vercel.com/new](https://vercel.com/new)
3. Select repo → Deploy

### Option 3: Drag & Drop
Visit [vercel.com/import](https://vercel.com/import) and paste GitHub URL.

**Result:** Your app lives at `https://[project-name].vercel.app`

See [DEPLOYMENT.md](./DEPLOYMENT.md) for complete guide.

## 📁 Project Structure

```
mechara-school-sms/
├── MSSMS/
│   └── frontend.html          # Main application (all-in-one)
├── vercel.json                # Vercel configuration
├── package.json               # Project metadata
├── ROLES.md                   # Complete privilege matrix
├── DEPLOYMENT.md              # Deployment guide (Vercel, local, troubleshooting)
└── README.md                  # This file
```

## 💾 Data Storage

All data stored in browser's **localStorage**:
- ✓ Persists across page refreshes
- ✓ Persists across sessions
- ✗ NOT synced between devices (by design)
- ✗ Lost if browser cache cleared

**For multi-device sync:** Consider adding a backend (Firebase, Node.js + MongoDB, etc.)

### Backup Data
```javascript
// Open DevTools Console (F12) and paste:
const backup = {
  users: localStorage.getItem('mssms_users'),
  students: localStorage.getItem('mssms_students'),
  pending: localStorage.getItem('mssms_pending'),
  fees: localStorage.getItem('mssms_fees'),
};
console.log(JSON.stringify(backup, null, 2));
// Copy output and save as backup.json
```

## 🔐 Key Security Notes

- **Client-side only:** No passwords sent to server
- **localStorage:** Each browser = separate data
- **No API calls:** No external dependencies
- **SessionStorage:** Login session per browser tab

For production with shared data across devices, add a backend authentication & database layer.

## 📊 Features Breakdown

### Dashboard
- Role-specific stats (Admin sees all, others see limited)
- Quick action buttons (filtered by role)
- Pending approvals count (Admin only)

### Students
- **Admin:** View/manage all, delete
- **Registrar:** Register new, manage info, view all
- **Teacher:** See only own class
- **Finance:** Basic info lookup
- **Student:** View own record only

### Attendance
- **Admin:** Mark/view for any class
- **Teacher:** Mark/view for own class only
- **Others:** Access denied

### Grades
- **Admin:** Enter/view for any subject
- **Teacher:** Enter/view for own class only
- **Student:** View own grades only

### Fees
- **Finance:** Record payments, view reports
- **Admin:** View all, can override
- **Student:** View own fee status
- **Others:** Access denied

### User Management
- **Admin only:** Create, edit, delete staff accounts
- Change user roles
- System settings

## 🧪 Testing Checklist

- [ ] Login as each role (5 tests)
- [ ] Register new student
- [ ] Approve student as admin
- [ ] Mark attendance as teacher
- [ ] Enter grades as teacher
- [ ] Record fee payment as finance
- [ ] View personal portal as student
- [ ] Try unauthorized access (should fail)
- [ ] Refresh page (data persists)
- [ ] Test on mobile (responsive)

## 🛠 Troubleshooting

### Issue: Can't login
**Solution:** Verify credentials in demo table above. Demo students don't exist until approved.

### Issue: Data disappears after refresh
**Solution:** Check your browser's localStorage isn't being cleared. Use private/incognito mode.

### Issue: Teacher can see other classes
**Solution:** This shouldn't happen. Teacher nav only shows own class. Check browser cache.

### Issue: Student can't login after approval
**Solution:** Admin must have clicked "Approve" (not just registered). Student gets account on approval.

### Issue: Deployment not working
**Solution:** Check Vercel dashboard for deployment status. See [DEPLOYMENT.md](./DEPLOYMENT.md) for troubleshooting.

## 📚 Documentation

- **[ROLES.md](./ROLES.md)** — Comprehensive privilege matrix & workflows
- **[DEPLOYMENT.md](./DEPLOYMENT.md)** — Vercel deployment, local dev, troubleshooting

## 🚀 Next Steps (Future)

- [ ] Add backend (Node/Express, Python Django)
- [ ] Add database (MongoDB, PostgreSQL, Firebase)
- [ ] Multi-device sync
- [ ] Email notifications
- [ ] PDF report generation
- [ ] SMS reminders
- [ ] Audit logs
- [ ] Two-factor authentication

## 📄 License

MIT License - Use freely in your school

## 👨‍💼 Support

For issues:
1. Check demo credentials above
2. Review [ROLES.md](./ROLES.md) for privilege matrix
3. Check [DEPLOYMENT.md](./DEPLOYMENT.md) for troubleshooting
4. Open browser DevTools (F12) → Console for errors

---

**Status:** ✅ Ready for Production  
**Last Updated:** September 10, 2026  
**Version:** 1.0.0

**Made for Mechara Secondary School** 🎓
