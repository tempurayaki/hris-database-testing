CREATE TYPE "blood_type" AS ENUM (
  'A',
  'A_PLUS',
  'A_MINUS',
  'B',
  'B_PLUS',
  'B_MINUS',
  'O',
  'O_PLUS',
  'O_MINUS',
  'AB',
  'AB_PLUS',
  'AB_MINUS'
);

CREATE TYPE "marital_status" AS ENUM (
  'single',
  'married',
  'divorced',
  'widowed'
);

CREATE TYPE "attendance_type" AS ENUM (
  'clock-in',
  'clock-out'
);

CREATE TYPE "gender" AS ENUM (
  'male',
  'female'
);

CREATE TABLE "user" (
  "entity_id" BIGSERIAL NOT NULL,
  "id" BIGINT PRIMARY KEY,
  "email" TEXT NOT NULL,
  "first_name" TEXT NOT NULL,
  "last_name" TEXT,
  "gender" "GENDER" NOT NULL,
  "address" TEXT,
  "birth_place" TEXT,
  "birth_date" "TIMESTAMPTZ",
  "phone_number" TEXT,
  "citizen_id" TEXT,
  "postal_code" TEXT,
  "blood_type" "BLOOD_TYPE",
  "marital_status" "MARITAL_STATUS" NOT NULL,
  "created_at" "TIMESTAMPTZ" NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  "created_by" BIGINT NOT NULL,
  "updated_at" "TIMESTAMPTZ" NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  "updated_by" BIGINT NOT NULL,
  "deleted_at" "TIMESTAMPTZ",
  "deleted_by" BIGINT
);

CREATE TABLE "company" (
  "entity_id" BIGSERIAL,
  "id" BIGINT PRIMARY KEY NOT NULL,
  "name" TEXT NOT NULL,
  "created_at" "TIMESTAMPTZ" NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  "created_by" BIGINT NOT NULL,
  "updated_at" "TIMESTAMPTZ" NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  "updated_by" BIGINT NOT NULL,
  "deleted_at" "TIMESTAMPTZ",
  "deleted_by" BIGINT
);

CREATE TABLE "employee" (
  "entity_id" BIGSERIAL,
  "id" BIGINT PRIMARY KEY NOT NULL,
  "user_id" BIGINT UNIQUE NOT NULL,
  "nip" BIGINT NOT NULL,
  "company_id" BIGINT NOT NULL,
  "departement_id" BIGINT,
  "branch_id" BIGINT,
  "position_id" BIGINT,
  "roles" "BIGINT[]",
  "status" TEXT,
  "salary" NUMERIC,
  "joined_at" "TIMESTAMPTZ" NOT NULL,
  "created_at" "TIMESTAMPTZ" NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  "created_by" BIGINT NOT NULL,
  "updated_at" "TIMESTAMPTZ" NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  "updated_by" BIGINT NOT NULL,
  "deleted_at" "TIMESTAMPTZ",
  "deleted_by" BIGINT
);

CREATE TABLE "attendance" (
  "entity_id" BIGSERIAL,
  "id" BIGINT PRIMARY KEY NOT NULL,
  "employee_id" BIGINT NOT NULL,
  "type" "ATTENDANCE_TYPE" NOT NULL,
  "notes" TEXT,
  "attachment" TEXT NOT NULL,
  "created_at" "TIMESTAMPTZ" NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  "created_by" BIGINT NOT NULL,
  "updated_at" "TIMESTAMPTZ" NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  "updated_by" BIGINT NOT NULL,
  "deleted_at" "TIMESTAMPTZ",
  "deleted_by" BIGINT
);

CREATE TABLE "company_position" (
  "entity_id" BIGSERIAL NOT NULL,
  "id" BIGINT PRIMARY KEY NOT NULL,
  "company_id" BIGINT NOT NULL,
  "departement_id" BIGINT NOT NULL,
  "name" TEXT NOT NULL,
  "created_at" "TIMESTAMPTZ" NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  "created_by" BIGINT NOT NULL,
  "updated_at" "TIMESTAMPTZ" NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  "updated_by" BIGINT NOT NULL,
  "deleted_at" "TIMESTAMPTZ",
  "deleted_by" BIGINT
);

CREATE TABLE "company_departement" (
  "entity_id" BIGSERIAL NOT NULL,
  "id" BIGINT PRIMARY KEY NOT NULL,
  "company_id" BIGINT NOT NULL,
  "name" TEXT NOT NULL,
  "head_of_departement" BIGINT NOT NULL,
  "created_at" "TIMESTAMPTZ" NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  "created_by" BIGINT NOT NULL,
  "updated_at" "TIMESTAMPTZ" NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  "updated_by" BIGINT NOT NULL,
  "deleted_at" "TIMESTAMPTZ",
  "deleted_by" BIGINT
);

CREATE TABLE "company_role" (
  "entity_id" BIGSERIAL,
  "id" BIGINT PRIMARY KEY NOT NULL,
  "company_id" BIGINT NOT NULL,
  "name" TEXT NOT NULL,
  "permissions" BIGINT NOT NULL,
  "created_at" "TIMESTAMPTZ" NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  "created_by" BIGINT NOT NULL,
  "updated_at" "TIMESTAMPTZ" NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  "updated_by" BIGINT NOT NULL,
  "deleted_at" "TIMESTAMPTZ",
  "deleted_by" BIGINT
);

CREATE TABLE "company_branch" (
  "entity_id" BIGSERIAL,
  "id" BIGINT PRIMARY KEY NOT NULL,
  "company_id" BIGINT NOT NULL,
  "name" TEXT NOT NULL,
  "location" TEXT NOT NULL,
  "created_at" "TIMESTAMPTZ" NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  "created_by" BIGINT NOT NULL,
  "updated_at" "TIMESTAMPTZ" NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  "updated_by" BIGINT NOT NULL,
  "deleted_at" "TIMESTAMPTZ",
  "deleted_by" BIGINT
);

CREATE TABLE "auth" (
  "entity_id" BIGSERIAL PRIMARY KEY,
  "user_id" BIGINT NOT NULL,
  "password" TEXT NOT NULL,
  "created_at" "TIMESTAMPTZ" NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  "created_by" BIGINT NOT NULL,
  "updated_at" "TIMESTAMPTZ" NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  "updated_by" BIGINT NOT NULL,
  "deleted_at" "TIMESTAMPTZ",
  "deleted_by" BIGINT
);

CREATE TABLE "session" (
  "id" BIGINT PRIMARY KEY NOT NULL,
  "user_id" BIGINT NOT NULL,
  "client" TEXT NOT NULL,
  "created_at" "TIMESTAMPTZ" NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  "created_by" BIGINT NOT NULL,
  "updated_at" "TIMESTAMPTZ" NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  "updated_by" BIGINT NOT NULL,
  "deleted_at" "TIMESTAMPTZ",
  "deleted_by" BIGINT,
  "expired_at" "TIMESTAMPTZ" NOT NULL
);

COMMENT ON COLUMN "user"."entity_id" IS 'Entity id of this row';

COMMENT ON COLUMN "user"."id" IS 'ID dari user';

COMMENT ON COLUMN "user"."email" IS 'Email user';

COMMENT ON COLUMN "user"."first_name" IS 'First name of the user';

COMMENT ON COLUMN "user"."last_name" IS 'Last name of the user';

COMMENT ON COLUMN "user"."gender" IS 'User gender';

COMMENT ON COLUMN "user"."address" IS 'Address of the user';

COMMENT ON COLUMN "user"."birth_place" IS 'Birthplace of the user';

COMMENT ON COLUMN "user"."birth_date" IS 'Birth day of the user';

COMMENT ON COLUMN "user"."phone_number" IS 'Nomor handphone user';

COMMENT ON COLUMN "user"."citizen_id" IS 'Citizen id of the user';

COMMENT ON COLUMN "user"."postal_code" IS 'User postal code  address';

COMMENT ON COLUMN "user"."blood_type" IS 'User blood type';

COMMENT ON COLUMN "user"."marital_status" IS 'User marital status';

COMMENT ON COLUMN "user"."created_at" IS 'Timestamp creating of this data';

COMMENT ON COLUMN "user"."created_by" IS 'User who created this data';

COMMENT ON COLUMN "user"."updated_at" IS 'Last update timestamp of this data';

COMMENT ON COLUMN "user"."updated_by" IS 'The last user whom updating this data';

COMMENT ON COLUMN "user"."deleted_at" IS 'The timestamp of this data were soft deleted';

COMMENT ON COLUMN "user"."deleted_by" IS 'User who soft deleted this data';

COMMENT ON COLUMN "company"."entity_id" IS 'Row entity id';

COMMENT ON COLUMN "company"."id" IS 'Company ID';

COMMENT ON COLUMN "company"."name" IS 'The Company name';

COMMENT ON COLUMN "company"."created_at" IS 'Timestamp creating of this data';

COMMENT ON COLUMN "company"."created_by" IS 'User who created this data';

COMMENT ON COLUMN "company"."updated_at" IS 'Last update timestamp of this data';

COMMENT ON COLUMN "company"."updated_by" IS 'The last user whom updating this data';

COMMENT ON COLUMN "company"."deleted_at" IS 'The timestamp of this data were soft deleted';

COMMENT ON COLUMN "company"."deleted_by" IS 'User who soft deleted this data';

COMMENT ON COLUMN "employee"."entity_id" IS 'Row entity id';

COMMENT ON COLUMN "employee"."id" IS 'Employee id';

COMMENT ON COLUMN "employee"."user_id" IS 'The user id of the employee';

COMMENT ON COLUMN "employee"."nip" IS 'Employee NIP, unique within the company context';

COMMENT ON COLUMN "employee"."company_id" IS 'The company of this employee related to';

COMMENT ON COLUMN "employee"."departement_id" IS 'The departement of this employee';

COMMENT ON COLUMN "employee"."branch_id" IS 'The branch where the employee placed';

COMMENT ON COLUMN "employee"."position_id" IS 'The employee position on the compnay';

COMMENT ON COLUMN "employee"."roles" IS 'User role on the platform';

COMMENT ON COLUMN "employee"."status" IS 'Employee employment status';

COMMENT ON COLUMN "employee"."salary" IS 'The salary of this employee';

COMMENT ON COLUMN "employee"."joined_at" IS 'The date when this employee joined the company';

COMMENT ON COLUMN "employee"."created_at" IS 'Timestamp creating of this data';

COMMENT ON COLUMN "employee"."created_by" IS 'User who created this data';

COMMENT ON COLUMN "employee"."updated_at" IS 'Last update timestamp of this data';

COMMENT ON COLUMN "employee"."updated_by" IS 'The last user whom updating this data';

COMMENT ON COLUMN "employee"."deleted_at" IS 'The timestamp of this data were soft deleted';

COMMENT ON COLUMN "employee"."deleted_by" IS 'User who soft deleted this data';

COMMENT ON COLUMN "attendance"."entity_id" IS 'Row entity id';

COMMENT ON COLUMN "attendance"."id" IS 'Employee attendance id';

COMMENT ON COLUMN "attendance"."employee_id" IS 'Employee id related to this data';

COMMENT ON COLUMN "attendance"."type" IS 'Attendance type (clock-in, clock-out)';

COMMENT ON COLUMN "attendance"."notes" IS 'Notes related to this data';

COMMENT ON COLUMN "attendance"."attachment" IS 'Attachment sent to this data';

COMMENT ON COLUMN "attendance"."created_at" IS 'Timestamp creating of this data';

COMMENT ON COLUMN "attendance"."created_by" IS 'User who created this data';

COMMENT ON COLUMN "attendance"."updated_at" IS 'Timestamp last update of this data';

COMMENT ON COLUMN "attendance"."updated_by" IS 'User who last updated this data';

COMMENT ON COLUMN "attendance"."deleted_at" IS 'Timestamp of this data were soft deleted';

COMMENT ON COLUMN "attendance"."deleted_by" IS 'User who soft deleted this data';

COMMENT ON COLUMN "company_position"."entity_id" IS 'Row entity id';

COMMENT ON COLUMN "company_position"."id" IS 'Position ID';

COMMENT ON COLUMN "company_position"."company_id" IS 'Company id related to this data';

COMMENT ON COLUMN "company_position"."departement_id" IS 'Organization id this position related to';

COMMENT ON COLUMN "company_position"."name" IS 'Position name';

COMMENT ON COLUMN "company_position"."created_at" IS 'Timestamp creating of this data';

COMMENT ON COLUMN "company_position"."created_by" IS 'User who created this data';

COMMENT ON COLUMN "company_position"."updated_at" IS 'Last update timestamp of this data';

COMMENT ON COLUMN "company_position"."updated_by" IS 'The last user whom updating this data';

COMMENT ON COLUMN "company_position"."deleted_at" IS 'The timestamp of this data were soft deleted';

COMMENT ON COLUMN "company_position"."deleted_by" IS 'User who soft deleted this data';

COMMENT ON COLUMN "company_departement"."entity_id" IS 'Row entity id';

COMMENT ON COLUMN "company_departement"."id" IS 'Organization id';

COMMENT ON COLUMN "company_departement"."company_id" IS 'The company id this organiztion related to';

COMMENT ON COLUMN "company_departement"."name" IS 'The name of this organization';

COMMENT ON COLUMN "company_departement"."head_of_departement" IS 'User id for head of departement';

COMMENT ON COLUMN "company_departement"."created_at" IS 'Timestamp creating of this data';

COMMENT ON COLUMN "company_departement"."created_by" IS 'User who created this data';

COMMENT ON COLUMN "company_departement"."updated_at" IS 'Last update timestamp of this data';

COMMENT ON COLUMN "company_departement"."updated_by" IS 'The last user whom updating this data';

COMMENT ON COLUMN "company_departement"."deleted_at" IS 'The timestamp of this data were soft deleted';

COMMENT ON COLUMN "company_departement"."deleted_by" IS 'User who soft deleted this data';

COMMENT ON COLUMN "company_role"."entity_id" IS 'Row entity id';

COMMENT ON COLUMN "company_role"."id" IS 'Position ID';

COMMENT ON COLUMN "company_role"."company_id" IS 'Company id related to this data';

COMMENT ON COLUMN "company_role"."name" IS 'Position name';

COMMENT ON COLUMN "company_role"."permissions" IS 'Permission data for this role';

COMMENT ON COLUMN "company_role"."created_at" IS 'Timestamp creating of this data';

COMMENT ON COLUMN "company_role"."created_by" IS 'User who created this data';

COMMENT ON COLUMN "company_role"."updated_at" IS 'Last update timestamp of this data';

COMMENT ON COLUMN "company_role"."updated_by" IS 'The last user whom updating this data';

COMMENT ON COLUMN "company_role"."deleted_at" IS 'The timestamp of this data were soft deleted';

COMMENT ON COLUMN "company_role"."deleted_by" IS 'User who soft deleted this data';

COMMENT ON COLUMN "company_branch"."entity_id" IS 'Row entity id';

COMMENT ON COLUMN "company_branch"."id" IS 'Company branch id';

COMMENT ON COLUMN "company_branch"."company_id" IS 'Company id related to this data';

COMMENT ON COLUMN "company_branch"."name" IS 'Company branch name';

COMMENT ON COLUMN "company_branch"."location" IS 'Company barnch location';

COMMENT ON COLUMN "company_branch"."created_at" IS 'Timestamp creating of this data';

COMMENT ON COLUMN "company_branch"."created_by" IS 'User who created this data';

COMMENT ON COLUMN "company_branch"."updated_at" IS 'Last update timestamp of this data';

COMMENT ON COLUMN "company_branch"."updated_by" IS 'The last user whom updating this data';

COMMENT ON COLUMN "company_branch"."deleted_at" IS 'The timestamp of this data were soft deleted';

COMMENT ON COLUMN "company_branch"."deleted_by" IS 'User who soft deleted this data';

COMMENT ON COLUMN "auth"."entity_id" IS 'Row entity id';

COMMENT ON COLUMN "auth"."user_id" IS 'User id who owns this data';

COMMENT ON COLUMN "auth"."password" IS 'The user auth password';

COMMENT ON COLUMN "auth"."created_at" IS 'Timestamp creating of this data';

COMMENT ON COLUMN "auth"."created_by" IS 'User who created this data';

COMMENT ON COLUMN "auth"."updated_at" IS 'Last update timestamp of this data';

COMMENT ON COLUMN "auth"."updated_by" IS 'The last user whom updating this data';

COMMENT ON COLUMN "auth"."deleted_at" IS 'The timestamp of this data were soft deleted';

COMMENT ON COLUMN "auth"."deleted_by" IS 'User who soft deleted this data';

COMMENT ON COLUMN "session"."id" IS 'The session id';

COMMENT ON COLUMN "session"."user_id" IS 'User who own this session';

COMMENT ON COLUMN "session"."client" IS 'The client used for this session';

COMMENT ON COLUMN "session"."created_at" IS 'Timestamp creating of this data';

COMMENT ON COLUMN "session"."created_by" IS 'User who created this data';

COMMENT ON COLUMN "session"."updated_at" IS 'Last update timestamp of this data';

COMMENT ON COLUMN "session"."updated_by" IS 'The last user whom updating this data';

COMMENT ON COLUMN "session"."deleted_at" IS 'The timestamp of this data were soft deleted';

COMMENT ON COLUMN "session"."deleted_by" IS 'User who soft deleted this data';

COMMENT ON COLUMN "session"."expired_at" IS 'The timestamp when this session will expire';

ALTER TABLE "company_branch" ADD FOREIGN KEY ("id") REFERENCES "company" ("id") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "company_role" ADD FOREIGN KEY ("company_id") REFERENCES "company" ("id") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "company_position" ADD FOREIGN KEY ("company_id") REFERENCES "company" ("id") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "employee" ADD FOREIGN KEY ("company_id") REFERENCES "company" ("id") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "company_departement" ADD FOREIGN KEY ("company_id") REFERENCES "company" ("id") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "employee" ADD FOREIGN KEY ("departement_id") REFERENCES "company_departement" ("id") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "employee" ADD FOREIGN KEY ("user_id") REFERENCES "user" ("id") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "attendance" ADD FOREIGN KEY ("employee_id") REFERENCES "employee" ("id") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "auth" ADD FOREIGN KEY ("user_id") REFERENCES "user" ("id") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "session" ADD FOREIGN KEY ("user_id") REFERENCES "user" ("id") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "employee" ADD FOREIGN KEY ("position_id") REFERENCES "company_position" ("id") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "employee" ADD FOREIGN KEY ("branch_id") REFERENCES "company_branch" ("id") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "company_departement" ADD FOREIGN KEY ("head_of_departement") REFERENCES "employee" ("id") DEFERRABLE INITIALLY IMMEDIATE;
