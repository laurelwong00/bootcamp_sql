SELECT d.dept_code, COUNT(e.ID) AS num_of_employee
FROM employee e
RIGHT JOIN department d ON e.DEPT_ID = d.ID
GROUP BY d.ID 
ORDER BY num_of_employee DESC, dept_code ASC
;

CREATE TABLE employee (
	id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    employee_name VARCHAR(30) NOT NULL,
    SALARY NUMERIC(8,2),
    PHONE NUMERIC(15),
    email VARCHAR(50),
    dept_id INTEGER NOT NULL
);

CREATE TABLE department (
	id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    dept_code VARCHAR(3) NOT NULL,
    dept_name VARCHAR(200) NOT NULL
);

INSERT INTO employee VALUES (1, 'John', 20000, 90234567, 'John@gmail.com', 1);
INSERT INTO employee VALUES (2, 'Mary', 10000, 90234561, 'mary@gmail.com', 1);
INSERT INTO employee VALUES (3, 'Steve', 30000, 90234562, 'steve@gmail.com', 3);
INSERT INTO employee VALUES (4, 'Sunny', 40000, 90234563, 'sunny@gmail.com', 4);

INSERT INTO department VALUES (1, 'HR', 'Human resources');
INSERT INTO department VALUES (2, '9up', '9up department');
INSERT INTO department VALUES (3, 'SA', 'Sales department');
INSERT INTO department VALUES (4, 'IT', 'information technology department');

DELETE FROM department WHERE id = 5;
INSERT INTO department VALUES (5, 'IT', 'information technology department');

-- new id 5 is unique, did not violate primary key uniqueness, you didn't impose contraints on other columns thanks