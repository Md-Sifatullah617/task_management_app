BEGIN;

--
-- ACTION DROP TABLE
--
DROP TABLE "task" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "task" (
    "id" bigserial PRIMARY KEY,
    "title" text NOT NULL,
    "description" text NOT NULL,
    "status" bigint NOT NULL,
    "createdAt" timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone NOT NULL
);


--
-- MIGRATION VERSION FOR task_management_app
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('task_management_app', '20250516182335271', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250516182335271', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
