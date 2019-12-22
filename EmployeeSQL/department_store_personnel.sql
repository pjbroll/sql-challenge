-- Data analysis:

-- 1. List the following details of each employee: employee number, last name, first name, gender, and salary.

SELECT e.emp_no AS "Employee Number", 
	e.last_name AS "Last Name", 
	e. first_name AS "First Name", 
	e.gender AS "Gender", 
	s.salary AS "Salary"
FROM employees e
JOIN salaries s
ON (s.emp_no = e.emp_no);


-- 2. List employees who were hired in 1986.

SELECT e.emp_no AS "Employee Number", 
	e.last_name AS "Last Name", 
	e. first_name AS "First Name", 
	e.hire_date AS "Hire Date"
FROM employees e
WHERE e.hire_date BETWEEN '1986-01-01'
AND '1986-12-31';

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.

-- Created a view called "management_list" that joined the three tables department, dept_manager, and employees
-- ************************************
CREATE VIEW management_list AS
SELECT d.dept_no AS "Department Number", 
	d.dept_name AS "Department Name",
	e.emp_no AS "Manager Employee Number", 
	e.last_name AS "Last Name", 
	e.first_name AS "First Name", 
	d_m.from_date AS "Start Date", 
	d_m.from_date AS "End Date"
	FROM employees e
	INNER JOIN dept_manager d_m
		ON (d_m.emp_no = e.emp_no)
	INNER JOIN departments d
		ON (d_m.dept_no = d.dept_no);

-- After creating the view "management_list" run this query to display the data
-- ************************************
SELECT * FROM management_list;

-- To retest or reset: drop the view with the following query
-- ************************************
DROP VIEW management_list;

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT e.emp_no AS "Employee Number", 
	e.last_name AS "Last Name", 
	e.first_name AS "First Name", 
	d.dept_name AS "Department Name"
	FROM employees e
	INNER JOIN dept_emp d_e
		ON (d_e.emp_no = e.emp_no)
	INNER JOIN departments d
		ON (d_e.dept_no = d.dept_no);

-- 5.  List all employees whose first name is "Hercules" and last names begin with "B."

SELECT * FROM employees
	WHERE first_name = 'Hercules'
	AND last_name LIKE 'B%';

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
-- Apply a WHERE condition...

SELECT e.emp_no AS "Employee Number", 
	e.last_name AS "Last Name", 
	e.first_name AS "First Name", 
	d.dept_name AS "Department Name"
	FROM employees e
	INNER JOIN dept_emp d_e
		ON (d_e.emp_no = e.emp_no)
	INNER JOIN departments d
		ON (d_e.dept_no = d.dept_no)
	WHERE d.dept_name = 'Sales';
	
-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
-- Use the WHERE column_name IN (value1, value2,...) to find all employees who worked in these two departments

SELECT e.emp_no AS "Employee Number", 
	e.last_name AS "Last Name", 
	e.first_name AS "First Name", 
	d.dept_name AS "Department Name"
	FROM employees e
	INNER JOIN dept_emp d_e
		ON (d_e.emp_no = e.emp_no)
	INNER JOIN departments d
		ON (d_e.dept_no = d.dept_no)
	WHERE d.dept_name IN ('Sales', 'Development');


-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
-- The total count of last names in the employees table is 300024. Using this (commented out) query:
-- SELECT COUNT(last_name) FROM employees;

-- The unique last names count of 1638 is found using DISTINCT as:

SELECT COUNT(DISTINCT last_name) FROM employees;

-- End of Homework