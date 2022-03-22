# SQL-Challenge

### Background

Our first major task is a research project on employees of the corporation from the 1980s and 1990s. All that remain of the database 
of employees from that period are six CSV files.
In this assignment, we will design the tables to hold data in the CSVs, import the CSVs into a SQL database, and answer questions 
about the data.

### Data Modeling
![ERD employees](https://user-images.githubusercontent.com/85952426/159516036-541dc5c3-21a2-45b0-a97a-1e9c4d5e6aef.png)

### Data Engineering
Using the information we created a table schema for each of the six CSV files. Specifying data types, primary keys, foreign keys,
and other constraints. Information contained in folder EmployeeSQL.

### Data Analysis
Once completed database, do the following:
* List the following details of each employee: employee number, last name, first name, sex, and salary.
* List first name, last name, and hire date for employees who were hired in 1986.
* List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
* List the department of each employee with the following information: employee number, last name, first name, and department name.
* List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
* List all employees in the Sales department, including their employee number, last name, first name, and department name.
* List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
* In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

## BONUS
  Import the SQL database into Pandas. (Yes, you could read the CSVs directly in Pandas, but you are, after all, trying to prove your technical mettle.)   This step may require some research. Be sure to make any necessary modifications for your username, password, host, port, and database name.
  
 **Create a histogram to visualize the most common salary ranges for employees.**
 ![Common_salary_ranges](https://user-images.githubusercontent.com/85952426/159518088-321a4f45-8503-46ee-aa74-aa28a0e8d5c3.png)
 
 **Create a bar chart of average salary by title.**
 ![AvgSalaryByTitle](https://user-images.githubusercontent.com/85952426/159518305-38049fe3-74ff-4ab4-a3d3-5a58fa26fdf7.png)












