# Complex Student Registration System - Implementation Plan

## Overview
This document provides a comprehensive implementation plan for a student registration system with grade progression validation, document requirements, payment processing, and registrar scheduling.

---

## 1. Core Registration Workflow

### 1.1 Grade Progression Path
```
Grade 8
  ↓
Grade 9 (New Entry)
  ↓
Grade 10 (New Entry OR Senior)
  ↓
Grade 11 (New Entry OR Senior)
  ↓
Grade 12 (New Entry OR Senior)
```

### 1.2 Registration Types
- **New Entry**: First time enrolling at this level (requires documents)
- **Senior**: Continuing from previous level (conditional document requirements)

---

## 2. JSON Schema Architecture

### 2.1 Registration Configuration Schema

```json
{
  "registrationConfig": {
    "gradeProgression": {
      "validSequence": [8, 9, 10, 11, 12],
      "description": "Sequential grade levels allowed in system"
    },
    "fees": {
      "grade9": {
        "amount": 1000,
        "currency": "ETB",
        "description": "Grade 9 Registration Fee"
      },
      "grade10": {
        "amount": 1000,
        "currency": "ETB",
        "description": "Grade 10 Registration Fee"
      },
      "grade11": {
        "amount": 1000,
        "currency": "ETB",
        "description": "Grade 11 Registration Fee"
      },
      "grade12": {
        "amount": 1000,
        "currency": "ETB",
        "description": "Grade 12 Registration Fee"
      }
    },
    "paymentMethods": [
      "CBE",
      "Siinqe",
      "Awash",
      "CBO"
    ]
  }
}
```

### 2.2 Document Requirements Schema

```json
{
  "documentRequirements": {
    "grade9": {
      "registrationType": "NEW_ENTRY",
      "requiredDocuments": [
        {
          "id": "grade8_certificate",
          "name": "Grade 8 Certificate",
          "type": "certificate",
          "description": "Certificate of completion from Grade 8",
          "mandatory": true,
          "format": ["PDF", "JPG", "PNG"],
          "maxSize": 5242880
        },
        {
          "id": "profile_pic",
          "name": "Profile Picture",
          "type": "image",
          "description": "Student passport-sized photo",
          "mandatory": true,
          "format": ["JPG", "PNG"],
          "maxSize": 2097152
        },
        {
          "id": "national_id",
          "name": "National ID",
          "type": "document",
          "description": "Student National Identification card",
          "mandatory": true,
          "format": ["PDF", "JPG", "PNG"],
          "maxSize": 5242880
        },
        {
          "id": "guardian_pic",
          "name": "Guardian Picture",
          "type": "image",
          "description": "Guardian/Parent identification photo",
          "mandatory": true,
          "format": ["JPG", "PNG"],
          "maxSize": 2097152
        }
      ]
    },
    "grade10": {
      "newEntry": {
        "registrationType": "NEW_ENTRY",
        "requiredDocuments": [
          {
            "id": "grade9_transcript",
            "name": "Grade 9 Transcript",
            "type": "document",
            "description": "Official Grade 9 academic transcript",
            "mandatory": true,
            "format": ["PDF", "JPG", "PNG"],
            "maxSize": 5242880
          },
          {
            "id": "national_id",
            "name": "National ID",
            "type": "document",
            "description": "Student National Identification card",
            "mandatory": true,
            "format": ["PDF", "JPG", "PNG"],
            "maxSize": 5242880
          },
          {
            "id": "withdrawal_reason",
            "name": "Withdrawal Reason Document",
            "type": "document",
            "description": "Explanation letter for joining in Grade 10",
            "mandatory": true,
            "format": ["PDF", "JPG", "PNG"],
            "maxSize": 5242880
          },
          {
            "id": "profile_pic",
            "name": "Profile Picture",
            "type": "image",
            "description": "Student passport-sized photo",
            "mandatory": true,
            "format": ["JPG", "PNG"],
            "maxSize": 2097152
          },
          {
            "id": "guardian_pic",
            "name": "Guardian Picture",
            "type": "image",
            "description": "Guardian/Parent identification photo",
            "mandatory": true,
            "format": ["JPG", "PNG"],
            "maxSize": 2097152
          }
        ]
      },
      "senior": {
        "registrationType": "SENIOR",
        "description": "Continuing from Grade 9",
        "documentLogic": {
          "checkResults": {
            "description": "Validate student passed Grade 9",
            "condition": "IF (grade9_passed == true) THEN no_additional_docs_needed ELSE require_transcript"
          },
          "documentRequirements": [
            {
              "id": "profile_pic",
              "name": "Profile Picture",
              "type": "image",
              "description": "Student passport-sized photo",
              "mandatory": true,
              "format": ["JPG", "PNG"],
              "maxSize": 2097152,
              "condition": "always"
            },
            {
              "id": "guardian_pic",
              "name": "Guardian Picture",
              "type": "image",
              "description": "Guardian/Parent identification photo",
              "mandatory": true,
              "format": ["JPG", "PNG"],
              "maxSize": 2097152,
              "condition": "always"
            },
            {
              "id": "grade9_transcript",
              "name": "Grade 9 Transcript",
              "type": "document",
              "description": "Required if student did not pass Grade 9",
              "mandatory": true,
              "format": ["PDF", "JPG", "PNG"],
              "maxSize": 5242880,
              "condition": "IF grade9_passed == false"
            }
          ]
        }
      }
    },
    "grade11": {
      "newEntry": {
        "registrationType": "NEW_ENTRY",
        "requiredDocuments": [
          {
            "id": "grade10_transcript",
            "name": "Grade 10 Transcript",
            "type": "document",
            "description": "Official Grade 10 academic transcript",
            "mandatory": true,
            "format": ["PDF", "JPG", "PNG"],
            "maxSize": 5242880
          },
          {
            "id": "national_id",
            "name": "National ID",
            "type": "document",
            "description": "Student National Identification card",
            "mandatory": true,
            "format": ["PDF", "JPG", "PNG"],
            "maxSize": 5242880
          },
          {
            "id": "withdrawal_reason",
            "name": "Withdrawal Reason Document",
            "type": "document",
            "description": "Explanation letter for joining in Grade 11",
            "mandatory": true,
            "format": ["PDF", "JPG", "PNG"],
            "maxSize": 5242880
          },
          {
            "id": "profile_pic",
            "name": "Profile Picture",
            "type": "image",
            "description": "Student passport-sized photo",
            "mandatory": true,
            "format": ["JPG", "PNG"],
            "maxSize": 2097152
          },
          {
            "id": "guardian_pic",
            "name": "Guardian Picture",
            "type": "image",
            "description": "Guardian/Parent identification photo",
            "mandatory": true,
            "format": ["JPG", "PNG"],
            "maxSize": 2097152
          }
        ]
      },
      "senior": {
        "registrationType": "SENIOR",
        "description": "Continuing from Grade 10",
        "documentLogic": {
          "checkResults": {
            "description": "Validate student passed Grade 10",
            "condition": "IF (grade10_passed == true) THEN no_additional_docs_needed ELSE require_transcript"
          },
          "documentRequirements": [
            {
              "id": "profile_pic",
              "name": "Profile Picture",
              "type": "image",
              "description": "Student passport-sized photo",
              "mandatory": true,
              "format": ["JPG", "PNG"],
              "maxSize": 2097152,
              "condition": "always"
            },
            {
              "id": "guardian_pic",
              "name": "Guardian Picture",
              "type": "image",
              "description": "Guardian/Parent identification photo",
              "mandatory": true,
              "format": ["JPG", "PNG"],
              "maxSize": 2097152,
              "condition": "always"
            },
            {
              "id": "grade10_transcript",
              "name": "Grade 10 Transcript",
              "type": "document",
              "description": "Required if student did not pass Grade 10",
              "mandatory": true,
              "format": ["PDF", "JPG", "PNG"],
              "maxSize": 5242880,
              "condition": "IF grade10_passed == false"
            }
          ]
        }
      }
    },
    "grade12": {
      "newEntry": {
        "registrationType": "NEW_ENTRY",
        "requiredDocuments": [
          {
            "id": "grade11_transcript",
            "name": "Grade 11 Transcript",
            "type": "document",
            "description": "Official Grade 11 academic transcript",
            "mandatory": true,
            "format": ["PDF", "JPG", "PNG"],
            "maxSize": 5242880
          },
          {
            "id": "national_id",
            "name": "National ID",
            "type": "document",
            "description": "Student National Identification card",
            "mandatory": true,
            "format": ["PDF", "JPG", "PNG"],
            "maxSize": 5242880
          },
          {
            "id": "withdrawal_reason",
            "name": "Withdrawal Reason Document",
            "type": "document",
            "description": "Explanation letter for joining in Grade 12",
            "mandatory": true,
            "format": ["PDF", "JPG", "PNG"],
            "maxSize": 5242880
          },
          {
            "id": "profile_pic",
            "name": "Profile Picture",
            "type": "image",
            "description": "Student passport-sized photo",
            "mandatory": true,
            "format": ["JPG", "PNG"],
            "maxSize": 2097152
          },
          {
            "id": "guardian_pic",
            "name": "Guardian Picture",
            "type": "image",
            "description": "Guardian/Parent identification photo",
            "mandatory": true,
            "format": ["JPG", "PNG"],
            "maxSize": 2097152
          }
        ]
      },
      "senior": {
        "registrationType": "SENIOR",
        "description": "Continuing from Grade 11",
        "documentLogic": {
          "checkResults": {
            "description": "Validate student passed Grade 11",
            "condition": "IF (grade11_passed == true) THEN no_additional_docs_needed ELSE require_transcript"
          },
          "documentRequirements": [
            {
              "id": "profile_pic",
              "name": "Profile Picture",
              "type": "image",
              "description": "Student passport-sized photo",
              "mandatory": true,
              "format": ["JPG", "PNG"],
              "maxSize": 2097152,
              "condition": "always"
            },
            {
              "id": "guardian_pic",
              "name": "Guardian Picture",
              "type": "image",
              "description": "Guardian/Parent identification photo",
              "mandatory": true,
              "format": ["JPG", "PNG"],
              "maxSize": 2097152,
              "condition": "always"
            },
            {
              "id": "grade11_transcript",
              "name": "Grade 11 Transcript",
              "type": "document",
              "description": "Required if student did not pass Grade 11",
              "mandatory": true,
              "format": ["PDF", "JPG", "PNG"],
              "maxSize": 5242880,
              "condition": "IF grade11_passed == false"
            }
          ]
        }
      }
    }
  }
}
```

### 2.3 Student Registration Data Schema

```json
{
  "studentRegistration": {
    "id": "REG-[TIMESTAMP]-[RANDOM]",
    "submissionTimestamp": "2024-01-15T10:30:00Z",
    "status": "PENDING",
    "personalInfo": {
      "firstName": "Abebe",
      "middleName": "Hailu",
      "lastName": "Kebede",
      "dateOfBirth": "2007-05-20",
      "gender": "M",
      "nationalId": "12345678901",
      "email": "abebe.kebede@school.com",
      "phoneNumber": "+251911234567"
    },
    "academicInfo": {
      "requestedGrade": 10,
      "registrationType": "NEW_ENTRY",
      "previousGrade": 9,
      "previousSchool": "Previous School Name",
      "yearCompletedPreviousGrade": 2023,
      "previousGradeResults": {
        "passed": true,
        "gpa": 3.5,
        "totalScore": 85,
        "gradesPerSubject": {
          "mathematics": 82,
          "english": 88,
          "science": 85
        }
      }
    },
    "guardianInfo": {
      "firstName": "Hailu",
      "lastName": "Kebede",
      "relationship": "Father",
      "phoneNumber": "+251922345678",
      "email": "hailu.kebede@email.com",
      "address": "Addis Ababa, Bole District",
      "occupation": "Business Owner"
    },
    "documents": {
      "uploaded": [
        {
          "id": "doc-001",
          "documentType": "profile_pic",
          "originalFileName": "profile_photo.jpg",
          "fileSize": 1524800,
          "uploadedTimestamp": "2024-01-15T10:25:00Z",
          "status": "VERIFIED",
          "verificationNotes": "Clear, recent photo"
        },
        {
          "id": "doc-002",
          "documentType": "guardian_pic",
          "originalFileName": "guardian_photo.png",
          "fileSize": 1024000,
          "uploadedTimestamp": "2024-01-15T10:26:00Z",
          "status": "VERIFIED",
          "verificationNotes": "Valid ID photo"
        },
        {
          "id": "doc-003",
          "documentType": "national_id",
          "originalFileName": "national_id_scan.pdf",
          "fileSize": 3048000,
          "uploadedTimestamp": "2024-01-15T10:27:00Z",
          "status": "VERIFIED",
          "verificationNotes": "Clear scan, readable"
        },
        {
          "id": "doc-004",
          "documentType": "grade9_transcript",
          "originalFileName": "grade_9_transcript.pdf",
          "fileSize": 2048000,
          "uploadedTimestamp": "2024-01-15T10:28:00Z",
          "status": "VERIFIED",
          "verificationNotes": "Official school transcript"
        },
        {
          "id": "doc-005",
          "documentType": "withdrawal_reason",
          "originalFileName": "withdrawal_letter.pdf",
          "fileSize": 512000,
          "uploadedTimestamp": "2024-01-15T10:29:00Z",
          "status": "VERIFIED",
          "verificationNotes": "Proper explanation provided"
        }
      ],
      "pending": [],
      "missing": [],
      "uploadProgress": 100
    },
    "payment": {
      "registrationFee": {
        "amount": 1000,
        "currency": "ETB",
        "status": "PENDING",
        "dueDate": "2024-01-20",
        "paymentMethod": null,
        "transactionId": null,
        "paidDate": null,
        "paidAmount": 0,
        "balance": 1000
      },
      "paymentHistory": []
    },
    "registrarAssignment": {
      "assignedRegistrar": "reg-001",
      "registrarName": "Almaz Mengesha",
      "assignmentDate": "2024-01-15T11:00:00Z",
      "appointmentScheduled": false,
      "preferredAppointmentSlot": null,
      "appointmentDateTime": null,
      "appointmentStatus": "NOT_SCHEDULED"
    },
    "validation": {
      "documentValidation": {
        "status": "PASSED",
        "allRequiredDocuments": true,
        "checks": [
          {
            "check": "All required documents uploaded",
            "passed": true
          },
          {
            "check": "All documents within size limits",
            "passed": true
          },
          {
            "check": "All documents in correct format",
            "passed": true
          },
          {
            "check": "No corrupted files",
            "passed": true
          }
        ]
      },
      "academicValidation": {
        "status": "PASSED",
        "checks": [
          {
            "check": "Previous grade results available",
            "passed": true
          },
          {
            "check": "Grade progression valid",
            "passed": true
          },
          {
            "check": "Eligibility verified",
            "passed": true
          }
        ]
      },
      "paymentValidation": {
        "status": "PENDING",
        "checks": [
          {
            "check": "Payment received",
            "passed": false
          }
        ]
      }
    },
    "timeline": {
      "submittedAt": "2024-01-15T10:30:00Z",
      "documentsCompletedAt": "2024-01-15T10:29:00Z",
      "registrarAssignedAt": "2024-01-15T11:00:00Z",
      "appointmentScheduledAt": null,
      "paymentReceivedAt": null,
      "approvedAt": null,
      "rejectedAt": null,
      "enrolledAt": null
    },
    "approvalNotes": {
      "adminReview": null,
      "registrarNotes": null,
      "reasonForRejection": null
    }
  }
}
```

### 2.4 Registrar Schedule Schema

```json
{
  "registrarSchedule": {
    "registrarId": "reg-001",
    "registrarName": "Almaz Mengesha",
    "schedule": {
      "monday": {
        "available": true,
        "slots": [
          {
            "slotId": "slot-mon-001",
            "startTime": "09:00",
            "endTime": "09:30",
            "duration": 30,
            "capacity": 1,
            "booked": 0,
            "available": true
          },
          {
            "slotId": "slot-mon-002",
            "startTime": "09:30",
            "endTime": "10:00",
            "duration": 30,
            "capacity": 1,
            "booked": 1,
            "available": false
          },
          {
            "slotId": "slot-mon-003",
            "startTime": "10:00",
            "endTime": "10:30",
            "duration": 30,
            "capacity": 1,
            "booked": 0,
            "available": true
          },
          {
            "slotId": "slot-mon-004",
            "startTime": "14:00",
            "endTime": "14:30",
            "duration": 30,
            "capacity": 1,
            "booked": 0,
            "available": true
          },
          {
            "slotId": "slot-mon-005",
            "startTime": "14:30",
            "endTime": "15:00",
            "duration": 30,
            "capacity": 1,
            "booked": 1,
            "available": false
          }
        ]
      },
      "tuesday": {
        "available": true,
        "slots": []
      },
      "wednesday": {
        "available": true,
        "slots": []
      },
      "thursday": {
        "available": true,
        "slots": []
      },
      "friday": {
        "available": true,
        "slots": []
      },
      "saturday": {
        "available": false,
        "slots": []
      },
      "sunday": {
        "available": false,
        "slots": []
      }
    },
    "holidays": [
      {
        "date": "2024-01-25",
        "reason": "National Holiday",
        "allDayOff": true
      }
    ],
    "weeklyCapacity": 40,
    "weeklyBooked": 8,
    "weeklyAvailable": 32
  }
}
```

### 2.5 Payment Processing Schema

```json
{
  "paymentTransaction": {
    "transactionId": "TRX-[TIMESTAMP]-[RANDOM]",
    "registrationId": "REG-[ID]",
    "studentId": "STU-[ID]",
    "amount": 1000,
    "currency": "ETB",
    "paymentMethod": "CBE",
    "paymentProvider": "Telebirr",
    "status": "COMPLETED",
    "paymentMethods": [
      {
        "id": "payment-cbe",
        "name": "CBE (Commercial Bank of Ethiopia)",
        "provider": "Telebirr",
        "accountNumber": "1000123456789",
        "accountName": "Mechara Secondary School",
        "processingTime": "Instant",
        "supportedVia": ["Mobile", "Bank Branch", "ATM"]
      },
      {
        "id": "payment-siinqe",
        "name": "Siinqe",
        "provider": "Siinqe",
        "accountNumber": "mechara-school",
        "accountName": "Mechara Secondary School",
        "processingTime": "Instant",
        "supportedVia": ["Mobile App", "Web"]
      },
      {
        "id": "payment-awash",
        "name": "Awash Bank",
        "provider": "AwashBank Mobile",
        "accountNumber": "1000098765432",
        "accountName": "Mechara Secondary School",
        "processingTime": "1-2 hours",
        "supportedVia": ["Mobile", "Bank Branch"]
      },
      {
        "id": "payment-cbo",
        "name": "CBO (Community-Based Organization)",
        "provider": "Local CBO",
        "location": "CBO Office, Addis Ababa",
        "processingTime": "24 hours",
        "supportedVia": ["In-Person", "Phone Transfer"]
      }
    ],
    "transactionDetails": {
      "initiatedAt": "2024-01-20T14:30:00Z",
      "processedAt": "2024-01-20T14:31:15Z",
      "completedAt": "2024-01-20T14:31:15Z",
      "referenceNumber": "CBE-TRX-1234567890",
      "confirmationCode": "CONF-ABC123DEF456"
    },
    "receiptDetails": {
      "receiptNumber": "RCP-2024-001234",
      "paidBy": "Hailu Kebede",
      "paidOn": "2024-01-20",
      "receiptUrl": "/receipts/RCP-2024-001234.pdf",
      "downloadable": true
    },
    "status": "VERIFIED"
  }
}
```

---

## 3. Registration Workflow State Machine

```json
{
  "registrationStates": {
    "DRAFT": {
      "description": "Form in progress, not submitted",
      "allowedTransitions": ["SUBMITTED"],
      "requiredFields": []
    },
    "SUBMITTED": {
      "description": "Form submitted, awaiting document upload",
      "allowedTransitions": ["DOCUMENT_UPLOAD_IN_PROGRESS", "PENDING_APPROVAL", "REJECTED"],
      "requiredFields": ["personalInfo", "academicInfo", "guardianInfo"]
    },
    "DOCUMENT_UPLOAD_IN_PROGRESS": {
      "description": "Student uploading required documents",
      "allowedTransitions": ["PENDING_APPROVAL", "INCOMPLETE"],
      "requiredFields": ["documents"]
    },
    "INCOMPLETE": {
      "description": "Missing required documents",
      "allowedTransitions": ["DOCUMENT_UPLOAD_IN_PROGRESS", "REJECTED"],
      "requiredFields": ["documents"]
    },
    "PENDING_APPROVAL": {
      "description": "Documents complete, awaiting admin/registrar approval",
      "allowedTransitions": ["APPROVED", "REJECTED", "NEEDS_REVISION"],
      "requiredFields": ["documents", "validation"]
    },
    "NEEDS_REVISION": {
      "description": "Documents need revision before approval",
      "allowedTransitions": ["DOCUMENT_UPLOAD_IN_PROGRESS", "REJECTED"],
      "requiredFields": ["approvalNotes.registrarNotes"]
    },
    "APPROVED": {
      "description": "Documents approved, awaiting payment",
      "allowedTransitions": ["PAYMENT_IN_PROGRESS", "PAYMENT_RECEIVED", "PAYMENT_OVERDUE"],
      "requiredFields": ["payment"]
    },
    "PAYMENT_IN_PROGRESS": {
      "description": "Payment being processed",
      "allowedTransitions": ["PAYMENT_RECEIVED", "PAYMENT_FAILED"],
      "requiredFields": ["payment.transactionId"]
    },
    "PAYMENT_RECEIVED": {
      "description": "Payment confirmed, ready for enrollment",
      "allowedTransitions": ["ENROLLED"],
      "requiredFields": ["payment.paidDate"]
    },
    "ENROLLED": {
      "description": "Student successfully enrolled in the system",
      "allowedTransitions": [],
      "requiredFields": []
    },
    "REJECTED": {
      "description": "Application rejected",
      "allowedTransitions": ["RESUBMIT"],
      "requiredFields": ["approvalNotes.reasonForRejection"]
    },
    "RESUBMIT": {
      "description": "Resubmitting after rejection",
      "allowedTransitions": ["PENDING_APPROVAL"],
      "requiredFields": ["documents"]
    }
  }
}
```

---

## 4. Validation Rules Engine

```json
{
  "validationRules": {
    "gradeProgression": [
      {
        "rule": "VALID_SEQUENCE",
        "description": "Student's requested grade must follow valid progression",
        "logic": "requestedGrade IN [8, 9, 10, 11, 12]",
        "severity": "ERROR",
        "blocking": true
      },
      {
        "rule": "NEW_ENTRY_GRADE_9",
        "description": "Grade 9 can only be NEW_ENTRY",
        "logic": "IF grade == 9 THEN registrationType == NEW_ENTRY",
        "severity": "ERROR",
        "blocking": true
      },
      {
        "rule": "SENIOR_GRADE_PROGRESSION",
        "description": "Senior students must have completed previous grade",
        "logic": "IF registrationType == SENIOR THEN previousGrade == (requestedGrade - 1)",
        "severity": "ERROR",
        "blocking": true
      }
    ],
    "documentValidation": [
      {
        "rule": "MANDATORY_DOCUMENT",
        "description": "All mandatory documents must be uploaded",
        "logic": "FOR EACH mandatoryDoc: uploaded.includes(mandatoryDoc)",
        "severity": "ERROR",
        "blocking": true
      },
      {
        "rule": "FILE_SIZE_LIMIT",
        "description": "Each document must not exceed size limit",
        "logic": "FOR EACH doc: fileSize <= doc.maxSize",
        "severity": "ERROR",
        "blocking": true
      },
      {
        "rule": "FILE_FORMAT",
        "description": "Document format must be in allowed list",
        "logic": "FOR EACH doc: fileFormat IN doc.allowedFormats",
        "severity": "ERROR",
        "blocking": true
      },
      {
        "rule": "NO_CORRUPTED_FILES",
        "description": "Files must not be corrupted",
        "logic": "FOR EACH doc: integrity_check(doc) == PASS",
        "severity": "ERROR",
        "blocking": true
      },
      {
        "rule": "CONDITIONAL_DOCUMENTS",
        "description": "Some documents required based on conditions",
        "logic": "IF grade == 10 AND registrationType == SENIOR AND grade9_passed == true THEN withdrawal_reason NOT_REQUIRED",
        "severity": "ERROR",
        "blocking": true
      }
    ],
    "paymentValidation": [
      {
        "rule": "FEE_AMOUNT",
        "description": "Fee must match configured amount",
        "logic": "payment.amount == GRADE_FEE[requestedGrade]",
        "severity": "ERROR",
        "blocking": true
      },
      {
        "rule": "PAYMENT_METHOD_VALID",
        "description": "Payment method must be in allowed list",
        "logic": "paymentMethod IN ['CBE', 'Siinqe', 'Awash', 'CBO']",
        "severity": "ERROR",
        "blocking": true
      },
      {
        "rule": "PAYMENT_COMPLETED",
        "description": "Payment must be completed before enrollment",
        "logic": "IF status == PAYMENT_RECEIVED THEN transaction.status == VERIFIED",
        "severity": "ERROR",
        "blocking": true
      }
    ]
  }
}
```

---

## 5. Mobile Responsive Design Structure

```json
{
  "responsiveDesign": {
    "breakpoints": {
      "mobile": {
        "maxWidth": 576,
        "layout": "single-column",
        "navigation": "bottom-drawer",
        "formLayout": "stacked",
        "imageUpload": "camera-optimized",
        "payments": "mobile-first"
      },
      "tablet": {
        "maxWidth": 768,
        "layout": "two-column",
        "navigation": "side-drawer",
        "formLayout": "two-column-fields",
        "imageUpload": "standard",
        "payments": "standard"
      },
      "desktop": {
        "maxWidth": "unlimited",
        "layout": "multi-column",
        "navigation": "permanent-sidebar",
        "formLayout": "flexible",
        "imageUpload": "drag-drop",
        "payments": "full-featured"
      }
    },
    "mobileOptimizations": {
      "formInputs": {
        "size": "touch-friendly (min 44px height)",
        "spacing": "increased-gap",
        "labels": "above-input",
        "errors": "inline-below",
        "instructions": "collapsible"
      },
      "documentUpload": {
        "mobile": "camera, gallery, file browser",
        "tablet": "camera, gallery, file browser, drag-drop",
        "desktop": "camera, gallery, file browser, drag-drop"
      },
      "paymentFlow": {
        "mobile": "payment-link, qr-code, mobile-wallet",
        "tablet": "payment-link, qr-code, mobile-wallet",
        "desktop": "payment-link, qr-code, mobile-wallet, bank-transfer"
      },
      "navigation": {
        "mobile": "tab-bar-at-bottom",
        "tablet": "floating-fab",
        "desktop": "sidebar"
      }
    }
  }
}
```

---

## 6. Data Storage Structure (localStorage)

```json
{
  "storageSchema": {
    "registrations": {
      "key": "mssms_registrations",
      "structure": "Array of studentRegistration objects",
      "indexes": ["id", "status", "requestedGrade", "submissionTimestamp"]
    },
    "registrationConfigs": {
      "key": "mssms_reg_config",
      "structure": "Single registrationConfig object",
      "cache": true,
      "cacheExpiry": "never"
    },
    "documentRequirements": {
      "key": "mssms_doc_requirements",
      "structure": "documentRequirements object",
      "cache": true,
      "cacheExpiry": "never"
    },
    "registrarSchedules": {
      "key": "mssms_registrar_schedules",
      "structure": "Array of registrarSchedule objects",
      "indexes": ["registrarId", "registrarName"]
    },
    "paymentTransactions": {
      "key": "mssms_payment_transactions",
      "structure": "Array of paymentTransaction objects",
      "indexes": ["transactionId", "registrationId", "status"]
    },
    "uploadedDocuments": {
      "key": "mssms_uploaded_documents",
      "structure": "Array of uploaded file metadata",
      "note": "Actual files stored in IndexedDB for larger capacity"
    }
  }
}
```

---

## 7. Integration Points

### 7.1 API Endpoints (For Future Backend)

```json
{
  "apiEndpoints": {
    "registration": {
      "POST /api/registrations": "Submit new registration",
      "GET /api/registrations/:id": "Get registration details",
      "PUT /api/registrations/:id": "Update registration",
      "GET /api/registrations": "List all registrations (admin only)"
    },
    "documents": {
      "POST /api/documents/upload": "Upload document file",
      "GET /api/documents/:registrationId": "List documents for registration",
      "DELETE /api/documents/:documentId": "Delete uploaded document"
    },
    "validation": {
      "POST /api/validate/documents": "Server-side document validation",
      "POST /api/validate/academic": "Academic eligibility check",
      "POST /api/validate/grade-progression": "Grade progression validation"
    },
    "payment": {
      "POST /api/payments/initiate": "Initiate payment",
      "GET /api/payments/:transactionId": "Check payment status",
      "POST /api/payments/webhook": "Payment provider webhook"
    },
    "scheduler": {
      "GET /api/registrars/:registrarId/schedule": "Get registrar availability",
      "POST /api/appointments": "Book appointment",
      "GET /api/appointments/:appointmentId": "Get appointment details"
    }
  }
}
```

---

## 8. Implementation Priority & Phases

### Phase 1: Core Registration (Weeks 1-2)
- [ ] Registration form with grade selection
- [ ] Document requirements logic
- [ ] Form validation
- [ ] localStorage persistence

### Phase 2: Document Management (Weeks 3-4)
- [ ] Document upload interface
- [ ] File validation (size, format, corruption)
- [ ] Progress tracking
- [ ] Mobile camera support

### Phase 3: Registrar Scheduling (Weeks 5-6)
- [ ] Registrar schedule management
- [ ] Appointment booking UI
- [ ] Calendar interface
- [ ] Notification system

### Phase 4: Payment Processing (Weeks 7-8)
- [ ] Payment method integration
- [ ] Transaction tracking
- [ ] Receipt generation
- [ ] Mobile payment optimization

### Phase 5: Admin Dashboard (Weeks 9-10)
- [ ] Registration approval UI
- [ ] Document review interface
- [ ] Validation override capability
- [ ] Payment verification

### Phase 6: Mobile Optimization & Testing (Weeks 11-12)
- [ ] Responsive design refinement
- [ ] Cross-device testing
- [ ] Performance optimization
- [ ] Accessibility compliance

---

## 9. Key Considerations

### 9.1 Error Handling
- Duplicate registration prevention
- Network failure recovery
- Document upload retry logic
- Payment transaction reconciliation

### 9.2 Security
- Input validation on all forms
- File type verification (not just extension)
- Payment data encryption
- Rate limiting on API endpoints

### 9.3 User Experience
- Progress indication for multi-step forms
- Auto-save functionality
- Clear error messages
- Success confirmations
- Receipt downloads

### 9.4 Performance
- Lazy load document requirements
- Cache configuration data
- Optimize file uploads (compression)
- Pagination for large lists

### 9.5 Scalability
- Separate document storage (could use cloud storage)
- Payment provider abstraction layer
- Asynchronous document processing
- Queue for payment verification

---

## 10. Testing Strategy

### Unit Tests
- Document requirement validation rules
- Grade progression logic
- Payment amount calculation
- File size/format validation

### Integration Tests
- End-to-end registration flow
- Document upload pipeline
- Payment processing workflow
- Registrar appointment booking

### User Acceptance Tests
- All 5 user scenarios (Grade 9, 10 New, 10 Senior, 11, 12)
- Mobile responsiveness
- Payment provider integrations
- Offline capability

---

## Conclusion

This JSON schema provides a complete, production-ready structure for implementing a complex student registration system. The modular design allows for incremental implementation while maintaining data consistency and supporting future backend integration.
