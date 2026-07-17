-- =====================================================
-- MASTER DATA
-- =====================================================

-- Company

INSERT INTO company (
    id,
    name,
    created_by,
    updated_by
)
VALUES (
    1,
    'PT Nusantara Digital',
    1,
    1
);

-- Branch

INSERT INTO company_branch (
    id,
    company_id,
    name,
    location,
    created_by,
    updated_by
)
VALUES
(
    1,
    1,
    'Jakarta HQ',
    'Jakarta',
    1,
    1
),
(
    2,
    1,
    'Bandung Office',
    'Bandung',
    1,
    1
);

-- Department

INSERT INTO company_departement (
    id,
    company_id,
    name,
    head_of_departement,
    created_by,
    updated_by
)
VALUES
(
    1,
    1,
    'IT',
    NULL,
    1,
    1
),
(
    2,
    1,
    'Human Resources',
    NULL,
    1,
    1
),
(
    3,
    1,
    'Finance',
    NULL,
    1,
    1
);

-- Position

INSERT INTO company_position (
    id,
    company_id,
    departement_id,
    name,
    created_by,
    updated_by
)
VALUES
(
    1,
    1,
    1,
    'QA Engineer',
    1,
    1
),
(
    2,
    1,
    1,
    'Backend Engineer',
    1,
    1
),
(
    3,
    1,
    2,
    'HR Specialist',
    1,
    1
),
(
    4,
    1,
    3,
    'Finance Staff',
    1,
    1
);

-- Role

INSERT INTO company_role (
    id,
    company_id,
    name,
    permissions,
    created_by,
    updated_by
)
VALUES
(
    1,
    1,
    'Administrator',
    1,
    1,
    1
),
(
    2,
    1,
    'Manager',
    2,
    1,
    1
),
(
    3,
    1,
    'Employee',
    3,
    1,
    1
);

-- =====================================================
-- USER DATA
-- =====================================================

INSERT INTO "user" (
    id,
    email,
    first_name,
    last_name,
    gender,
    address,
    birth_place,
    birth_date,
    phone_number,
    citizen_id,
    postal_code,
    blood_type,
    marital_status,
    created_by,
    updated_by
)
VALUES
(
    1,
    'sarah.pratama@nusantaradigital.com',
    'Sarah',
    'Pratama',
    'female',
    'Jl. Melati No. 12',
    'Jakarta',
    '1998-05-10',
    '081234567890',
    '3173011234567890',
    '10110',
    'O',
    'single',
    1,
    1
),
(
    2,
    'andi.wijaya@nusantaradigital.com',
    'Andi',
    'Wijaya',
    'male',
    'Jl. Kenanga No. 20',
    'Bandung',
    '1996-08-21',
    '081234567891',
    '3275011234567891',
    '40211',
    'A',
    'married',
    1,
    1
),
(
    3,
    'rina.putri@nusantaradigital.com',
    'Rina',
    'Putri',
    'female',
    'Jl. Mawar No. 5',
    'Bogor',
    '1997-03-18',
    '081234567892',
    '3271011234567892',
    '16111',
    'B',
    'single',
    1,
    1
),
(
    4,
    'budi.santoso@nusantaradigital.com',
    'Budi',
    'Santoso',
    'male',
    'Jl. Anggrek No. 9',
    'Bekasi',
    '1995-11-02',
    '081234567893',
    '3174011234567893',
    '17111',
    'AB',
    'married',
    1,
    1
),
(
    5,
    'dimas.saputra@nusantaradigital.com',
    'Dimas',
    'Saputra',
    'male',
    'Jl. Flamboyan No. 15',
    'Depok',
    '1999-01-30',
    '081234567894',
    '3276011234567894',
    '16411',
    'O',
    'single',
    1,
    1
);

-- =====================================================
-- EMPLOYEE DATA
-- =====================================================

INSERT INTO employee (
    id,
    user_id,
    nip,
    company_id,
    departement_id,
    branch_id,
    position_id,
    roles,
    status,
    salary,
    joined_at,
    created_by,
    updated_by
)
VALUES
(
    1,
    1,
    20260001,
    1,
    1,
    1,
    1,
    ARRAY[3],
    'ACTIVE',
    8000000,
    '2026-01-06',
    1,
    1
),
(
    2,
    2,
    20260002,
    1,
    1,
    1,
    2,
    ARRAY[2],
    'ACTIVE',
    12000000,
    '2025-09-15',
    1,
    1
),
(
    3,
    3,
    20260003,
    1,
    2,
    1,
    3,
    ARRAY[1],
    'ACTIVE',
    9000000,
    '2025-11-01',
    1,
    1
),
(
    4,
    4,
    20260004,
    1,
    3,
    2,
    4,
    ARRAY[3],
    'ACTIVE',
    8500000,
    '2024-03-20',
    1,
    1
),
(
    5,
    5,
    20260005,
    1,
    1,
    2,
    1,
    ARRAY[3],
    'PROBATION',
    7000000,
    '2026-06-01',
    1,
    1
);

-- =====================================================
-- UPDATE DEPARTMENT HEAD
-- =====================================================

UPDATE company_departement
SET head_of_departement = 1
WHERE id = 1;

UPDATE company_departement
SET head_of_departement = 3
WHERE id = 2;

UPDATE company_departement
SET head_of_departement = 4
WHERE id = 3;

-- =====================================================
-- AUTH
-- =====================================================

INSERT INTO auth (
    user_id,
    password,
    created_by,
    updated_by
)
VALUES
(1, '$2b$12$dummyhash_sarah', 1, 1),
(2, '$2b$12$dummyhash_andi', 1, 1),
(3, '$2b$12$dummyhash_rina', 1, 1),
(4, '$2b$12$dummyhash_budi', 1, 1),
(5, '$2b$12$dummyhash_dimas', 1, 1);

-- =====================================================
-- SESSION
-- =====================================================

INSERT INTO session (
    id,
    user_id,
    client,
    created_by,
    updated_by,
    expired_at
)
VALUES
(
    1,
    1,
    'Chrome Windows',
    1,
    1,
    CURRENT_TIMESTAMP + INTERVAL '7 days'
),
(
    2,
    2,
    'Edge Windows',
    1,
    1,
    CURRENT_TIMESTAMP + INTERVAL '7 days'
),
(
    3,
    3,
    'Safari macOS',
    1,
    1,
    CURRENT_TIMESTAMP + INTERVAL '7 days'
),
(
    4,
    4,
    'Android Mobile',
    1,
    1,
    CURRENT_TIMESTAMP + INTERVAL '7 days'
),
(
    5,
    5,
    'iPhone Safari',
    1,
    1,
    CURRENT_TIMESTAMP + INTERVAL '7 days'
);

-- =====================================================
-- ATTENDANCE DATA
-- =====================================================

INSERT INTO attendance (
    id,
    employee_id,
    type,
    notes,
    attachment,
    created_at,
    created_by,
    updated_at,
    updated_by
)
VALUES

-- Sarah
(
    1,
    1,
    'clock-in',
    'On time',
    'attendance_001.jpg',
    '2026-07-15 08:01:15+07',
    1,
    '2026-07-15 08:01:15+07',
    1
),
(
    2,
    1,
    'clock-out',
    'Finished work',
    'attendance_002.jpg',
    '2026-07-15 17:02:40+07',
    1,
    '2026-07-15 17:02:40+07',
    1
),

-- Andi
(
    3,
    2,
    'clock-in',
    'WFH',
    'attendance_003.jpg',
    '2026-07-15 07:55:03+07',
    1,
    '2026-07-15 07:55:03+07',
    1
),

-- Rina
(
    4,
    3,
    'clock-in',
    'Office',
    'attendance_004.jpg',
    '2026-07-15 08:10:10+07',
    1,
    '2026-07-15 08:10:10+07',
    1
),
(
    5,
    3,
    'clock-out',
    'Finished work',
    'attendance_005.jpg',
    '2026-07-15 17:05:18+07',
    1,
    '2026-07-15 17:05:18+07',
    1
),

-- Dimas Day 1
(
    6,
    5,
    'clock-in',
    'Probation',
    'attendance_006.jpg',
    '2026-07-14 08:04:45+07',
    1,
    '2026-07-14 08:04:45+07',
    1
),
(
    7,
    5,
    'clock-out',
    'Finished work',
    'attendance_007.jpg',
    '2026-07-14 17:08:51+07',
    1,
    '2026-07-14 17:08:51+07',
    1
),

-- Dimas Day 2
(
    8,
    5,
    'clock-in',
    'Second day',
    'attendance_008.jpg',
    '2026-07-15 08:00:20+07',
    1,
    '2026-07-15 08:00:20+07',
    1
),
(
    9,
    5,
    'clock-out',
    'Finished work',
    'attendance_009.jpg',
    '2026-07-15 17:01:32+07',
    1,
    '2026-07-15 17:01:32+07',
    1
);

-- =====================================================
-- UPDATE REFERENCES
-- =====================================================

...
