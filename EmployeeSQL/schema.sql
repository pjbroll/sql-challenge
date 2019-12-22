-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/fIKHsi
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS titles;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;

CREATE TABLE employees (
    emp_no INTEGER   NOT NULL,
    birth_date DATE   NOT NULL,
    first_name VARCHAR   NOT NULL,
    last_name VARCHAR   NOT NULL,
    gender VARCHAR(1)   NOT NULL,
    hire_date DATE   NOT NULL,
    CONSTRAINT pk_employees PRIMARY KEY (
        emp_no
     )
);

CREATE TABLE titles (
    titles_id SERIAL PRIMARY KEY  NOT NULL,
    emp_no INTEGER   NOT NULL,
    title VARCHAR   NOT NULL,
    from_date DATE   NOT NULL,
    to_date DATE   NOT NULL
);

CREATE TABLE salaries (
    salaries_id SERIAL   NOT NULL,
    emp_no INTEGER   NOT NULL,
    salary INTEGER   NOT NULL,
    from_date DATE   NOT NULL,
    to_date DATE   NOT NULL,
    CONSTRAINT pk_salaries PRIMARY KEY (
        salaries_id
     )
);

CREATE TABLE departments (
    dept_id SERIAL   NOT NULL,
    dept_no VARCHAR   NOT NULL,
    dept_name VARCHAR   NOT NULL,
    CONSTRAINT pk_departments PRIMARY KEY (
        dept_id
     )
);

CREATE TABLE dept_emp (
    dept_emp_id SERIAL   NOT NULL,
    emp_no INTEGER   NOT NULL,
    dept_no VARCHAR   NOT NULL,
    from_date DATE   NOT NULL,
    to_date DATE   NOT NULL,
    CONSTRAINT pk_dept_emp PRIMARY KEY (
        dept_emp_id
     )
);

CREATE TABLE dept_manager (
    dept_mgr_id SERIAL   NOT NULL,
    dept_no VARCHAR   NOT NULL,
    emp_no INTEGER   NOT NULL,
    from_date DATE   NOT NULL,
    to_date DATE   NOT NULL,
    CONSTRAINT pk_dept_manager PRIMARY KEY (
        dept_mgr_id
     )
);

-- Add constraints on tables for foreign keys.

ALTER TABLE titles ADD CONSTRAINT fk_titles_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

ALTER TABLE salaries ADD CONSTRAINT fk_salaries_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

ALTER TABLE dept_emp ADD CONSTRAINT fk_dept_emp_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

ALTER TABLE dept_emp ADD CONSTRAINT fk_dept_emp_dept_no FOREIGN KEY(dept_no)
REFERENCES departments (dept_no);

ALTER TABLE dept_manager ADD CONSTRAINT fk_dept_manager_dept_no FOREIGN KEY(dept_no)
REFERENCES departments (dept_no);

ALTER TABLE dept_manager ADD CONSTRAINT fk_dept_manager_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

-- Load data from csv files using import function of progreSQL - remember to deselect SERIAL id columns
-- Check data is loaded in the tables by running queries - limit to the first 100 rows.

-- SELECT * FROM employees LIMIT 100;
-- SELECT * FROM titles LIMIT 100;
-- SELECT * FROM salaries LIMIT 100;
-- SELECT * FROM departments LIMIT 100;
-- SELECT * FROM dept_emp LIMIT 100;
-- SELECT * FROM dept_manager LIMIT 100;