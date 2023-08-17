-- Create Titles Table to import Employee Titles and ID
CREATE TABLE Titles (
    title_id VARCHAR (5) PRIMARY KEY NOT NULL,
    title VARCHAR (20) NOT NULL
);
-- Create Employees Table to import all employee background data
CREATE TABLE Employees (
	emp_no INT PRIMARY KEY NOT NULL,
    emp_title_id VARCHAR(5) NOT NULL,
    birth_date DATE NOT NULL,
	first_name VARCHAR(20) NOT NULL,
	last_name VARCHAR (20) NOT NULL,
	sex VARCHAR (1) NOT NULL,
    hire_date DATE NOT NULL,
	FOREIGN KEY (emp_title_id) REFERENCES Titles(title_id)
);
-- Create Salaries Table to import Employee Salary Information
CREATE TABLE Salaries (
    emp_no INT PRIMARY KEY NOT NULL,
    salary INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)
);
-- Create Departments Table to import deparatment number and name
CREATE TABLE Departments (
    dept_no VARCHAR (5) PRIMARY KEY NOT NULL,
    dept_name VARCHAR (20) NOT NULL
);
-- Create Dept_Emp table for employee number with assoicated department number
CREATE TABLE Dept_Emp (
    emp_no INT NOT NULL,
    dept_no VARCHAR (5) NOT NULL,
	PRIMARY KEY (emp_no, dept_no),
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES Departments(dept_no)
);
-- Create Dept_ Mgr table for Mgr Employee ID and the department ID they manage
CREATE TABLE Dept_Manager (
    dept_no VARCHAR (5),
	emp_no INT PRIMARY KEY,
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES Departments(dept_no)
);
