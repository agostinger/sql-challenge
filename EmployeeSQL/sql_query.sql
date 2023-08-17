-- Data Analysis
-- 1. List employee, sex & salary by joining employee table with salaries table
SELECT e.emp_no,
	e.last_name,
	e.first_name,
	e.sex,
	s.salary
FROM Employees as e
INNER JOIN Salaries as s ON
s.emp_no = e.emp_no;
-- 2. List of employee's name and hire date for employees hired in 1986.
SELECT e.first_name,
	e.last_name,
	e.hire_date
FROM Employees as e
WHERE EXTRACT(YEAR FROM e.hire_date) = 1986;
-- 3. List of managers and department managed by joining Dept_Manager table,
-- Employee table and Departments table.
SELECT dm.dept_no,
	d.dept_name,
	dm.emp_no,
	e.last_name,
	e.first_name
FROM Dept_Manager as dm
INNER JOIN Employees as e ON
e.emp_no = dm.emp_no
INNER JOIN Departments as d ON
d.dept_no = dm.dept_no;
-- 4. List of employees with their department number and department name by
-- joining the Employees table, Department table and Dept_Emp table.
SELECT e.emp_no,
	e.last_name,
	e.first_name,
	de.dept_no,
	d.dept_name
FROM Employees as e
INNER JOIN Dept_Emp as de ON
de.emp_no = e.emp_no
INNER JOIN Departments as d ON
d.dept_no = de.dept_no;
-- 5. List of employees with first name=Hercules and last name starts with B
SELECT e.first_name,
	e.last_name,
	e.sex
FROM Employees as e
WHERE
	e.first_name = 'Hercules'
	AND e.last_name LIKE 'B%';
-- 6. List of employees in Sales Dept by joining Employees Table, Departments
-- tab and Dept_Emp table.
SELECT e.emp_no,
	e.last_name,
	e.first_name
FROM Employees as e
INNER JOIN Dept_Emp as de ON
de.emp_no = e.emp_no
INNER JOIN Departments as d ON
d.dept_no = de.dept_no
WHERE d.dept_name = 'Sales';
-- 7. List employees in Sales and Development departments by joining Employees
-- table, Departments table and Dept_Emp table.
SELECT e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
FROM Employees as e
INNER JOIN Dept_Emp as de ON
de.emp_no = e.emp_no
INNER JOIN Departments as d ON
d.dept_no = de.dept_no
WHERE
	d.dept_name = 'Sales'
	OR d.dept_name = 'Development';
-- Count of frequency of last names sorted in descending order.
SELECT last_name, COUNT(*) AS frequency_counts
FROM Employees
GROUP BY last_name
ORDER BY frequency_counts DESC;
