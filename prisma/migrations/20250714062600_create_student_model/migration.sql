-- CreateTable
CREATE TABLE "student" (
    "admno" CHAR(4) NOT NULL,
    "studName" VARCHAR(30) NOT NULL,
    "gender" CHAR(1) NOT NULL,
    "address" VARCHAR(100) NOT NULL,
    "mobilePhone" CHAR(8) NOT NULL,
    "homePhone" CHAR(8) NOT NULL,
    "dob" DATE NOT NULL,
    "nationality" VARCHAR(30) NOT NULL,
    "crse_code" VARCHAR(5) NOT NULL,

    CONSTRAINT "student_pkey" PRIMARY KEY ("admno")
);
