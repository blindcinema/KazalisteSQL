CREATE TABLE "Theater"(
    "Id" SERIAL PRIMARY KEY,
    "Location" VARCHAR(255),
    "WorkingHours" VARCHAR(255),
    "TicketId" VARCHAR(255)
);

CREATE TABLE "Ticket" (
    "Id" SERIAL PRIMARY KEY,
    "Price" INT,
    "Seat" VARCHAR(255),
    "DateOfShowing" DATE,
    "Title" VARCHAR(255),
    "PaymentInfoId" VARCHAR(255)
    -- CONSTRAINT FK_PaymentInfo_PaymentInfoId FOREIGN KEY ("PaymentInfoId") REFERENCES ("PaymentInfo") ("Id")

);

CREATE TABLE "Customer" (
    "Id" SERIAL PRIMARY KEY,
    "Name" VARCHAR(255),
    "HasTicket" BOOLEAN,
    "PersonInfoId" VARCHAR(255)
    -- CONSTRAINT "FK_PersonInfo_PersonInfoId" FOREIGN KEY ("PersonInfoId") REFERENCES "PersonInfo" ("Id")

);

CREATE TABLE "PersonInfo" (
    "Id" SERIAL PRIMARY KEY,
    "Address" VARCHAR(255),
    "Phone" VARCHAR(255)

);

CREATE TABLE "Actor" (
    "Id" SERIAL PRIMARY KEY ,
    "Name" VARCHAR(255),
    "Workplace" VARCHAR(255),
    "PersonInfoId" VARCHAR(255)
    -- CONSTRAINT "FK_PersonInfo_PersonInfoId" FOREIGN KEY ("PersonInfoId") REFERENCES "PersonInfo" ("Id")

);

CREATE TABLE "PaymentInfo" (
    "Id" SERIAL PRIMARY KEY,
    "Name" VARCHAR(255),
    "Workplace" VARCHAR(255),
    "PaymentMethodId" VARCHAR(255)
    -- CONSTRAINT "FK_PaymentMethod_PaymentMethodId" FOREIGN KEY ("PaymentMethodId") REFERENCES "PaymentMethod" ("Id")

);



CREATE TABLE "PaymentMethod" (
    "Id" SERIAL PRIMARY KEY ,
    "PaymentSuccessful" BOOLEAN,
    "Method" TEXT[]
);
INSERT INTO "PaymentMethod" ("Method")
VALUES(ARRAY['Visa','MasterCard','Cash','etc.']);