-- =====================================================
-- SV-001
-- Verify employee primary key
-- =====================================================

SELECT
    *
FROM
    information_schema.tables
WHERE
    table_schema = 'public'

-- =====================================================
-- SV-002
-- Verify all required ENUM types are created
-- =====================================================

SELECT 
    typname AS enum_name
FROM pg_type
WHERE typtype = 'e'
ORDER BY typname;

-- =====================================================
-- SV-003
-- Verify all tables have Primary Key constraints
-- =====================================================

SELECT
    tc.table_name,
    kcu.column_name
FROM information_schema.table_constraints tc
JOIN information_schema.key_column_usage kcu
ON tc.constraint_name = kcu.constraint_name
WHERE tc.constraint_type = 'PRIMARY KEY'
ORDER BY tc.table_name;

-- =====================================================
-- SV-004
-- Verify BIGSERIAL columns are backed by sequences
-- =====================================================

SELECT
    table_name,
    column_name,
    column_default
FROM information_schema.columns
WHERE column_default LIKE 'nextval%';

-- =====================================================
-- SV-005
-- Verify created_at columns have CURRENT_TIMESTAMP default value
-- =====================================================

SELECT
    table_name,
    column_name,
    column_default
FROM information_schema.columns
WHERE column_name = 'created_at';

-- =====================================================
-- SV-006
-- Verify updated_at columns have CURRENT_TIMESTAMP default value
-- =====================================================

SELECT
    table_name,
    column_name,
    column_default
FROM information_schema.columns
WHERE column_name = 'updated_at';

-- =====================================================
-- SV-007
-- Verify timestamp columns use TIMESTAMPTZ
-- =====================================================

SELECT
    table_name,
    column_name,
    data_type
FROM information_schema.columns
WHERE data_type LIKE 'timestamp%'
ORDER BY table_name;

-- =====================================================
-- SV-008
-- Verify nullable columns allow NULL values
-- =====================================================

SELECT
    table_name,
    column_name,
    is_nullable
FROM information_schema.columns
WHERE is_nullable = 'YES'
ORDER BY table_name;

-- =====================================================
-- SV-009
-- Verify employee table foreign key relationships
-- =====================================================

SELECT
    tc.table_name,
    kcu.column_name,
    ccu.table_name AS referenced_table,
    ccu.column_name AS referenced_column
FROM information_schema.table_constraints tc
JOIN information_schema.key_column_usage kcu
    ON tc.constraint_name = kcu.constraint_name
JOIN information_schema.constraint_column_usage ccu
    ON tc.constraint_name = ccu.constraint_name
WHERE tc.table_name = 'employee'
AND tc.constraint_type = 'FOREIGN KEY';

-- =====================================================
-- SV-010
-- Verify roles column uses BIGINT ARRAY
-- =====================================================

 SELECT
    column_name,
    data_type,
    udt_name
FROM information_schema.columns
WHERE table_name = 'employee'
AND column_name = 'roles';

-- =====================================================
-- SV-011
-- Verify salary column uses NUMERIC data type
-- =====================================================

SELECT
    column_name,
    data_type
FROM information_schema.columns
WHERE table_name = 'employee'
AND column_name = 'salary';

-- =====================================================
-- SV-012
-- Verify user table mandatory columns are NOT NULL
-- =====================================================

SELECT
    column_name,
    is_nullable
FROM information_schema.columns
WHERE table_name = 'user'
AND is_nullable = 'NO';

-- =====================================================
-- SV-013
-- Verify gender column uses gender ENUM
-- =====================================================

SELECT
    column_name,
    udt_name
FROM information_schema.columns
WHERE column_name = 'gender';

-- =====================================================
-- SV-014
-- Verify blood_type column uses blood_type ENUM
-- =====================================================

SELECT
    column_name,
    udt_name
FROM information_schema.columns
WHERE column_name = 'blood_type';

-- =====================================================
-- SV-025
-- Verify marital_status column uses marital_status ENUM
-- =====================================================

SELECT
    column_name,
    udt_name
FROM information_schema.columns
WHERE column_name = 'marital_status';

-- =====================================================
-- SV-016
-- Verify company table mandatory columns are NOT NULL
-- =====================================================

SELECT
    column_name,
    is_nullable
FROM information_schema.columns
WHERE table_name = 'company'
AND is_nullable = 'NO';

-- =====================================================
-- SV-017
-- Verify attendance table mandatory columns are NOT NULL
-- =====================================================

SELECT
    column_name,
    is_nullable
FROM information_schema.columns
WHERE table_name = 'attendance'
AND is_nullable = 'NO';

-- =====================================================
-- SV-018
-- Verify attendance type column uses attendance_type ENUM
-- =====================================================

SELECT
    column_name,
    udt_name
FROM information_schema.columns
WHERE table_name = 'attendance'
AND column_name = 'type';