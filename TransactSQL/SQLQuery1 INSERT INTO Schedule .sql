USE PD_321

DELETE FROM Schedule WHERE lesson_id<11


IF NOT EXISTS
(
SELECT
			[group], discipline,  teacher, [data], [time], spent
FROM		Schedule
JOIN		Groups		ON ([group]=group_id)
JOIN		Discepline  ON (discipline=discipline_id)
JOIN		Teachers    ON (teacher=teacher_id)
)
BEGIN
INSERT  INTO Schedule
		([group], discipline,  teacher, [data], [time], spent)
VALUES
(
	(SELECT group_id		FROM Groups		WHERE group_name = 'PD_321'),
	(SELECT discipline_id   FROM Discepline WHERE discipline_name LIKE('%MS SQL Server%')),
	(SELECT teacher_id		FROM Teachers   WHERE first_name = 'Олег'),
	GETDATE(),
	'13:30',
	1

)
END

SELECT 
			lesson_id,
			[Группа]		= group_name,
			[Дисциплина]	= discipline_name,
			[Преподаватель] = FORMATMESSAGE('%s %s %s',last_name, first_name, middle_name),
			[День недели]	= DATENAME(WEEKDAY,[Schedule].[data]),
			[Дата]			= [Schedule].[data],
			[Время]			= [Schedule].[time],
			[Статус]		= IIF([Schedule].[spent]=1,'Проведено','Запланированно')

FROM		Schedule
JOIN		Groups		ON ([group]=group_id)
JOIN		Discepline  ON (discipline=discipline_id)
JOIN		Teachers    ON (teacher=teacher_id)