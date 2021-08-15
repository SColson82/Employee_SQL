'''
Data Engineering:
 --- Create a table schema for each of the six CSV files. 
 --- Specify data types, primary keys, foreign keys, and other constraints.
 --- Create composite keys where necessary.
 --- Import data in correct order from CSV files. 
'''

--- To drop tables so I can reload if/when needed in the correct order.

DROP TABLE IF EXISTS titles;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS dept_emp; 
DROP TABLE IF EXISTS salaries;

-- Create Tables and set up columns, primary keys, and foreign keys.
CREATE TABLE titles (title_id VARCHAR(10) PRIMARY KEY NOT NULL,
					 title VARCHAR(30) NOT NULL
);

CREATE TABLE departments (dept_no VARCHAR(30) PRIMARY KEY NOT NULL,
						  dept_name VARCHAR(30) NOT NULL
);

CREATE TABLE employees (emp_no INT PRIMARY KEY NOT NULL,
						emp_title_id VARCHAR(30) NOT NULL,
						birth_date DATE NOT NULL,
						first_name VARCHAR(30) NOT NULL,
						last_name VARCHAR(30) NOT NULL,
						sex VARCHAR(10) NOT NULL,
						hire_date DATE NOT NULL,
						FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

CREATE TABLE dept_manager (dept_no VARCHAR(30) NOT NULL,
						   emp_no INT  PRIMARY KEY NOT NULL,
						   FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
						   FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

'''Since there are multipe employees per department and multiple employees are 
in more than one department, dept_emp requires a composite key.'''
CREATE TABLE dept_emp (emp_no INT NOT NULL,
					   dept_no VARCHAR(30) NOT NULL,
					   PRIMARY KEY (emp_no, dept_no),
					   FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
					   FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE salaries (emp_no INT PRIMARY KEY NOT NULL,
					   salary INT NOT NULL,
					   FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);


---Make certain tables loaded correctly and data was inserted. 
SELECT *
FROM titles;

SELECT *
FROM departments;

SELECT *
FROM employees;

SELECT COUNT(emp_no)
FROM employees;
			 
SELECT *
FROM dept_manager;

SELECT *
FROM dept_emp;

SELECT *
FROM dept_emp
WHERE emp_no = 11022

SELECT COUNT(emp_no)
FROM dept_emp;

SELECT *
FROM salaries;

SELECT COUNT(emp_no)
From salaries;
					 

		 

