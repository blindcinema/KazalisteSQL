CREATE TABLE "Theater"(
    "Id" UUID PRIMARY KEY NOT NULL  ,
    "Location" VARCHAR(255),
    "WorkingHours" VARCHAR(255),
    "TicketId" VARCHAR(255)
);

CREATE TABLE "Ticket" ( 
    "Id" UUID PRIMARY KEY NOT NULL,
    "Price" INT,
    "Seat" VARCHAR(255),
    "DateOfShowing" DATE,
    "Title" VARCHAR(255),
    "PaymentInfoId" VARCHAR(255)
    -- CONSTRAINT FK_PaymentInfo_PaymentInfoId FOREIGN KEY ("PaymentInfoId") REFERENCES ("PaymentInfo") ("Id")

);
alter table "PaymentInfo" 
--drop column "PaymentInfoId"
add column "FK_PaymentMethod_PaymentMethodId" UUID,
add CONSTRAINT "FK_PaymentMethod_PaymentMethodId" FOREIGN KEY ("FK_PaymentMethod_PaymentMethodId") REFERENCES "PaymentMethod" ("Id");


CREATE TABLE "Customer" (
    "Id" UUID PRIMARY KEY NOT NULL,
    "Name" VARCHAR(255),
    "HasTicket" BOOLEAN,
    "PersonInfoId" VARCHAR(255)
    -- CONSTRAINT "FK_PersonInfo_PersonInfoId" FOREIGN KEY ("PersonInfoId") REFERENCES "PersonInfo" ("Id")

);

CREATE TABLE "PersonInfo" (
    "Id" UUID PRIMARY KEY NOT NULL,
    "Address" VARCHAR(255),
    "Phone" VARCHAR(255)

);

CREATE TABLE "Actor" (
    "Id" UUID PRIMARY KEY NOT NULL ,
    "Name" VARCHAR(255),
    "Workplace" VARCHAR(255),
    "PersonInfoId" VARCHAR(255)
    -- CONSTRAINT "FK_PersonInfo_PersonInfoId" FOREIGN KEY ("PersonInfoId") REFERENCES "PersonInfo" ("Id")

);

CREATE TABLE "PaymentInfo" (
    "Id" UUID PRIMARY KEY NOT NULL,
    "Name" VARCHAR(255),
    "Workplace" VARCHAR(255),
    "PaymentMethodId" VARCHAR(255)
    -- CONSTRAINT "FK_PaymentMethod_PaymentMethodId" FOREIGN KEY ("PaymentMethodId") REFERENCES "PaymentMethod" ("Id")

);



CREATE TABLE "PaymentMethod" (
    "Id" UUID PRIMARY KEY NOT NULL,
    "PaymentSuccessful" BOOLEAN,
    "Method" TEXT[]
);
INSERT INTO "PaymentMethod" ("Id","Method")
VALUES(gen_random_uuid(),ARRAY['Visa','MasterCard','Cash','etc.']);

insert into "PaymentInfo" ("Id")
VALUES(gen_random_uuid());
insert into "Actor" ("Id")
VALUES(gen_random_uuid());
insert into "PersonInfo" ("Id")
VALUES(gen_random_uuid());
insert into "Customer" ("Id")
VALUES(gen_random_uuid());
insert into "Ticket" ("Id")
VALUES(gen_random_uuid());
insert into "Theater" ("Id")
VALUES(gen_random_uuid());
