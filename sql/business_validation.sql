-- =====================================================
-- BV-001
-- Verify employee must have mandatory personal information
-- =====================================================

SELECT
    e.id AS employee_id,
    u.id AS user_id,
    u.email,
    u.first_name,
    u.gender,
    u.marital_status
FROM employee e
JOIN "user" u
    ON e.user_id = u.id
WHERE
    u.email IS NULL
    OR u.first_name IS NULL
    OR u.gender IS NULL
    OR u.marital_status IS NULL;

-- =====================================================
-- BV-002
-- Verify employee cannot have duplicate email
-- =====================================================

SELECT
    email,
    COUNT(*) AS duplicate_count
FROM "user"
GROUP BY email
HAVING COUNT(*) > 1;

-- =====================================================
-- BV-003
-- Verify every employee is linked to a valid user account
-- =====================================================

SELECT
    e.id AS employee_id,
    e.user_id
FROM employee e
LEFT JOIN "user" u
    ON e.user_id = u.id
WHERE u.id IS NULL;

-- =====================================================
-- BV-004
-- Verify employee birth date cannot be future date
-- =====================================================

SELECT
    id,
    first_name,
    birth_date
FROM "user"
WHERE birth_date > CURRENT_TIMESTAMP;

-- =====================================================
-- BV-005
-- Verify employee hire date cannot be future date
-- =====================================================

SELECT
    id,
    joined_at
FROM employee
WHERE joined_at > CURRENT_TIMESTAMP;

-- =====================================================
-- BV-006
-- Verify employee NIP is unique
-- =====================================================

SELECT
    company_id,
    nip,
    COUNT(*)
FROM employee
GROUP BY company_id, nip
HAVING COUNT(*) > 1;

-- =====================================================
-- BV-007
-- Verify employee gender contains valid ENUM values
-- =====================================================

SELECT DISTINCT gender
FROM "user";

-- =====================================================
-- BV-008
-- Verify employee blood type contains valid ENUM values
-- =====================================================

SELECT DISTINCT blood_type
FROM "user";

-- =====================================================
-- BV-009
-- Verify employee marital status contains valid ENUM values
-- =====================================================

SELECT DISTINCT marital_status
FROM "user";

-- =====================================================
-- BV-010
-- Verify employee belongs to valid company
-- =====================================================

SELECT
    e.id AS employee_id,
    e.company_id
FROM employee e
LEFT JOIN company c
    ON e.company_id = c.id
WHERE c.id IS NULL;

-- =====================================================
-- BV-011
-- Verify employee belongs to valid department
-- =====================================================

SELECT
    e.id AS employee_id,
    e.departement_id
FROM employee e
LEFT JOIN company_departement d
    ON e.departement_id = d.id
WHERE e.departement_id IS NOT NULL
AND d.id IS NULL;

-- =====================================================
-- BV-012
-- Verify employee belongs to valid branch
-- =====================================================

SELECT
    e.id AS employee_id,
    e.branch_id
FROM employee e
LEFT JOIN company_branch b
    ON e.branch_id = b.id
WHERE e.branch_id IS NOT NULL
AND b.id IS NULL;

-- =====================================================
-- BV-013
-- Verify employee belongs to valid position
-- =====================================================

SELECT
    e.id AS employee_id,
    e.position_id
FROM employee e
LEFT JOIN company_position p
    ON e.position_id = p.id
WHERE e.position_id IS NOT NULL
AND p.id IS NULL;

-- =====================================================
-- BV-014
-- Verify employee role assignment is valid
-- =====================================================

SELECT
    e.id AS employee_id,
    role_id
FROM employee e
CROSS JOIN LATERAL unnest(e.roles) AS role_id
LEFT JOIN company_role r
    ON role_id = r.id
WHERE r.id IS NULL;

-- =====================================================
-- BV-015
-- Verify attendance belongs to valid employee
-- =====================================================

SELECT
    a.id AS attendance_id,
    a.employee_id
FROM attendance a
LEFT JOIN employee e
    ON a.employee_id = e.id
WHERE e.id IS NULL;

-- =====================================================
-- BV-016
-- Verify attendance type contains valid ENUM values
-- =====================================================

SELECT DISTINCT type
FROM attendance
EXCEPT
SELECT enumlabel::attendance_type
FROM pg_enum
JOIN pg_type
    ON pg_enum.enumtypid = pg_type.oid
WHERE typname = 'attendance_type';

-- =====================================================
-- BV-017
-- Verify attendance attachment is provided
-- =====================================================

SELECT
    id,
    employee_id,
    attachment
FROM attendance
WHERE attachment IS NULL
   OR attachment = '';

-- =====================================================
-- BV-018
-- Verify attendance timestamp is valid
-- =====================================================

SELECT
    id,
    created_at
FROM attendance
WHERE created_at > CURRENT_TIMESTAMP;

-- =====================================================
-- BV-019
-- Verify employee cannot have duplicate attendance record
-- =====================================================

SELECT
    employee_id,
    created_at,
    COUNT(*) AS total
FROM attendance
GROUP BY employee_id, created_at
HAVING COUNT(*) > 1;

-- =====================================================
-- BV-020
-- Verify authentication record belongs to valid user
-- =====================================================

SELECT
    a.entity_id AS auth_id,
    a.user_id
FROM auth a
LEFT JOIN "user" u
    ON a.user_id = u.id
WHERE u.id IS NULL;

-- =====================================================
-- BV-021
-- Verify user has authentication record
-- =====================================================

SELECT
    u.id AS user_id,
    u.email
FROM "user" u
LEFT JOIN auth a
    ON u.id = a.user_id
WHERE a.user_id IS NULL;

-- =====================================================
-- BV-022
-- Verify user has only one authentication record
-- =====================================================

SELECT
    user_id,
    COUNT(*) AS total_auth
FROM auth
GROUP BY user_id
HAVING COUNT(*) > 1;

-- =====================================================
-- BV-023
-- Verify session belongs to valid user
-- =====================================================

SELECT
    s.id AS session_id,
    s.user_id
FROM session s
LEFT JOIN "user" u
    ON s.user_id = u.id
WHERE u.id IS NULL;

-- =====================================================
-- BV-024
-- Verify session expiration date is valid
-- =====================================================

SELECT
    id,
    created_at,
    expired_at
FROM session
WHERE expired_at <= created_at;

-- =====================================================
-- BV-025
-- Verify company name cannot be empty
-- =====================================================

SELECT
    id,
    name
FROM company
WHERE name IS NULL
   OR name = '';

-- =====================================================
-- BV-026
-- Verify company branch belongs to valid company
-- =====================================================

SELECT
    cb.id AS branch_id,
    cb.company_id
FROM company_branch cb
LEFT JOIN company c
    ON cb.company_id = c.id
WHERE c.id IS NULL;

-- =====================================================
-- BV-027
-- Verify department belongs to valid company
-- =====================================================

SELECT
    cd.id AS department_id,
    cd.company_id
FROM company_departement cd
LEFT JOIN company c
    ON cd.company_id = c.id
WHERE c.id IS NULL;

-- =====================================================
-- BV-028
-- Verify position belongs to valid department
-- =====================================================

SELECT
    cp.id AS position_id,
    cp.departement_id
FROM company_position cp
LEFT JOIN company_departement cd
    ON cp.departement_id = cd.id
WHERE cd.id IS NULL;

-- =====================================================
-- BV-029
-- Verify role belongs to valid company
-- =====================================================

SELECT
    cr.id AS role_id,
    cr.company_id
FROM company_role cr
LEFT JOIN company c
    ON cr.company_id = c.id
WHERE c.id IS NULL;

