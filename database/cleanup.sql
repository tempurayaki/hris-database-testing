-- =====================================================
-- CLEANUP DATABASE
-- =====================================================

TRUNCATE TABLE
    attendance,
    auth,
    session,
    employee,
    "user",
    company_role,
    company_position,
    company_departement,
    company_branch,
    company
RESTART IDENTITY CASCADE;