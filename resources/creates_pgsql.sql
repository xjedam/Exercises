create trusted procedural language plpgsql;

CREATE OR REPLACE FUNCTION upd_timestamp() RETURNS TRIGGER
LANGUAGE plpgsql
AS
$$
BEGIN
    NEW.last_modification = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$;

CREATE TABLE "group"(
  "id" bigserial PRIMARY KEY,
  "name" varchar(30) NOT NULL,
  "description" text
);

CREATE TABLE "account"(
  "id" bigserial PRIMARY KEY,
  "group_id" bigint NOT NULL,
  "name" varchar(30) NOT NULL,
  "surname" varchar(40) NOT NULL,
  "nickname" varchar(40) NOT NULL,
  "email" varchar(50) NOT NULL,
  "password" varchar(40) NOT NULL,
  "description" text,
  "create_date" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "ban_date" timestamp DEFAULT NULL,
  "ban_days" bigint DEFAULT NULL,
  FOREIGN KEY("group_id") REFERENCES "group"
  ("id") ON DELETE RESTRICT ON UPDATE RESTRICT
);

CREATE TABLE "exercise"(
  "id" bigserial PRIMARY KEY,
  "content" text NOT NULL,
  "solution" text,
  "create_date" timestamp NOT NULL,
  "last_modification" timestamp NULL DEFAULT NULL,
  "difficulty" int NOT NULL,
  "deleted" int NOT NULL DEFAULT '0',
  "hidden" int NOT NULL DEFAULT '0',
  "account_id" bigint NOT NULL,
  FOREIGN KEY("account_id") REFERENCES "account"
  ("id") ON DELETE RESTRICT ON UPDATE RESTRICT
);

CREATE TABLE "category"(
  "id" bigserial PRIMARY KEY,
  "parent_id" bigint DEFAULT NULL,
  "name" varchar(50) NOT NULL,
  "name_short" varchar(20) NOT NULL,
  "description" text,
  "deleted" int NOT NULL DEFAULT '0',
  "hidden" int NOT NULL DEFAULT '0',
  "sort_priority" varchar(100) DEFAULT NULL
);

CREATE TABLE "exercise_category"(
  "id_exercise" bigint NOT NULL,
  "id_category" bigint NOT NULL,
  "sort_priority" varchar(100) DEFAULT NULL,
  PRIMARY KEY ("id_exercise","id_category"),
  FOREIGN KEY("id_exercise") REFERENCES "exercise"
  ("id") ON DELETE CASCADE ON UPDATE RESTRICT,
  FOREIGN KEY("id_category") REFERENCES "category"
  ("id") ON DELETE CASCADE ON UPDATE RESTRICT
);

CREATE TABLE "comment"(
  "id" bigserial PRIMARY KEY,
  "exercise_id" bigint NOT NULL,
  "account_id" bigint NOT NULL,
  "content" text NOT NULL,
  "create_date" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "hidden" int NOT NULL DEFAULT '0',
  "deleted" int NOT NULL DEFAULT '0',
  "read" int NOT NULL DEFAULT '0',
  FOREIGN KEY("exercise_id") REFERENCES "exercise"
  ("id") ON DELETE RESTRICT ON UPDATE RESTRICT,
  FOREIGN KEY("account_id") REFERENCES "category"
  ("id") ON DELETE RESTRICT ON UPDATE RESTRICT
);

CREATE TRIGGER t_upd_tstp_exercise
  BEFORE UPDATE
  ON exercise
  FOR EACH ROW
  EXECUTE PROCEDURE upd_timestamp();

INSERT INTO "group" ("id", "name", "description") VALUES (1, 'administrator','Grupa administratorów portalu');

/*
password is admin
*/
INSERT INTO "account" ( "group_id", "name", "surname", "nickname", "email", "password", "description") VALUES (1,'admin','admin','admin','none','21232f297a57a5a743894a0e4a801fc3','none');