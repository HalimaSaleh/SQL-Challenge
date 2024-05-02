CREATE TABLE departments (
    dept_no VARCHAR(5) PRIMARY KEY,
    dept_name VARCHAR(255)
);

select* from departments;

CREATE TABLE employees (
    emp_no INTEGER PRIMARY KEY,
    emp_title_id VARCHAR(5),
    birth_date VARCHAR NOT NULL,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    sex CHAR(1),
    hire_date VARCHAR NOT NULL
	
);
ALTER TABLE employees
ALTER COLUMN birth_date TYPE DATE using to_date(birth_date , 'MM/DD/YYYY');

ALTER TABLE employees
ALTER COLUMN hire_date TYPE DATE using to_date(hire_date , 'MM/DD/YYYY');

SELECT * FROM employees;


CREATE TABLE salaries (
    emp_no INTEGER,
    salary INTEGER,
    PRIMARY KEY (emp_no, salary),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);
select * from salaries;

CREATE TABLE dept_emp (
    emp_no INTEGER,
    dept_no VARCHAR(5),
    PRIMARY KEY (emp_no, dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

select * from dept_emp;

CREATE TABLE dept_manager (
    dept_no VARCHAR(5),
    emp_no INTEGER,
    PRIMARY KEY (dept_no, emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);
select * from dept_manager;