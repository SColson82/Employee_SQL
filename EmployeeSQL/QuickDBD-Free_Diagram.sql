-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/919nH5
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


SET XACT_ABORT ON

BEGIN TRANSACTION QUICKDBD

CREATE TABLE [Employees] (
    [emp_no] INT  NOT NULL ,
    [emp_title] VARCHAR  NOT NULL ,
    [birth_date] DATE  NOT NULL ,
    [first_name] VARCHAR  NOT NULL ,
    [last_name] VARCHAR  NOT NULL ,
    [sex] VARCHAR  NOT NULL ,
    [hire_date] DATE  NOT NULL ,
    CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED (
        [emp_no] ASC
    )
)

CREATE TABLE [Salaries] (
    [emp_no] INTEGER  NOT NULL ,
    [salary] INTEGER  NOT NULL ,
    CONSTRAINT [PK_Salaries] PRIMARY KEY CLUSTERED (
        [emp_no] ASC
    )
)

CREATE TABLE [Titles] (
    [titel_id] VARCHAR  NOT NULL ,
    [title] VARCHAR  NOT NULL ,
    CONSTRAINT [PK_Titles] PRIMARY KEY CLUSTERED (
        [titel_id] ASC
    )
)

CREATE TABLE [Dept_Emp] (
    [emp_no] INTEGER  NOT NULL ,
    [dept_no] VARCHAR  NOT NULL ,
    CONSTRAINT [PK_Dept_Emp] PRIMARY KEY CLUSTERED (
        [emp_no] ASC
    )
)

CREATE TABLE [Departments] (
    [dept_no] VARCHAR  NOT NULL ,
    [dept_name] VARCHAR  NOT NULL ,
    CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED (
        [dept_no] ASC
    )
)

CREATE TABLE [Dept_Managers] (
    [dept_no] VARCHAR  NOT NULL ,
    [emp_no] INT  NOT NULL ,
    CONSTRAINT [PK_Dept_Managers] PRIMARY KEY CLUSTERED (
        [dept_no] ASC
    )
)

ALTER TABLE [Salaries] WITH CHECK ADD CONSTRAINT [FK_Salaries_emp_no] FOREIGN KEY([emp_no])
REFERENCES [Employees] ([emp_no])

ALTER TABLE [Salaries] CHECK CONSTRAINT [FK_Salaries_emp_no]

ALTER TABLE [Titles] WITH CHECK ADD CONSTRAINT [FK_Titles_titel_id] FOREIGN KEY([titel_id])
REFERENCES [Employees] ([emp_title])

ALTER TABLE [Titles] CHECK CONSTRAINT [FK_Titles_titel_id]

ALTER TABLE [Dept_Emp] WITH CHECK ADD CONSTRAINT [FK_Dept_Emp_emp_no] FOREIGN KEY([emp_no])
REFERENCES [Employees] ([emp_no])

ALTER TABLE [Dept_Emp] CHECK CONSTRAINT [FK_Dept_Emp_emp_no]

ALTER TABLE [Departments] WITH CHECK ADD CONSTRAINT [FK_Departments_dept_no] FOREIGN KEY([dept_no])
REFERENCES [Dept_Emp] ([dept_no])

ALTER TABLE [Departments] CHECK CONSTRAINT [FK_Departments_dept_no]

ALTER TABLE [Dept_Managers] WITH CHECK ADD CONSTRAINT [FK_Dept_Managers_dept_no] FOREIGN KEY([dept_no])
REFERENCES [Departments] ([dept_no])

ALTER TABLE [Dept_Managers] CHECK CONSTRAINT [FK_Dept_Managers_dept_no]

ALTER TABLE [Dept_Managers] WITH CHECK ADD CONSTRAINT [FK_Dept_Managers_emp_no] FOREIGN KEY([emp_no])
REFERENCES [Employees] ([emp_no])

ALTER TABLE [Dept_Managers] CHECK CONSTRAINT [FK_Dept_Managers_emp_no]

COMMIT TRANSACTION QUICKDBD