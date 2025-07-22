-- CreateTable
CREATE TABLE "staffDependent" (
    "staff_no" CHAR(4) NOT NULL,
    "dependent_name" VARCHAR(30),
    "relationship" VARCHAR(20) NOT NULL,

    CONSTRAINT "staffDependent_pkey" PRIMARY KEY ("staff_no")
);
