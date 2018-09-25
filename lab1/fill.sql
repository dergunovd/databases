INSERT INTO [databases].[dbo].[University] ([name]) VALUES ('Саратовский Национальный Исследовательский Университет им. Н.Г. Чернышевского')
INSERT INTO [databases].[dbo].[University] ([name]) VALUES ('Саратовский Государственный Технический Университет им. Ю.А. Гагарина')
INSERT INTO [databases].[dbo].[University] ([name]) VALUES ('Колледж радиотехники им. П.Н. Яблочкова')

INSERT INTO [databases].[dbo].[EducationTypes] ([name]) VALUES ('Начальное')
INSERT INTO [databases].[dbo].[EducationTypes] ([name]) VALUES ('Среднее')
INSERT INTO [databases].[dbo].[EducationTypes] ([name]) VALUES ('Средне-специальное техническое')
INSERT INTO [databases].[dbo].[EducationTypes] ([name]) VALUES ('Высшее техническое')

INSERT INTO [databases].[dbo].[Faculties] ([name], [university], [educationType]) VALUES ('Компьютерных наук и информационных технологий', 1, 4)
INSERT INTO [databases].[dbo].[Faculties] ([name], [university], [educationType]) VALUES ('Хороший факультет', 3, 3)

INSERT INTO [databases].[dbo].[Positions] ([name]) VALUES ('Инженер-программист')
INSERT INTO [databases].[dbo].[Positions] ([name]) VALUES ('Проект-менеджер')
INSERT INTO [databases].[dbo].[Positions] ([name]) VALUES ('Уборщица')

INSERT INTO [databases].[dbo].[Employers] ([company]) VALUES ('EPAM')
INSERT INTO [databases].[dbo].[Employers] ([company]) VALUES ('Grid Dynamics')
INSERT INTO [databases].[dbo].[Employers] ([company]) VALUES ('СГУ')

INSERT INTO [databases].[dbo].[Applicants] ([name], [born]) VALUES ('Дергунов Дмитрий Витальевич', '1998-04-22')
INSERT INTO [databases].[dbo].[Applicants] ([name], [born]) VALUES ('Иванова Иванна Ивановна', '1970-01-01')

INSERT INTO [databases].[dbo].[Experience] ([applicant], [position], [dateFrom], [dateTo], [company]) VALUES (1, 1, '2016-09-10', '2018-09-03', 1)
INSERT INTO [databases].[dbo].[Experience] ([applicant], [position], [dateFrom], [dateTo], [company]) VALUES (1, 2, '2018-09-12', '2018-09-24', 2)
INSERT INTO [databases].[dbo].[Experience] ([applicant], [position], [dateFrom], [dateTo], [company]) VALUES (2, 3, '2002-09-05', '2018-09-04', 3)

INSERT INTO [databases].[dbo].[Comments] ([company], [applicant], [rating], [description]) VALUES (1, 1, 3, 'Неплозая компания. Но везде используется ОС семейства Windows')
INSERT INTO [databases].[dbo].[Comments] ([company], [applicant], [rating], [description]) VALUES (2, 1, 5, 'Отличная компания')
INSERT INTO [databases].[dbo].[Comments] ([company], [applicant], [rating], [description]) VALUES (3, 2, 2, 'Много этажей. Устала мыть молы')

INSERT INTO [databases].[dbo].[CV] ([applicant], [position], [minWage], [description]) VALUES (1, 1, 120000, 'Хочу много получать и мало работать')
INSERT INTO [databases].[dbo].[CV] ([applicant], [position], [minWage], [description]) VALUES (2, 2, 10000, 'Не привередливая. Могу еще грузчиком поработать')

INSERT INTO [databases].[dbo].[Vacancies] ([company], [experience], [position], [wage], [date], [educationType], [status]) VALUES (2, 5, 1, 130000, '2018-09-19', 3, 1)
INSERT INTO [databases].[dbo].[Vacancies] ([company], [experience], [position], [wage], [date], [educationType], [status]) VALUES (1, 4, 1, 90000, '2018-09-14', 2, 1)
INSERT INTO [databases].[dbo].[Vacancies] ([company], [experience], [position], [wage], [date], [educationType], [status]) VALUES (1, NULL, 3, 15000, '2018-09-03', 1, 1)
INSERT INTO [databases].[dbo].[Vacancies] ([company], [experience], [position], [wage], [date], [educationType], [status]) VALUES (3, 2, 3, 40000, '2017-09-08', 4, 0)

INSERT INTO [databases].[dbo].[Education] ([applicant], [faculty], [endDate]) VALUES (1, 1, '2020-09-30')
INSERT INTO [databases].[dbo].[Education] ([applicant], [faculty], [endDate]) VALUES (2, 2, '2005-09-07')
INSERT INTO [databases].[dbo].[Education] ([applicant], [faculty], [endDate]) VALUES (2, 1, '2013-09-06')

