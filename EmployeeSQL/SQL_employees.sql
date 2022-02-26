--DROP TABLES IF EXITS
DROP TABLE departments;
DROP TABLE dep_emp;
DROP TABLE dep_manager;
DROP TABLE employees;
DROP TABLE salaries;
DROP TABLE titles;
--CREATE TABLES

CREATE TABLE salaries (
    emp_no DEC   NOT NULL,
    salary DEC   NOT NULL );

CREATE TABLE titles (
    title_id VARCHAR   NOT NULL,
    title VARCHAR  NOT NULL,
    PRIMARY KEY (title_id)
);

CREATE TABLE departments (
    dept_no VARCHAR   NOT NULL,
    dept_name VARCHAR   NOT NULL,
     PRIMARY KEY (dept_no)
);
CREATE TABLE dep_emp (
    emp_no DEC   NOT NULL,
    dept_no VARCHAR   NOT NULL,
	FOREIGN KEY(emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY(dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE dep_manager (
    dept_no VARCHAR   NOT NULL,
    emp_no DEC   NOT NULL,
	FOREIGN KEY(dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY(emp_no) REFERENCES employees (emp_no)
);

CREATE TABLE employees (
    emp_no DEC  NOT NULL,
    emp_title_id VARCHAR   NOT NULL,
    birth_date DATE  NOT NULL,
    first_name VARCHAR   NOT NULL,
    last_name VARCHAR  NOT NULL,
    sex VARCHAR   NOT NULL,
    hire_date DATE  NOT NULL,
    PRIMARY KEY (emp_no),
	FOREIGN KEY(emp_title_id) REFERENCES titles(title_id)
);

--IMPORT AND VERIFY DATA
SELECT * FROM departments;
SELECT * FROM dep_emp;
SELECT * FROM dep_manager;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;

--List the following: employee number,last name,
--first name, sex, and salary.
--Using Joins
CREATE VIEW  A_Basic_info AS
SELECT employees.emp_no, employees.last_name, employees.first_name,
employees.sex, salaries.salary
FROM salaries
INNER JOIN employees ON
employees.emp_no=salaries.emp_no;


--List first name, last name, 
--and hire date for employees who were hired in 1986.
CREATE VIEW B_hired_1986 AS
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date >= '01-01-1986' AND hire_date <= '12-31-1986';

--List the manager of each department with the following information:
--department number, department name, the manager's employee number,
--last name, first name.

CREATE TABLE manger_info AS
SELECT dep_manager.dept_no, dep_manager.emp_no,
employees.first_name,
employees.last_name
FROM employees 
INNER JOIN dep_manager ON
employees.emp_no=dep_manager.emp_no
INNER JOIN dep_emp ON
employees.emp_no=dep_emp.emp_no

CREATE VIEW C_dep_managers_info AS
SElECT m.dept_no, d.dept_name, m.emp_no,
m.first_name, m.last_name
FROM manger_info AS m
INNER JOIN departments AS d ON
d.dept_no=m.dept_no;

--List the department of each employee with the following information: 
--employee number, last name, first name, and 
--department name.

CREATE TABLE department_info AS
SElECT d.dept_name, d.dept_no, de.emp_no
FROM dep_emp AS de
INNER JOIN departments AS d ON
d.dept_no=de.dept_no;

CREATE VIEW e_mployees_departments AS
SElECT dep.emp_no, e.last_name, e.first_name, dep.dept_name
FROM department_info AS dep
INNER JOIN employees AS e ON
e.emp_no=dep.emp_no;

--List first name, last name, and sex for employees
--whose first name is "Hercules" and last names begin with "B."
CREATE VIEW F_hercules_B_name AS
SELECT first_name, last_name, sex
FROM employees
WHERE first_name='Hercules' AND last_name like 'B%'

--List all employees in the Sales department, including 
--their employee number, last name, first name, 
--and department name.
CREATE VIEW g_sales_dept AS
SELECT emp_no, last_name, first_name, dept_name
FROM e_mployees_departments
WHERE dept_name='Sales'

--List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, 
--and department name.
CREATE VIEW h_salesDevelopment_dept AS
SELECT emp_no, last_name, first_name, dept_name
FROM e_mployees_departments
WHERE dept_name='Sales' OR dept_name='Development'

--In descending order, list the frequency count of employee
--last names, i.e., how many employees share each last name.

CREATE VIEW i_frequent_lastNames AS
SELECT last_name, count(*) 
FROM employees
WHERE last_name is not null
GROUP BY last_name 
ORDER BY count DESC ;



