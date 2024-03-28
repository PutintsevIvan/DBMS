--Crl+R  
USE PD_321

DECLARE		@discipline_name	 NVARCHAR(50)= '%MS SQL Server%'
DECLARE		@group				 INT	     =	(SELECT	group_id		  FROM Groups		WHERE group_name = 'PD_321')
DECLARE		@discipline			 SMALLINT    = (SELECT discipline_id	  FROM Discepline	WHERE discipline_name LIKE(@discipline_name))
DECLARE		@number_of_lessons   TINYINT     = (SELECT number_of_lessons  FROM Discepline   WHERE discipline_name LIKE(@discipline_name))
DECLARE		@number_of_lesson			 TINYINT	 = 0
DECLARE		@teacher			 SMALLINT    = (SELECT teacher_id		  FROM Teachers		WHERE first_name='Олег')
DECLARE		@start_date			 DATE	     = '2024-02-27'
DECLARE		@data				 DATE	     = @start_date
DECLARE		@time				 TIME	     = '13:30'

WHILE (@number_of_lesson<@number_of_lessons)
BEGIN

     IF NOT EXISTS
    (
  	 SELECT 
			[group],@discipline,@teacher,[data],[time],spent
	 FROM Schedule
	 JOIN Groups		ON ([group]=group_id)
	 JOIN Discepline ON (discipline=discipline_id)
	 JOIN Teachers	ON (teacher=teacher_id)
	 WHERE [group]=@group
	 AND	  discipline=@discipline
	 AND	  teacher=@teacher
	 AND	  [data]=@data
	 AND	  [time]=@time
    ) 
   BEGIN
		INSERT INTO Schedule
			([group], discipline,teacher,[data], [time], spent,number_of_lesson)
		VALUES	
				(@group, @discipline, @teacher, @data, @time, IIF(@data<GETDATE(),1,0),@number_of_lesson+1 ),
		    	(@group, @discipline, @teacher, @data, DATEADD(MINUTE,95,@time), IIF(@data<GETDATE(),1,0),@number_of_lesson+2 );
			END
			SET	@number_of_lesson=@number_of_lesson+2	
			IF DATENAME(WEEKDAY, @data) IN ('Вторник','Четверг')
				SET @data=DATEADD(DAY, 2, @data)
		ELSE
			SET @data = DATEADD(DAY, 3, @data)
END
----------------------------------------------------------------
EXECUTE my_sp_select_group_from_schedule 'PD_321';
--SELECT 
--			lesson_id,
--			[Группа]		= group_name,
--			[Дисциплина]	= Discepline. discipline_name,
--			[Преподаватель] = FORMATMESSAGE('%s %s %s',last_name, first_name, middle_name),
--			[День недели]   = DATENAME(WEEKDAY,[Schedule].[data]),
--			[Дата]			= [Schedule].[data],
--			[Время]			= [Schedule].[time],
--			[Статус]		= IIF([Schedule].[spent]=1,'Проведено','Запланированно'),
--			[Номер занятия] = number_of_lesson,
--			[Тема занятия]  = subject_of_lesson

--FROM		Schedule
--JOIN		Groups		ON ([group]=group_id)
--JOIN		Discepline  ON (discipline=discipline_id)
--JOIN		Teachers    ON (teacher=teacher_id)
