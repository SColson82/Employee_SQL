DROP TABLE departments;
DROP TABLE dept_emp; 
DROP TABLE dept_manager;
DROP TABLE employees;
DROP TABLE salaries;
DROP TABLE titles;

CREATE TABLE departments (dept_no VARCHAR(20),
						  dept_name VARCHAR(30)
);
						  
CREATE TABLE dept_emp (emp_no INT,
					   dept_no VARCHAR(30)
);
					   
CREATE TABLE dept_manager (dept_no VARCHAR(30),
						   emp_no INT
);
						   
CREATE TABLE employees (emp_no INT,
						emp_title_id VARCHAR(30),
						birth_date DATE,
						first_name VARCHAR(30),
						last_name VARCHAR(30),
						sex VARCHAR(10),
						hire_date DATE
);
						
CREATE TABLE salaries (emp_no INT,
					   salary INT
);
					   
CREATE TABLE titles (title_id VARCHAR(10),
					 title VARCHAR(30)
);
					 
SELECT *
FROM departments;
					 
SELECT *
FROM dept_emp;

SELECT *
FROM dept_emp
WHERE emp_no = 11022

SELECT COUNT(emp_no)
FROM dept_emp;
					 
SELECT *
FROM dept_manager;
					 
SELECT *
FROM employees;

SELECT COUNT(emp_no)
FROM employees;
					 
SELECT *
FROM salaries;

SELECT COUNT(emp_no)
From salaries;

SELECT *
FROM titles;