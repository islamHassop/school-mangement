CREATE TABLE "Exam"(
    "ex_code" VARCHAR(5) NOT NULL,
    "type" VARCHAR(20) NOT NULL,
    "start_time" DATE NOT NULL,
    "end_time" DATE NOT NULL,
    "total_time" DATETIME NOT NULL,
    "allow_options" BIGINT NOT NULL
);
ALTER TABLE
    "Exam" ADD CONSTRAINT "exam_ex_code_primary" PRIMARY KEY("ex_code");
CREATE TABLE "Track"(
    "track_code" INT NOT NULL,
    "track_name" VARCHAR(50) NOT NULL,
    "dept_no" BIGINT NOT NULL
);
ALTER TABLE
    "Track" ADD CONSTRAINT "track_track_code_primary" PRIMARY KEY("track_code");
CREATE TABLE "Choices"(
    "qs_id" INT NOT NULL,
    "choice" VARCHAR(100) NOT NULL
);
ALTER TABLE
    "Choices" ADD CONSTRAINT "choices_qs_id_primary" PRIMARY KEY("qs_id");
CREATE TABLE "Student_Courses"(
    "St_SSN" BIGINT NOT NULL,
    "crs_code" VARCHAR(5) NOT NULL
);
ALTER TABLE
    "Student_Courses" ADD CONSTRAINT "student_courses_st_ssn_primary" PRIMARY KEY("St_SSN");
CREATE TABLE "Question"(
    "qs_id" INT NOT NULL,
    "qs_text" VARCHAR(255) NOT NULL,
    "type" VARCHAR(15) NOT NULL,
    "correct_answer" VARCHAR(255) NOT NULL,
    "crs_code" VARCHAR(5) NOT NULL
);
ALTER TABLE
    "Question" ADD CONSTRAINT "question_qs_id_primary" PRIMARY KEY("qs_id");
CREATE TABLE "Branch"(
    "branch_No" INT NOT NULL,
    "branch_name" VARCHAR(50) NOT NULL,
    "branch_address" VARCHAR(100) NOT NULL,
    "manager" INT NULL
);
ALTER TABLE
    "Branch" ADD CONSTRAINT "branch_branch_no_primary" PRIMARY KEY("branch_No");
CREATE TABLE "Course"(
    "crs_code" VARCHAR(5) NOT NULL,
    "crs_name" VARCHAR(50) NOT NULL,
    "description" VARCHAR(100) NOT NULL,
    "max_dgree" INT NOT NULL,
    "min_dgree" INT NOT NULL,
    "inst_SSN" BIGINT NULL
);
ALTER TABLE
    "Course" ADD CONSTRAINT "course_crs_code_primary" PRIMARY KEY("crs_code");
CREATE TABLE "Student"(
    "St-SSN" BIGINT NOT NULL,
    "St_Name" VARCHAR(50) NOT NULL,
    "intake_no" INT NOT NULL
);
ALTER TABLE
    "Student" ADD CONSTRAINT "student_st_ssn_primary" PRIMARY KEY("St-SSN");
CREATE TABLE "Inst_Course_Exam"(
    "id" INT NOT NULL,
    "inst_SSN" BIGINT NOT NULL,
    "crs_code" VARCHAR(5) NOT NULL,
    "ex_code" VARCHAR(5) NOT NULL
);
ALTER TABLE
    "Inst_Course_Exam" ADD CONSTRAINT "inst_course_exam_id_primary" PRIMARY KEY("id");
CREATE TABLE "St_Exam_Quest"(
    "St_SSN" BIGINT NOT NULL,
    "ex_code" VARCHAR(5) NOT NULL,
    "qs_Id" INT NOT NULL,
    "St_answer" VARCHAR(255) NOT NULL,
    "qs_dgree" INT NOT NULL,
    "final_result" BIGINT NOT NULL
);
ALTER TABLE
    "St_Exam_Quest" ADD CONSTRAINT "st_exam_quest_st_ssn_primary" PRIMARY KEY("St_SSN");
CREATE TABLE "Instructor"(
    "inst_SSN" BIGINT NOT NULL,
    "inst_name" VARCHAR(50) NOT NULL,
    "dept_no" INT NOT NULL
);
ALTER TABLE
    "Instructor" ADD CONSTRAINT "instructor_inst_ssn_primary" PRIMARY KEY("inst_SSN");
CREATE TABLE "Intake"(
    "intake_no" INT NOT NULL,
    "round" INT NOT NULL,
    "branch_id" INT NOT NULL,
    "dept_no" INT NOT NULL,
    "track_code" BIGINT NOT NULL
);
ALTER TABLE
    "Intake" ADD CONSTRAINT "intake_intake_no_primary" PRIMARY KEY("intake_no");
CREATE TABLE "Department"(
    "dept_no" INT NOT NULL,
    "dept_name" VARCHAR(50) NOT NULL,
    "branch_no" INT NOT NULL
);
ALTER TABLE
    "Department" ADD CONSTRAINT "department_dept_no_primary" PRIMARY KEY("dept_no");
CREATE INDEX "department_branch_no_index" ON
    "Department"("branch_no");
ALTER TABLE
    "Intake" ADD CONSTRAINT "intake_branch_id_foreign" FOREIGN KEY("branch_id") REFERENCES "Branch"("branch_No");
ALTER TABLE
    "Instructor" ADD CONSTRAINT "instructor_dept_no_foreign" FOREIGN KEY("dept_no") REFERENCES "Department"("dept_no");
ALTER TABLE
    "Department" ADD CONSTRAINT "department_branch_no_foreign" FOREIGN KEY("branch_no") REFERENCES "Branch"("branch_No");
ALTER TABLE
    "Inst_Course_Exam" ADD CONSTRAINT "inst_course_exam_ex_code_foreign" FOREIGN KEY("ex_code") REFERENCES "Exam"("ex_code");
ALTER TABLE
    "St_Exam_Quest" ADD CONSTRAINT "st_exam_quest_ex_code_foreign" FOREIGN KEY("ex_code") REFERENCES "Exam"("ex_code");
ALTER TABLE
    "Student_Courses" ADD CONSTRAINT "student_courses_crs_code_foreign" FOREIGN KEY("crs_code") REFERENCES "Course"("crs_code");
ALTER TABLE
    "St_Exam_Quest" ADD CONSTRAINT "st_exam_quest_qs_id_foreign" FOREIGN KEY("qs_Id") REFERENCES "Question"("qs_id");
ALTER TABLE
    "Student" ADD CONSTRAINT "student_st_ssn_foreign" FOREIGN KEY("St-SSN") REFERENCES "Student_Courses"("St_SSN");
ALTER TABLE
    "Intake" ADD CONSTRAINT "intake_track_code_foreign" FOREIGN KEY("track_code") REFERENCES "Track"("track_code");
ALTER TABLE
    "Student" ADD CONSTRAINT "student_st_ssn_foreign" FOREIGN KEY("St-SSN") REFERENCES "St_Exam_Quest"("St_SSN");
ALTER TABLE
    "Inst_Course_Exam" ADD CONSTRAINT "inst_course_exam_crs_code_foreign" FOREIGN KEY("crs_code") REFERENCES "Course"("crs_code");
ALTER TABLE
    "Student" ADD CONSTRAINT "student_intake_no_foreign" FOREIGN KEY("intake_no") REFERENCES "Intake"("intake_no");
ALTER TABLE
    "Question" ADD CONSTRAINT "question_crs_code_foreign" FOREIGN KEY("crs_code") REFERENCES "Course"("crs_code");
ALTER TABLE
    "Track" ADD CONSTRAINT "track_dept_no_foreign" FOREIGN KEY("dept_no") REFERENCES "Department"("dept_no");
ALTER TABLE
    "Question" ADD CONSTRAINT "question_qs_id_foreign" FOREIGN KEY("qs_id") REFERENCES "Choices"("qs_id");
ALTER TABLE
    "Course" ADD CONSTRAINT "course_inst_ssn_foreign" FOREIGN KEY("inst_SSN") REFERENCES "Instructor"("inst_SSN");
ALTER TABLE
    "Inst_Course_Exam" ADD CONSTRAINT "inst_course_exam_inst_ssn_foreign" FOREIGN KEY("inst_SSN") REFERENCES "Instructor"("inst_SSN");