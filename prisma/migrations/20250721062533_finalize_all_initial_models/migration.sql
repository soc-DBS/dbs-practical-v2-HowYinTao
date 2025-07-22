/*
  Warnings:

  - The primary key for the `student` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `admno` on the `student` table. All the data in the column will be lost.
  - You are about to drop the `studModPerformance` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `adm_no` to the `student` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "studModPerformance" DROP CONSTRAINT "student_performance_admin_fk";

-- DropForeignKey
ALTER TABLE "studModPerformance" DROP CONSTRAINT "student_performance_module_fk";

-- AlterTable
ALTER TABLE "student" DROP CONSTRAINT "student_pkey",
DROP COLUMN "admno",
ADD COLUMN     "adm_no" CHAR(4) NOT NULL,
ALTER COLUMN "home_phone" DROP NOT NULL,
ALTER COLUMN "mobile_phone" DROP NOT NULL,
ADD CONSTRAINT "student_pkey" PRIMARY KEY ("adm_no");

-- DropTable
DROP TABLE "studModPerformance";

-- CreateTable
CREATE TABLE "stud_mod_performance" (
    "adm_no" CHAR(4) NOT NULL,
    "mod_registered" VARCHAR(10) NOT NULL,
    "mark" INTEGER,
    "grade" CHAR(2),

    CONSTRAINT "stud_mod_performance_pkey" PRIMARY KEY ("adm_no","mod_registered")
);

-- RenameForeignKey
ALTER TABLE "course" RENAME CONSTRAINT "course_offer_fk" TO "course_offered_by_fk";

-- RenameForeignKey
ALTER TABLE "pre_requisite" RENAME CONSTRAINT "pre_mod_fk" TO "pre_requisite_mod_code_fk";

-- RenameForeignKey
ALTER TABLE "pre_requisite" RENAME CONSTRAINT "pre_req_fk" TO "pre_requisite_requisite_fk";

-- RenameForeignKey
ALTER TABLE "student" RENAME CONSTRAINT "student_course_fk" TO "student_crse_code_fk";

-- RenameForeignKey
ALTER TABLE "student" RENAME CONSTRAINT "student_nation_fk" TO "student_nationality_fk";

-- AddForeignKey
ALTER TABLE "module" ADD CONSTRAINT "mod_mod_coord_fk" FOREIGN KEY ("mod_coord") REFERENCES "staff"("staff_no") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "stud_mod_performance" ADD CONSTRAINT "stud_mod_performance_adm_no_fkey" FOREIGN KEY ("adm_no") REFERENCES "student"("adm_no") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "stud_mod_performance" ADD CONSTRAINT "stud_mod_performance_mod_registered_fkey" FOREIGN KEY ("mod_registered") REFERENCES "module"("mod_code") ON DELETE NO ACTION ON UPDATE NO ACTION;
