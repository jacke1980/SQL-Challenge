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










