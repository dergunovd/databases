CREATE TABLE [Employers] (
	id integer(11) NOT NULL,
	company varchar(255) NOT NULL UNIQUE,
  CONSTRAINT [PK_EMPLOYERS] PRIMARY KEY CLUSTERED
  (
  [id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Vacancies] (
	id integer(11) NOT NULL,
	company integer(11) NOT NULL,
	experience integer(3),
	position integer(11) NOT NULL,
	wage integer(9),
	date date NOT NULL DEFAULT 'CURRENT_TIME',
	educationType integer NOT NULL,
  CONSTRAINT [PK_VACANCIES] PRIMARY KEY CLUSTERED
  (
  [id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Positions] (
	id integer(11) NOT NULL,
	name varchar(255) NOT NULL UNIQUE,
  CONSTRAINT [PK_POSITIONS] PRIMARY KEY CLUSTERED
  (
  [id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Applicants] (
	id integer(11) NOT NULL,
	name integer(11) NOT NULL,
	born date,
	educationType integer(11),
  CONSTRAINT [PK_APPLICANTS] PRIMARY KEY CLUSTERED
  (
  [id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Experience] (
	id integer NOT NULL,
	applicant integer(11) NOT NULL,
	position integer(11) NOT NULL,
	dateFrom date NOT NULL,
	dateTo date,
	company integer(11) NOT NULL,
  CONSTRAINT [PK_EXPERIENCE] PRIMARY KEY CLUSTERED
  (
  [id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [CV] (
	id integer NOT NULL,
	applicant integer(11) NOT NULL,
	position integer(11) NOT NULL,
	minWage integer(9),
	description text,
  CONSTRAINT [PK_CV] PRIMARY KEY CLUSTERED
  (
  [id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [University] (
	id integer(11) NOT NULL,
	name varchar(255) NOT NULL UNIQUE,
  CONSTRAINT [PK_UNIVERSITY] PRIMARY KEY CLUSTERED
  (
  [id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Education] (
	applicant integer NOT NULL,
	faculty integer NOT NULL,
	endDate date,
  CONSTRAINT [PK_EDUCATION] PRIMARY KEY CLUSTERED
  (
  [applicant] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Faculties] (
	id integer(11) NOT NULL,
	name timestamp(255) NOT NULL,
	university integer(11) NOT NULL,
	educationType integer(11) NOT NULL,
  CONSTRAINT [PK_FACULTIES] PRIMARY KEY CLUSTERED
  (
  [id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [EducationTypes] (
	id integer(11) NOT NULL,
	varchar integer(255) NOT NULL UNIQUE,
  CONSTRAINT [PK_EDUCATIONTYPES] PRIMARY KEY CLUSTERED
  (
  [id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Comments] (
	id integer(11) NOT NULL,
	company integer(11) NOT NULL,
	applicant integer(11) NOT NULL,
	rating integer(1) NOT NULL,
	description text NOT NULL,
  CONSTRAINT [PK_COMMENTS] PRIMARY KEY CLUSTERED
  (
  [id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO

ALTER TABLE [Vacancies] WITH CHECK ADD CONSTRAINT [Vacancies_fk0] FOREIGN KEY ([company]) REFERENCES [Employers]([id])
ON UPDATE CASCADE
GO
ALTER TABLE [Vacancies] CHECK CONSTRAINT [Vacancies_fk0]
GO
ALTER TABLE [Vacancies] WITH CHECK ADD CONSTRAINT [Vacancies_fk1] FOREIGN KEY ([position]) REFERENCES [Positions]([id])
ON UPDATE CASCADE
GO
ALTER TABLE [Vacancies] CHECK CONSTRAINT [Vacancies_fk1]
GO
ALTER TABLE [Vacancies] WITH CHECK ADD CONSTRAINT [Vacancies_fk2] FOREIGN KEY ([educationType]) REFERENCES [EducationTypes]([id])
ON UPDATE CASCADE
GO
ALTER TABLE [Vacancies] CHECK CONSTRAINT [Vacancies_fk2]
GO


ALTER TABLE [Applicants] WITH CHECK ADD CONSTRAINT [Applicants_fk0] FOREIGN KEY ([educationType]) REFERENCES [EducationTypes]([id])
ON UPDATE CASCADE
GO
ALTER TABLE [Applicants] CHECK CONSTRAINT [Applicants_fk0]
GO

ALTER TABLE [Experience] WITH CHECK ADD CONSTRAINT [Experience_fk0] FOREIGN KEY ([applicant]) REFERENCES [Applicants]([id])
ON UPDATE CASCADE
GO
ALTER TABLE [Experience] CHECK CONSTRAINT [Experience_fk0]
GO
ALTER TABLE [Experience] WITH CHECK ADD CONSTRAINT [Experience_fk1] FOREIGN KEY ([position]) REFERENCES [Positions]([id])
ON UPDATE CASCADE
GO
ALTER TABLE [Experience] CHECK CONSTRAINT [Experience_fk1]
GO
ALTER TABLE [Experience] WITH CHECK ADD CONSTRAINT [Experience_fk2] FOREIGN KEY ([company]) REFERENCES [Employers]([id])
ON UPDATE CASCADE
GO
ALTER TABLE [Experience] CHECK CONSTRAINT [Experience_fk2]
GO

ALTER TABLE [CV] WITH CHECK ADD CONSTRAINT [CV_fk0] FOREIGN KEY ([applicant]) REFERENCES [Applicants]([id])
ON UPDATE CASCADE
GO
ALTER TABLE [CV] CHECK CONSTRAINT [CV_fk0]
GO
ALTER TABLE [CV] WITH CHECK ADD CONSTRAINT [CV_fk1] FOREIGN KEY ([position]) REFERENCES [Positions]([id])
ON UPDATE CASCADE
GO
ALTER TABLE [CV] CHECK CONSTRAINT [CV_fk1]
GO


ALTER TABLE [Education] WITH CHECK ADD CONSTRAINT [Education_fk0] FOREIGN KEY ([applicant]) REFERENCES [Applicants]([id])
ON UPDATE CASCADE
GO
ALTER TABLE [Education] CHECK CONSTRAINT [Education_fk0]
GO
ALTER TABLE [Education] WITH CHECK ADD CONSTRAINT [Education_fk1] FOREIGN KEY ([faculty]) REFERENCES [Faculties]([id])
ON UPDATE CASCADE
GO
ALTER TABLE [Education] CHECK CONSTRAINT [Education_fk1]
GO

ALTER TABLE [Faculties] WITH CHECK ADD CONSTRAINT [Faculties_fk0] FOREIGN KEY ([university]) REFERENCES [University]([id])
ON UPDATE CASCADE
GO
ALTER TABLE [Faculties] CHECK CONSTRAINT [Faculties_fk0]
GO
ALTER TABLE [Faculties] WITH CHECK ADD CONSTRAINT [Faculties_fk1] FOREIGN KEY ([educationType]) REFERENCES [EducationTypes]([id])
ON UPDATE CASCADE
GO
ALTER TABLE [Faculties] CHECK CONSTRAINT [Faculties_fk1]
GO


ALTER TABLE [Comments] WITH CHECK ADD CONSTRAINT [Comments_fk0] FOREIGN KEY ([company]) REFERENCES [Employers]([id])
ON UPDATE CASCADE
GO
ALTER TABLE [Comments] CHECK CONSTRAINT [Comments_fk0]
GO
ALTER TABLE [Comments] WITH CHECK ADD CONSTRAINT [Comments_fk1] FOREIGN KEY ([applicant]) REFERENCES [Applicants]([id])
ON UPDATE CASCADE
GO
ALTER TABLE [Comments] CHECK CONSTRAINT [Comments_fk1]
GO

