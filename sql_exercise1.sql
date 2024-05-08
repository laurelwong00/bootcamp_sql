CREATE DATABASE BOOTCAMP_EXERCISE1;
USE BOOTCAMP_EXERCISE1;

CREATE TABLE Locations (
	location_id INTEGER,
    street_adress VARCHAR(25),
    postal_code VARCHAR(30)
);

-- REGIONS
INSERT INTO REGIONS (REGION_ID, REGION_NAME) VALUES
(1, 'North America'),
(2, 'Europe'),
(3, 'Asia');

-- COUNTRIES
INSERT INTO COUNTRIES (COUNTRY_ID, COUNTRY_NAME, REGION_ID) VALUES
(1, 'United States', 1),
(2, 'United Kingdom', 2),
(3, 'Japan', 3);

-- LOCATIONS
INSERT INTO LOCATIONS (LOCATION_ID, STREET_ADDRESS, POSTAL_CODE, CITY, STATE_PROVINCE, COUNTRY_ID) VALUES
(1001, '123 Main St', '12345', 'New York', 'NY', 1),
(1002, '456 Elm St', '67890', 'London', NULL, 2),
(1003, '789 Oak St', '98765', 'Tokyo', NULL, 3);

-- DEPARTMENTS
INSERT INTO DEPARTMENTS (DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, LOCATION_ID) VALUES
(10, 'Sales', 101, 1001),
(20, 'HR', 102, 1002),
(30, 'IT', 103, 1003);

-- JOBS
INSERT INTO JOBS (JOB_ID, JOB_TITLE, MIN_SALARY, MAX_SALARY) VALUES
('SALESMAN', 'Salesman', 30000, 60000),
('HR_REP', 'HR Representative', 35000, 70000),
('IT_PROG', 'IT Programmer', 40000, 80000);

-- EMPLOYEES
INSERT INTO EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES
(101, 'John', 'Doe', 'john@example.com', '123-456-7890', '2023-01-15', 'SALESMAN', 50000, 0.05, 103, 10),
(102, 'Jane', 'Smith', 'jane@example.com', '987-654-3210', '2023-02-20', 'HR_REP', 55000, 0.07, 103, 20),
(103, 'Michael', 'Johnson', 'michael@example.com', '555-123-4567', '2023-03-25', 'IT_PROG', 60000, 0.06, 103,30);

-- JOB_HISTORY
INSERT INTO JOB_HISTORY (START_DATE, END_DATE, JOB_ID, DEPARTMENT_ID, EMPLOYEE_ID) VALUES
('2023-01-15', '2023-05-15', 'SALESMAN', 10, 101),
('2023-02-20', '2023-06-20', 'HR_REP', 20, 102),
('2023-03-25', NULL, 'IT_PROG', 30, 103);

-- 3
SELECT location_id, street_address, city, state_province, country_name
FROM locations l INNER JOIN countries c ON l.country_id = c.country_id;

-- 4
SELECT first_name, last_name, department_ID FROM employees;

-- 5
SELECT first_name, last_name, job_id, department_id
FROM employees e
INNER JOIN departments d ON e.department_id = d.department_id
INNER JOIN locations l ON d.location_id = l.location_id
INNER JOIN countries c ON l.country_id = c.country_id
WHERE country_name = 'JAPAN';

-- 6
SELECT e1.employee_id, e1.last_name, e1.manager_id, e2.last_name
FROM employees e1
INNER JOIN employees e2
ON e1.manager_id = e2.employee_id;

-- 7
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date > (SELECT hire_date
					FROM employees
					WHERE first_name = 'Lex' AND last_name = 'De Haan');
                    
-- 8
SELECT d.department_name, COUNT(DISTINCT e.employee_id)
FROM departments d
INNER JOIN employees e
ON d.department_id = e.department_id
GROUP BY d.department_name;

-- 9
SELECT jh.employee_id, j.job_title, DATEDIFF(jh.end_date, jh.start_date) AS date_diff
FROM job_history jh
INNER JOIN jobs j
ON jh.job_id=j.job_id
WHERE jh.department_id = 30;

-- 10
SELECT d.department_name, e.first_name, l.city, c.country_name
FROM departments d
INNER JOIN employee e ON d.manager_id = e.employee_id
INNER JOIN locations l ON l.location_id = d.location_id
INNER JOIN countries c ON c.county_id = l.country_id;

-- 11
SELECT d.department_name, avg(salary) AS average_salary
FROM departments d
INNER JOIN employee e ON d.department_id = e.department_id
GROUP BY d.department_name;

-- 12
ALTER TABLE jobs
DROP COLUMN min_salary, max_salary
ADD grade_level FROM job_grades;
