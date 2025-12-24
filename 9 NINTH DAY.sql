SHOW DATABASES;
USE AKASH;
use regex;
SHOW DATABASES;

USE regex;
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100) NOT NULL,
    job_title VARCHAR(100),
    manager_id INT,
    salary DECIMAL(10,2),
    FOREIGN KEY (manager_id) REFERENCES employees(emp_id)
);

INSERT INTO employees (emp_id, emp_name, job_title, manager_id, salary) VALUES
(1, 'Alice', 'CEO', NULL, 120000),

(2, 'Bob', 'CTO', 1, 95000),
(3, 'Carol', 'CFO', 1, 90000),
(4, 'David', 'HR Manager', 1, 85000),

(5, 'Eve', 'Tech Lead', 2, 75000),
(6, 'Frank', 'Senior Developer', 2, 72000),
(7, 'Grace', 'Senior Developer', 2, 71000),

(8, 'Heidi', 'Developer', 5, 60000),
(9, 'Ivan', 'Developer', 5, 58000),
(10, 'Judy', 'Developer', 6, 59000),

(11, 'Mallory', 'Accountant', 3, 65000),
(12, 'Niaj', 'Financial Analyst', 3, 62000),

(13, 'Olivia', 'HR Executive', 4, 55000),
(14, 'Peggy', 'HR Executive', 4, 54000),

(15, 'Sybil', 'Intern', 8, 35000);

SELECT emp_id, emp_name, job_title, manager_id, salary
FROM employees;
SELECT emp_id, emp_name, job_title, manager_id
FROM employees AS emp;
-- FOR CONNECT
SELECT 
    emp.emp_id,
    emp.emp_name,
    emp.manager_id,
    mngr.emp_id,
    mngr.emp_name
FROM employees emp
JOIN employees mngr
ON emp.manager_id = mngr.emp_id;

-- COUNT NUMBER OF EMPLYOEE FOR EACH MANAGER
SELECT MNGR.EMP_NAME,COUNT(EMP.EMP_ID)
FROM employees EMP
JOIN employees mngr
ON emp.manager_id = mngr.emp_id GROUP BY MNGR.EMP_NAME;

-- 
