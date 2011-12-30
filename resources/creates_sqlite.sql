
CREATE TABLE "group"(
  "id" integer PRIMARY KEY ASC,
  "name" varchar(30) NOT NULL,
  "description" text
);

CREATE TABLE "account"(
  "id" integer PRIMARY KEY ASC,
  "group_id" integer NOT NULL,
  "name" varchar(30) NOT NULL,
  "surname" varchar(40) NOT NULL,
  "nickname" varchar(40) NOT NULL,
  "email" varchar(50) NOT NULL,
  "password" varchar(40) NOT NULL,
  "description" text,
  "create_date" datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "ban_date" datetime DEFAULT NULL,
  "ban_days" integer DEFAULT NULL,
  constraint fk_account_group foreign key (group_id) references "group" (id)
);

CREATE TABLE "exercise"(
  "id" integer PRIMARY KEY ASC,
  "content" text NOT NULL,
  "solution" text,
  "create_date" datetime NOT NULL,
  "last_modification" datetime NULL DEFAULT NULL,
  "difficulty" integer NOT NULL,
  "deleted" integer NOT NULL DEFAULT 0,
  "hidden" integer NOT NULL DEFAULT 0,
  "account_id" integer NOT NULL,
  constraint fk_exercise_account foreign key (account_id) references "account" (id)
);

CREATE TRIGGER [UpdateModification]
AFTER UPDATE
ON exercise
FOR EACH ROW
BEGIN
UPDATE exercise SET last_modification = CURRENT_TIMESTAMP WHERE ActionId = old.ActionId;
END;

CREATE TABLE "category"(
  "id" integer PRIMARY KEY ASC,
  "parent_id" integer DEFAULT NULL,
  "name" varchar(50) NOT NULL,
  "name_short" varchar(20) NOT NULL,
  "description" text,
  "deleted" integer NOT NULL DEFAULT 0,
  "hidden" integer NOT NULL DEFAULT 0,
  "sort_priority" varchar(100) DEFAULT NULL
);

CREATE TABLE "exercise_category"(
  "id_exercise" integer NOT NULL,
  "id_category" integer NOT NULL,
  "sort_priority" varchar(100) DEFAULT NULL,
  PRIMARY KEY("id_exercise","id_category"),
  constraint fk_ex_cat foreign key (id_exercise) references "exercise" (id),
  constraint fk_cat_ex foreign key (id_category) references "category" (id)
);

CREATE TABLE "comment"(
  "id" integer PRIMARY KEY ASC,
  "exercise_id" integer NOT NULL,
  "account_id" integer NOT NULL,
  "content" text NOT NULL,
  "create_date" datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "hidden" integer NOT NULL DEFAULT 0,
  "deleted" integer NOT NULL DEFAULT 0,
  "read" integer NOT NULL DEFAULT 0,
  constraint fk_comment_exercise foreign key (exercise_id) references "exercise" (id),
  constraint fk_comment_account foreign key (account_id) references "account" (id)
);

INSERT INTO "group" ("id", "name", "description") VALUES (1, 'administrator','Grupa administratorów portalu');

/*
password is admin
*/
INSERT INTO "account" ( "group_id", "name", "surname", "nickname", "email", "password", "description") VALUES (1,'admin','admin','admin','none','21232f297a57a5a743894a0e4a801fc3','none');
