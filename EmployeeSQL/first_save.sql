--DROP TABLES IF EXITS
DROP TABLE departments;
DROP TABLE dep_emp;
DROP TABLE dep_manager;
DROP TABLE employees;
DROP TABLE salaries;
DROP TABLE titles;

--CREATE TABLES
CREATE TABLE departments(
dept_no VARCHAR(10) NOT NULL,
dept_name VARCHAR(30) NOT NULL
);

CREATE TABLE dep_emp(
emp_no DEC,
dept_no VARCHAR (10) NOT NULL
);

CREATE TABLE dep_manager(
dept_no VARCHAR(10) NOT NULL,
emp_no DEC
);

CREATE TABLE employees(
emp_no DEC,
emp_title_id VARCHAR(10) NOT NULL,
birth_date DATE,
first_name VARCHAR(20) NOT NULL, 
last_name VARCHAR(20) NOT NULL,
sex VARCHAR NOT NULL,
hire_date DATE 
);

CREATE TABLE salaries(
emp_no DEC,
salary DEC
);

CREATE TABLE titles(
title_id VARCHAR(10) NOT NULL,
title VARCHAR(30) NOT NULL
);

--VERIFY IMPORTED TABLES
SELECT*FROM departments;
SELECT*FROM dep_emp;
SELECT*FROM dep_manager;
SELECT*FROM employees;
SELECT*FROM salaries;
SELECT*FROM titles;

--List the following: employee number,last name,
--first name, sex, and salary.
--Using Joins
CREATE VIEW employees_Basic_info AS
SELECT employees.emp_no, employees.last_name, employees.first_name,
employees.sex, salaries.salary
FROM salaries
INNER JOIN employees ON
employees.emp_no=salaries.emp_no;

--List first name, last name, 
--and hire date for employees who were hired in 1986.
CREATE VIEW employees_hired_1986 AS
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date >= '01-01-1986' AND hire_date <= '12-31-1986';

--List the manager of each department with the following information:
--department number, department name, the manager's employee number,
--last name, first name.

CREATE VIEW dep_managers_info_1 AS
SELECT dep_manager.dept_no,departments.dept_name,
dep_manager.emp_no
FROM dep_manager
INNER JOIN departments ON
dep_manager.dept_no=departments.dept_no;
DROP VIEW dep_managers_info_1

CREATE TABLE manger_info AS
SELECT dep_manager.dept_no, dep_manager.emp_no,
employees.first_name,
employees.last_name
FROM employees 
INNER JOIN dep_manager ON
employees.emp_no=dep_manager.emp_no
INNER JOIN dep_emp ON
employees.emp_no=dep_emp.emp_no

CREATE VIEW dep_managers_info AS
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

CREATE VIEW employees_departments AS
SElECT dep.emp_no, e.last_name, e.first_name, dep.dept_name
FROM department_info AS dep
INNER JOIN employees AS e ON
e.emp_no=dep.emp_no;
















