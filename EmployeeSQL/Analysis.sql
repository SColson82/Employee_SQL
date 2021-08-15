/*
Data Analysis:
*/


/*  [1.] Employee number, last name, first name, sex, and salary */
SELECT *
FROM employees; 
SELECT *
FROM salaries;  

--- Join employees and salaries tables on emp_no to list the above. 
SELECT e.emp_no, e.last_name,e.first_name,e.sex,s.salary
FROM employees AS e
INNER JOIN salaries AS s ON
e.emp_no = s.emp_no;



/* [2.] List first name, last name, and hire date for employees who were hired in 1986. */
SELECT *
FROM employees; 

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date 
BETWEEN '1986-01-01'
AND '1986-12-31';



/*  [3.] List the manager of each department with the following information: 
         department number, department name, the manager's employee number, last name, first name. */
SELECT * 
FROM dept_manager  ---emp_no and dept_no

SELECT COUNT(emp_no)
FROM dept_manager     ---24. Final table should be 24 rows. 

SELECT *
FROM departments   ---dept name. Join on dept_no

SELECT *
FROM employees   ----last_name and first_name. Join on emp_no

---Join employees and departments on dept_manager
SELECT m.dept_no, d.dept_name, m.emp_no, e.last_name, e.first_name
FROM dept_manager AS m
JOIN departments AS d USING (dept_no)
JOIN employees AS e USING (emp_no);



/* [4.] List the department of each employee with the following information: 
 	    employee number, last name, first name, and department name. */
SELECT *
FROM dept_emp   --- emp_no and dept_no

SELECT COUNT(*)
FROM dept_emp    --- 331603 rows

SELECT *
FROM departments   --- dept_name (join on dept_no)

SELECT *
FROM employees   --- last_name, first_name (join on emp_no)

---Join employees and departments on dept_emp. 
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp AS de
JOIN employees AS e USING (emp_no)
JOIN departments AS d USING (dept_no)



/* [5.] List first name, last name, and sex for employees whose 
        first name is "Hercules" and last names begin with "B."  */
SELECT first_name, last_name, sex
FROM employees
WHERE first_name =
'Hercules'
AND last_name
LIKE 'B%';



/* [6.] List all employees in the Sales department: 
 		employee number, last name, first name, and department name. */

--- Borrow the queried data from number 3 and filter it using "View"
CREATE VIEW sales_dept AS
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp AS de
JOIN employees AS e USING (emp_no)
JOIN departments AS d USING (dept_no);

--- Filter the requested data. 
SELECT *
FROM sales_dept
WHERE dept_name = 'Sales';



/* [7.] List all employees in the Sales and Development departments:
		employee number, last name, first name, and department name. */

--- Borrow the created 'View' from number 6. 
SELECT *
FROM sales_dept
WHERE dept_name = 'Sales'
OR dept_name = 'Development';

--- Best practice to drop view once finished. 
DROP VIEW sales_dept;



/* [8.] In descending order, list the frequency count of employee last names,
 		i.e., how many employees share each last name. */
SELECT last_name, COUNT(last_name) AS "frequency"
FROM employees
Group BY last_name
ORDER BY COUNT(last_name) DESC;

---212 Rabehasainas but only 1 person with last name Foolsday?!
