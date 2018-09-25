CREATE TABLE [University] (
  id integer IDENTITY(1, 1) NOT NULL,
  name varchar(255) NOT NULL UNIQUE,
  CONSTRAINT [PK_UNIVERSITY] PRIMARY KEY CLUSTERED
  (
  [id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)
)
GO

CREATE TABLE [EducationTypes] (
  id integer IDENTITY(1, 1) NOT NULL,
  name varchar(255) NOT NULL UNIQUE,
  CONSTRAINT [PK_EDUCATIONTYPES] PRIMARY KEY CLUSTERED
  (
  [id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)
)
GO

CREATE TABLE [Faculties] (
  id integer IDENTITY(1, 1) NOT NULL,
  name varchar(255) NOT NULL,
  university integer NOT NULL,
  educationType integer NOT NULL,
  CONSTRAINT [PK_FACULTIES] PRIMARY KEY CLUSTERED
  (
  [id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)
)
GO

CREATE TABLE [Positions] (
  id integer IDENTITY(1, 1) NOT NULL,
  name varchar(255) NOT NULL UNIQUE,
  CONSTRAINT [PK_POSITIONS] PRIMARY KEY CLUSTERED
  (
  [id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)
)
GO

CREATE TABLE [Employers] (
  id integer IDENTITY(1, 1) NOT NULL,
  company varchar(255) NOT NULL UNIQUE,
  CONSTRAINT [PK_EMPLOYERS] PRIMARY KEY CLUSTERED
  (
  [id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)
)
GO

CREATE TABLE [Applicants] (
  id integer IDENTITY(1, 1) NOT NULL,
  name varchar(255) NOT NULL,
  born date,
  CONSTRAINT [PK_APPLICANTS] PRIMARY KEY CLUSTERED
  (
  [id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)
)
GO

CREATE TABLE [Experience] (
  id integer IDENTITY(1, 1) NOT NULL,
  applicant integer NOT NULL,
  position integer NOT NULL,
  dateFrom date NOT NULL,
  dateTo date,
  company integer NOT NULL,
  CONSTRAINT [PK_EXPERIENCE] PRIMARY KEY CLUSTERED
  (
  [id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)
)
GO

CREATE TABLE [Comments] (
  id integer IDENTITY(1, 1) NOT NULL,
  company integer NOT NULL,
  applicant integer NOT NULL,
  rating integer NOT NULL,
  description text NOT NULL,
  CONSTRAINT [PK_COMMENTS] PRIMARY KEY CLUSTERED
  (
  [id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)
)
GO
CREATE TABLE [CV] (
  id integer IDENTITY(1, 1) NOT NULL,
  applicant integer NOT NULL,
  position integer NOT NULL,
  minWage integer,
  description text,
  CONSTRAINT [PK_CV] PRIMARY KEY CLUSTERED
  (
  [id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)
)
GO

CREATE TABLE [Vacancies] (
  id integer IDENTITY(1, 1) NOT NULL,
  company integer NOT NULL,
  experience integer,
  position integer NOT NULL,
  wage integer,
  date date NOT NULL DEFAULT 'CURRENT_TIME',
  educationType integer NOT NULL,
  status integer NOT NULL,
  CONSTRAINT [PK_VACANCIES] PRIMARY KEY CLUSTERED
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
  [applicant] ASC,
  [faculty] ASC
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
