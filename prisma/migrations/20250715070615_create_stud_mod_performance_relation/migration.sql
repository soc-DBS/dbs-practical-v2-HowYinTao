-- AddForeignKey
ALTER TABLE "studModPerformance" ADD CONSTRAINT "student_performance_admin_fk" FOREIGN KEY ("admno") REFERENCES "student"("admno") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "studModPerformance" ADD CONSTRAINT "student_performance_module_fk" FOREIGN KEY ("mod_registered") REFERENCES "module"("mod_code") ON DELETE NO ACTION ON UPDATE NO ACTION;
