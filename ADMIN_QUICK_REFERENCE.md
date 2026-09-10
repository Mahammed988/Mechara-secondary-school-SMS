# Admin Dashboard - Quick Reference Guide

## 🎯 Quick Access Paths

### User Management
```
Login as Admin
    ↓
Dashboard
    ↓
Left Sidebar → Users
    ↓
View/Add/Edit/Delete Staff
```

### Student Management
```
Login as Admin
    ↓
Dashboard
    ↓
Left Sidebar → Students
    ↓
View/Add/Edit/Delete Students
```

---

## 👥 USER MANAGEMENT (Admin Only)

### View Users
**Path:** Dashboard → Users  
**Display:** Grid layout with 4+ cards per row  
**Shows:** Name, Username, Email, Phone, Role Badge

### Add New User
| Step | Action |
|------|--------|
| 1 | Click "+ Add Staff" button |
| 2 | Fill form fields |
| 3 | Click "Create User" |
| 4 | See confirmation toast |

**Required Fields:**
- Name
- Role (Teacher/Registrar/Finance)
- Username (must be unique)
- Password (min 6 chars)

**Optional Fields:**
- Email
- Phone

### Edit User
| Step | Action |
|------|--------|
| 1 | Click "Edit" on user card |
| 2 | Modal opens with data |
| 3 | Modify fields |
| 4 | Click "Update User" |
| 5 | See confirmation |

**Can Change:**
- Name
- Role
- Email
- Phone
- Password (optional)

**Cannot Change:**
- Username (read-only)

### Delete User
| Step | Action |
|------|--------|
| 1 | Click "Delete" on card |
| 2 | Confirm: "Delete this user?" |
| 3 | Click OK |
| 4 | User removed |

---

## 👨‍🎓 STUDENT MANAGEMENT (Admin & Registrar)

### View Students
**Path:** Dashboard → Students  
**Display:** Table with sortable columns  
**Shows:** Name, Student ID, Grade, Status

### Add New Student
| Step | Action |
|------|--------|
| 1 | Click "+ Add Student" button |
| 2 | Fill form fields |
| 3 | Click "Add Student" |
| 4 | See confirmation toast |

**Required Fields:**
- Name
- Grade

**Optional Fields:**
- Guardian Name
- Guardian Phone
- Email
- Date of Birth

**Auto-Generated:**
- Student ID (MSS-[timestamp])

### Edit Student
| Step | Action |
|------|--------|
| 1 | Click Edit icon (✎) on row |
| 2 | Modal opens with data |
| 3 | Modify any field |
| 4 | Click "Update Student" |
| 5 | See confirmation |

**Can Change:**
- Name
- Grade
- Guardian Name/Phone
- Email
- Date of Birth
- Status (Active/Inactive/Suspended)

**Cannot Change:**
- Student ID (read-only)

### Delete Student - Option 1 (From Table)
| Step | Action |
|------|--------|
| 1 | Find student row |
| 2 | Click Delete icon (🗑) |
| 3 | Confirm deletion |
| 4 | Student removed |

### Delete Student - Option 2 (From Modal)
| Step | Action |
|------|--------|
| 1 | Open student edit modal |
| 2 | Click "Delete" button |
| 3 | Confirm: "Are you sure?" |
| 4 | Student removed |

---

## 🎯 QUICK KEYBOARD SHORTCUTS

| Shortcut | Action |
|----------|--------|
| F12 | Open console (debug) |
| Ctrl+R | Refresh page |
| Ctrl+Shift+R | Hard refresh |
| Ctrl+Shift+Delete | Clear cache |

---

## 📋 COMMON TASKS

### Add Teacher
```
1. Users Tab
2. Click "+ Add Staff"
3. Name: "John Smith"
4. Role: "Teacher"
5. Username: "john"
6. Password: "Pass123"
7. Click "Create User"
✅ Done!
```

### Add Registrar
```
1. Users Tab
2. Click "+ Add Staff"
3. Name: "Mary Jane"
4. Role: "Registrar"
5. Username: "mary"
6. Password: "Pass123"
7. Click "Create User"
✅ Done!
```

### Add Student
```
1. Students Tab
2. Click "+ Add Student"
3. Name: "Jane Doe"
4. Grade: "Grade 9 - A"
5. Guardian: "John Doe"
6. Phone: "+251 912345678"
7. Click "Add Student"
✅ Done! Gets ID: MSS-XXXXXXXXX
```

### Transfer Student to Different Grade
```
1. Students Tab
2. Click Edit icon (✎) on student
3. Change Grade field
4. Click "Update Student"
✅ Done!
```

### Suspend Student
```
1. Students Tab
2. Click Edit icon (✎)
3. Change Status to "Suspended"
4. Click "Update Student"
✅ Done!
```

### Remove User
```
1. Users Tab
2. Click "Delete" on user card
3. Confirm deletion
4. Click OK
✅ Done! User removed permanently
```

### Remove Student
```
1. Students Tab
2. Click Delete icon (🗑) on row
3. Click OK to confirm
✅ Done! Student removed permanently
```

---

## 🔐 ROLE PERMISSIONS

### Admin
- ✅ Access Users Tab
- ✅ Add/Edit/Delete Users
- ✅ Access Students Tab
- ✅ Add/Edit/Delete Students
- ✅ Full Dashboard Access

### Registrar
- ❌ Cannot access Users Tab
- ✅ Access Students Tab
- ✅ Add/Edit/Delete Students

### Teacher
- ❌ Cannot access Users Tab
- ✅ View Students Tab (read-only)
- ✅ Cannot edit/delete

### Finance
- ❌ Cannot access Users Tab
- ❌ Cannot access Students Tab

### Student
- ❌ No admin access

---

## 🚨 ERROR MESSAGES & SOLUTIONS

| Error | Cause | Solution |
|-------|-------|----------|
| "Username taken" | User exists | Use different username |
| "Fill all required fields" | Missing data | Check Name, Role, Username |
| "Name and grade required" | Missing fields | Select grade from dropdown |
| Data disappeared | Cache cleared | Refresh page - localStorage recovered |
| Can't edit/delete | Not admin | Login with admin account |
| Modal won't open | Browser issue | Try Ctrl+Shift+R hard refresh |

---

## 💾 DATA STORAGE

### Location
Browser localStorage (automatic, no action needed)

### Check Data in Console
```javascript
// View all users
JSON.parse(localStorage.getItem('mssms_users'))

// View all students
JSON.parse(localStorage.getItem('mssms_students'))

// Clear specific data (if needed)
localStorage.removeItem('mssms_users')
localStorage.removeItem('mssms_students')
```

---

## 🎨 UI ELEMENTS LEGEND

| Icon | Meaning | Action |
|------|---------|--------|
| ✎ | Edit | Click to edit item |
| 🗑 | Delete | Click to delete item |
| ✅ | Approved | Status confirmed |
| ⚠️ | Warning | Needs attention |
| [+] | Add new | Add new item |
| [E] | Edit | Edit button |
| [D] | Delete | Delete button |

---

## 📊 VIEWING DATA

### User Cards Show
```
[Avatar Letter]
[User Name]
[@username]
[Role Badge - Color coded]

[email@address]
[+251 9XXXXXXXXX]

[Edit Button] [Delete Button]
```

### Student Table Shows
```
# | Name | Student ID | Grade | Status | Actions
1 | Jane | MSS-001 | Grade 9-A | ✓ | ✎ 🗑
2 | John | MSS-002 | Grade 10-A | ✓ | ✎ 🗑
```

---

## ✨ CONFIRMATION DIALOGS

### Delete User
```
"Delete this user?"
[Cancel] [OK]
```

### Delete Student (from table)
```
"Are you sure you want to delete this student?"
[Cancel] [OK]
```

### Delete Student (from modal)
```
"Are you sure you want to delete this student?
This action cannot be undone."
[Cancel] [OK]
```

---

## 📝 FORM FIELDS EXPLAINED

### User Form
- **Name:** Full name (required)
- **Role:** Teacher, Registrar, or Finance (required)
- **Username:** Login ID, must be unique (required)
- **Password:** Min 6 chars (required for new, optional to update)
- **Email:** Optional, for contact
- **Phone:** Optional, for contact

### Student Form
- **Name:** Student's full name (required)
- **Grade:** Class level (required) - 6 options
- **Guardian Name:** Parent/guardian name (optional)
- **Guardian Phone:** Contact number (optional)
- **Email:** Student email (optional)
- **Date of Birth:** YYYY-MM-DD format (optional)
- **Status:** Active/Inactive/Suspended (only on edit)

---

## 🔄 DATA PERSISTENCE

✅ **Auto-Save:** Changes save instantly  
✅ **Persistent:** Data remains after browser close  
✅ **Reliable:** Works offline with localStorage  

### To Verify Data Saved
1. Make a change (e.g., edit student name)
2. Refresh page (F5)
3. Data should still be there ✅

---

## 🚀 PERFORMANCE TIPS

✅ **Fast:** All operations instant (no server)  
✅ **Offline:** Works without internet  
✅ **Scalable:** Handles 100+ users/students  
✅ **No lag:** UI responds immediately  

---

## 🆘 QUICK TROUBLESHOOTING

### Issue: Can't see Users tab
**Solution:** Log in with admin account (not registrar/teacher)

### Issue: "+ Add Student" button hidden
**Solution:** Only admin & registrar can add. Check your role.

### Issue: Changes disappeared
**Solution:** Hard refresh (Ctrl+Shift+R) or check if logged out

### Issue: Delete button not working
**Solution:** Check browser console (F12) for errors

### Issue: Modal won't close
**Solution:** Click Cancel or X button, try refresh

---

## 📚 RELATED DOCUMENTATION

- `ADMIN_MANAGEMENT_FEATURES.md` - Complete feature guide
- `ADMIN_FEATURES_SUMMARY.md` - Detailed summary
- `ROLES.md` - Role permissions
- `QUICK_REFERENCE.md` - General system guide

---

## ✅ VERIFICATION CHECKLIST

After adding/editing, verify:

- [ ] Toast message appears (green = success)
- [ ] Data visible in table/grid
- [ ] Refresh page - data persists
- [ ] Can view in console: `localStorage.getItem('mssms_users')`
- [ ] No errors in F12 console

---

## 🎓 Practice Scenarios

### Scenario 1: Add New Teacher
```
1. Login as admin
2. Go to Users
3. Click "+ Add Staff"
4. Enter: Name: "Mr. Wilson"
5. Role: "Teacher"
6. Username: "wilson"
7. Password: "Teacher@123"
8. Click Create
9. See new card in grid ✅
```

### Scenario 2: Update Student Grade
```
1. Login as admin
2. Go to Students
3. Find "Jane Doe" row
4. Click Edit (✎)
5. Change Grade to "Grade 10 - A"
6. Click Update
7. See refresh in table ✅
```

### Scenario 3: Suspend Student
```
1. Go to Students
2. Click Edit on student
3. Change Status to "Suspended"
4. Click Update
5. Status changes in table ✅
```

---

## 💡 TIPS & TRICKS

**Tip 1:** Username must be unique - good practice: firstname or email prefix
**Tip 2:** Passwords are important - use mix of letters and numbers
**Tip 3:** Student IDs auto-generate - don't worry about them
**Tip 4:** Status helps track students - use it to manage access
**Tip 5:** Edit modal has delete button for convenience

---

## 🎯 GETTING HELP

1. **Check Console:** F12 → Console tab for errors
2. **Verify Role:** Check if you have permission for action
3. **Refresh Page:** Ctrl+Shift+R to reload
4. **Clear Cache:** Ctrl+Shift+Delete if data issues
5. **Read Docs:** Check ADMIN_MANAGEMENT_FEATURES.md

---

**Created:** September 10, 2026  
**Status:** ✅ COMPLETE  
**Version:** 1.0  

Happy administrating! 🎉
