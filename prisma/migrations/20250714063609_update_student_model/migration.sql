/*
  Warnings:

  - You are about to drop the column `homePhone` on the `student` table. All the data in the column will be lost.
  - You are about to drop the column `mobilePhone` on the `student` table. All the data in the column will be lost.
  - You are about to drop the column `studName` on the `student` table. All the data in the column will be lost.
  - Added the required column `home_phone` to the `student` table without a default value. This is not possible if the table is not empty.
  - Added the required column `mobile_phone` to the `student` table without a default value. This is not possible if the table is not empty.
  - Added the required column `stud_name` to the `student` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "student" DROP COLUMN "homePhone",
DROP COLUMN "mobilePhone",
DROP COLUMN "studName",
ADD COLUMN     "home_phone" CHAR(8) NOT NULL,
ADD COLUMN     "mobile_phone" CHAR(8) NOT NULL,
ADD COLUMN     "stud_name" VARCHAR(30) NOT NULL;
