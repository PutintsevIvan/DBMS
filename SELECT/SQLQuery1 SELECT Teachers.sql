USE PD_321

SELECT 
	last_name + ' ' + first_name + ' ' + middle_name AS 'Ф.И.О. студента',
	DATEDIFF(hour,birth_date, GETDATE())/8766 AS 'Возраст',
	DATEDIFF(hour,work_since,GETDATE())/8766 AS 'Опыт преподавания'
	FROM Teachers
