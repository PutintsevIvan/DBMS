USE PD_321_SQL

--CREATE TABLE Disciplines
--(
--discipline_id		SMALLINT PRIMARY KEY IDENTITY(1,1),
--discepline_name		NVARCHAR(50) NOT NULL,
--number_of_lessons	TINYINT NOT NULL
--)

---------------------------------------------------------------------

----CREATE TABLE DisciplinesDirectionsRelation
----(
----discipline	 SMALLINT NOT NULL	CONSTRAINT  FK_DisciplinesDirectionsRelation_Disciplines FOREIGN KEY REFERENCES Disciplines(discipline_id),
----direction	 TINYINT  NOT NULL	CONSTRAINT  FK_DisciplinesDirectionsRelation_Directions  FOREIGN KEY REFERENCES Directions(direction_id)
----PRIMARY KEY (discipline,direction)
----)

--CREATE TABLE RequiredDisciplines
--(
--pending_discipline			SMALLINT NOT NULL 
--CONSTRAINT FK_PendingDiscipline_Disciplines
--FOREIGN KEY REFERENCES Disciplines(discipline_id),

--required_discipline SMALLINT NOT NULL 
--CONSTRAINT FK_RequiredDisciplines    
--FOREIGN KEY REFERENCES Disciplines(discipline_id),

--PRIMARY KEY(pending_discipline,required_discipline)
--)


--CREATE TABLE DependentDisciplines
--(
--current_discipline			SMALLINT NOT NULL 
--CONSTRAINT FK_CurrentDiscipline_Disciplines
--FOREIGN KEY REFERENCES Disciplines(discipline_id),

--dependent_discipline SMALLINT NOT NULL 
--CONSTRAINT FK_DependentDisciplines    
--FOREIGN KEY REFERENCES Disciplines(discipline_id),

--PRIMARY KEY (current_discipline,dependent_discipline)
--)


-------------------------------------------


--CREATE TABLE TeachersDisciplinesRelation
--(
--teacher SMALLINT NOT NULL
--CONSTRAINT FK_TeacherDisciplineRelation_Teachers
--FOREIGN KEY REFERENCES Teachers(teacher_id),

--discipline SMALLINT NOT NULL
--CONSTRAINT FK_TeachersDisciplinesRelation_Disciplines
--FOREIGN KEY REFERENCES Disciplines(discipline_id),

--PRIMARY KEY(teacher,discipline)
--)

--CREATE TABLE Examinations
--(
--student INT NOT NULL
--CONSTRAINT FK_Examinations_Students
--FOREIGN KEY REFERENCES Students(stud_id),

--discipline SMALLINT NOT NULL
--CONSTRAINT FK_Examinations_Disciplines
--FOREIGN KEY REFERENCES Disciplines(discipline_id),

--grade TINYINT NOT NULL,

--PRIMARY KEY(student,discipline)
--)

--CREATE TABLE Attedndance
--(
--student INT NOT NULL
--CONSTRAINT FK_Attendance_Students
--FOREIGN KEY REFERENCES Students(stud_id),

--lesson BIGINT NOT NULL
--CONSTRAINT FK_Attendance_Schedule
--FOREIGN KEY REFERENCES Schedule(lesson_id),
--present bit
--)

--CREATE TABLE Grades
--(
--student INT NOT NULL
--CONSTRAINT FK_Grades_Students
--FOREIGN KEY REFERENCES Students(stud_id),

--lesson BIGINT NOT NULL
--CONSTRAINT FK_Grades_Schedule
--FOREIGN KEY REFERENCES Schedule(lesson_id),

--grade1 TINYINT NOT NULL,
--grade2 TINYINT NOT NULL
--)

--CREATE TABLE LearningForms
--(
--form_id			TINYINT NOT NULL,
--form_name		VARCHAR(20),
--days_per_week	TINYINT NOT NULL
--)

