# HRIS Database Testing

A database testing project for a Human Resource Information System (HRIS) database using PostgreSQL.

This project focuses on validating database structure, data integrity, and business rules through SQL-based testing.

---

## Project Overview

This project simulates database testing activities performed by a QA Engineer, covering:

- Database schema validation
- Constraint validation
- Referential integrity testing
- Business rule validation
- Data quality validation

The testing is performed on an HRIS database containing employee management, authentication, attendance, and company organization modules.

---

## Tech Stack

| Technology | Purpose |
|------------|---------|
| PostgreSQL | Database system |
| Docker | Database environment setup |
| DBeaver | Database management and SQL execution |
| SQL | Test query implementation |
| GitHub | Version control and documentation |

---

# Testing Scope

## 1. Schema Validation

Schema validation ensures that the database structure follows the expected design and requirements.

### Validation Coverage

| Category | Validation |
|-----------|------------|
| Table Structure | Verify required tables are created |
| Primary Key | Verify primary key constraints exist |
| Foreign Key | Verify table relationships are properly defined |
| Data Type | Verify column data types |
| ENUM | Verify ENUM types are correctly implemented |
| Default Value | Verify timestamp default values |
| Sequence | Verify BIGSERIAL sequence generation |
| Nullable Rules | Verify nullable and NOT NULL columns |

Example scenarios:

- Verify required ENUM types are created
- Verify BIGSERIAL columns are backed by sequences
- Verify created_at columns have CURRENT_TIMESTAMP default value
- Verify employee table foreign key relationships
- Verify timestamp columns use TIMESTAMPTZ

---

## 2. Business Rule Validation

Business validation ensures that stored data follows HRIS business requirements.

### Validation Coverage

| Module | Validation Examples |
|--------|---------------------|
| Employee | Mandatory information, email uniqueness, employee data validity |
| Organization | Company, department, branch, position, and role relationships |
| Authentication | User authentication and session validation |
| Attendance | Employee attendance integrity and validation |
| Company | Company master data validation |

Example scenarios:

- Verify employee email is unique
- Verify employee belongs to valid company
- Verify authentication record belongs to valid user
- Verify attendance belongs to valid employee
- Verify company branch belongs to valid company

---

# Test Case Documentation

Detailed test cases are maintained using Google Sheets:

- Schema Validation Test Cases: [Google Sheets Link](https://docs.google.com/spreadsheets/d/15of4X3xkE0gPsZaSBdg_DAv5-cBZNQAY8OGLgC86u4E/edit?gid=712644849#gid=712644849)
- Business Validation Test Cases: [Google Sheets Link](https://docs.google.com/spreadsheets/d/15of4X3xkE0gPsZaSBdg_DAv5-cBZNQAY8OGLgC86u4E/edit?gid=694838116#gid=694838116)

Each test case contains:

| Field | Description |
|-------|-------------|
| Test ID | Unique identifier for each test case |
| Module | Database module being tested |
| Test Scenario | Validation objective |
| Validation Type | Type of validation performed |
| Expected Result | Expected validation outcome |
| Actual Result | Test execution result |
| Status | PASS / FAIL |
| Evidence | Test execution evidence |

---

# Project Structure
```text
hris-database-testing/
│
├── docker/
│ └── docker-compose.yml
│
├── database/
│ ├── schema.sql
│ └── seed.sql
│
├── sql/
│ ├── schema-validation/
│ └── business-validation/
│
├── evidence/
│ └── screenshots/
│
└── README.md
```

---

# How to Run

## 1. Start Database Environment

Run PostgreSQL using Docker:

```bash
docker compose up -d
```

---

## 2. Connect to Database

Use the following database configuration:

| Parameter | Value |
|-----------|-------|
| Host | localhost |
| Port | 5432 |
| Database | hris |

---

## 3. Execute Validation Queries

Run SQL validation queries using DBeaver or any PostgreSQL client.

A validation query is considered **passed** when no invalid records are returned.

---

# Validation Criteria

Validation queries follow the following criteria:

| Query Result | Status |
|--------------|--------|
| No invalid records returned | PASS |
| Invalid records returned | FAIL |

---

# Learning Outcomes

Through this project, I practiced:

- Writing SQL queries for database testing
- Performing database schema validation
- Validating database constraints
- Testing referential integrity
- Designing business rule validation scenarios
- Documenting QA test cases and execution results
