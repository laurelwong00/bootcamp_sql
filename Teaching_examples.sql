use sys;

-- Create Table Statement
create table Circle (
	radius decimal(3,2) -- xxx.xx
);

-- Basic Select Statement
select * from Circle;

-- Insert Data
insert into Circle (Radius) values (2.34); -- Decimal(3,2) 1 integer, 2 deximal places
insert into Circle (Radius) values (2.9);

-- insert into xxx values (...);
insert into Circle values(0.37);

-- Delete data
delete from Circle where radius >= 1.35;

-- Update data (update table_name, set column name = xxx where xxx)
update Circle set radius = 1.99 where radius < 1;

-- Add column
alter table Circle add color varchar(20); -- max length of characters

select * from Circle ;

-- insert
insert into Circle (color, radius) values ('red', 3.14);
insert into circle values (3.15, 'yello');
insert into circle values(3.37, 'purple');

-- Select where and 
select * from Circle where color = 'red' and radius <3;
select * from Circle where color = ' red' or radius <3;

-- Delete
delete from Circle where color = 'yello';

-- update
update circle set color = 'black' where color = 'red' or color = 'yello';

select * from circle where color is null;
select * from circle where color is not null;

-- Math operator
-- =, >=, <=, >, <, <>
select * from circle where color <> 'black'; -- not equals to Black , not including null value;
select * from circle where color = 'black' or color is null; -- 救命好簡單

-- Dual
select 1, 'hello' from dual;
select * from Circle;
select radius, color from circle;
-- select radius color, 'hello' from circle; 'as' can be jettisoned but better not
select radius as c_radius, color as c_color, 'hello' as abc from circle;

-- delete from circle;
-- truncate circle; delete the whole test data away hahahaha
select * from circle;
insert into circle values(3.15, 'pink');
insert into circle values(2.32, 'purple');
insert into circle values(1.98, 'white');

-- Distinct
select distinct color from circle;
select distinct color from circle where radius > 7;

-- Between (usually numbers or dates)
select * from circle where radius between 2 and 3; -- [2,3]

alter table circle add create_date date;

insert into circle values(9.43, 'indigo', str_to_date('20012013', '%d%m%Y'));
insert into circle values(3.73, 'yellow' , str_to_date('2014,01,31', '%Y,%m,%d'));

select * from circle order by create_date asc;
select * from circle where create_date is not null order by create_date asc;

select radius* radius * pi() as area, radius, color from circle;
select round(radius* radius * pi(), 2) as area, radius, color from circle;

select 5 % 2 from dual;

-- Limit
select * from circle where create_date is not null order by create_date desc limit 1;

-- Like
select * from circle where color like 'R%'; -- All color starts with R character %R %R% 

CREATE TABLE customer(
	id INTEGER,
	first_name VARCHAR(20),
    last_name VARCHAR(20),
    phone VARCHAR(50),
    email VARCHAR(50)
);

INSERT INTO customer VALUES (1, 'Vincent', 'lau', '852 12345678', 'vincent@gmail.com'),
							(2, 'Oscar', 'lo', '852 87654321', 'oscar@gmail.com');
                            
INSERT INTO	customer VALUES(3, 'Jenny', 'lau', '852 41943841', 'jenny@gmail.com');
                            
SELECT concat(first_name, ' ', last_name) AS full_name FROM customer;
SELECT subtring(last_name, 1, 1) AS first_character FROM customer;
SELECT length(first_name), length(last_name) FROM customer;
SELECT upper(first_name), lower(first_name), concat(first_name, ' ', upper(last_name)) FROM customer;

SELECT c.*, length(trim(c.phone)), length(c.phone) FROM customer c;
SELECT replace(last_name, 'lau', 'chan') new_name FROM customer;
SELECT left(first_name, 2), right(first_name, 2) FROM customer;

SELECT concat_ws(' ', first_name, last_name), concat(first_name, ' ', last_name) AS full_name FROM customer;

INSERT INTO customer VALUES(4, 'Thomas', '陳', '852 09182734', 'thomas@gmail.com');
SELECT c.*, length(last_name), char_length(last_name) from customer c;

-- index of 
SELECT c.*, instr(first_name, 'i') FROM customer c;
SELECT c.*, instr(first_name, 'Jenny') FROM customer c;

-- mysql
SELECT * FROM customer WHERE last_name = 'lau';
SELECT * FROM customer WHERE last_name = 'LAU';

-- correct way
SELECT * FROM customer WHERE upper(last_name) = 'lau';
SELECT * FROM customer WHERE lower(last_name) = 'lau';

-- like% 
SELECT * FROM customer WHERE first_name LIKE '%ncent';
SELECT * FROM customer WHERE first_name LIKE '_incent'; 
SELECT * FROM customer WHERE first_name LIKE '_ncent'; -- not ok 
SELECT * FROM customer WHERE first_name LIKE '%ncen_'; 

SELECT ceil(4.3) FROM dual;
SELECT floor(4.3) FROM dual;
SELECT round(4.343, 1), round(4.343, 2) from dual;

-- date add 
SELECT date_add('2023-07-15', INTERVAL 3 month) FROM dual;
SELECT date_add('2023-07-15', INTERVAL 1 day) FROM dual;
SELECT str_to_date('2023-07-15', '%Y-%m-%d') + 1 FROM dual;
SELECT date_add('2022-02-28', INTERVAL 2 day) FROM dual;
SELECT datediff('2022-02-28','2023-07-15') FROM dual;

SELECT now() FROM dual;

SELECT extract(year FROM '2013-12-31') FROM dual;
SELECT extract(month FROM '2013-12-31') FROM dual;

SELECT ifnull(null, 0) FROM dual;
SELECT * FROM Circle;
insert into Circle values(null, 'BLACK', null);

SELECT round(ifnull(radius, 0) * ifnull(radius, 0) * pi() , 2) FROM Circle; -- or coalesce

SELECT 
	CASE
		WHEN color = 'red' AND radius > 3 THEN 'R'
        WHEN color = 'yellow' THEN 'Y'
        ELSE 'O'
	END AS c_short_name
FROM Circle c;

SELECT * from customer;
ALTER table customer ADD membership varchar(1);
UPDATE customer SET membership = 'G' where lower(last_name) = 'Lau';
UPDATE customer set membership = 'S'where lower(coalesce(last_name, 'x')) <> 'Lau';

SELECT membership, COUNT(*)
FROM customer
GROUP BY membership -- first statement to execute
;

ALTER TABLE customer add age INT;
update customer set age = 13 where first_name = 'Vincent';
update customer set age = 18 where first_name = 'Jenny';
update customer set age = 30 where first_name NOT IN ('Vincent', 'Jenny');

SELECT memership, count(membership), avg(age)
FROM customer 
GROUP BY membership
;

-- SELECT membership 
-- FROM customer
-- group BY last_name;

SELECT last_name, count(1) AS count
FROM customer
WHERE lower(coalesce(last_name, 'x')) <> 'lau' -- filter Before group by 
GROUP BY last_name;

-- Having
SELECT last_name, count(1) AS count
FROM customer
WHERE lower(coalesce(last_name, 'x')) <> 'lo' -- first execution (record level filtering)
GROUP BY last_name -- second 
HAVING count(last_name) > 1; -- third (group level filtering)


-- customer VS order one to many
CREATE TABLE Order2(
	id INT,
    customer_id INT,
    delivery_address VARCHAR(100),
    total_amount DECIMAL(10,2)
    );

insert into order2 values (1, 2, 'ABC XYZ', 100.44);
insert into order2 values (2, 2, 'xxxABC XYZ', 22.88);
insert into order2 values (3, 1, 'aaABC XYZ', 12.12);
insert into order2 values (4, 3, 'aaAfffffBC XYZ', 90.12);
    
-- inner join(multiply 2 set of records)
SELECT *
FROM customer INNER JOIN order2;

SELECT c.first_name, c.last_name, c.phone, c.email, o.total_amount, o.delivery_address
FROM customer c INNER JOIN order2 o on c.id = o.customer_id
WHERE total_amount > 30; -- execute after table join


CREATE TABLE computer_scientists(
	id INT,
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    Date_Of_Birth date,
    Nationality VARCHAR(2)
);

INSERT INTO computer_scientists(id, first_name, last_name, Date_Of_Birth, Nationality)
VALUES 
(21, 'Shafria', 'Goldwasser', null, 'US'), -- id integer primary key auto_increment -- primary key is unique, not null, index
(22, 'Alan', 'Turing', '1912-05-23', 'UK'),
(23, 'Judea', 'Pearl', '1936-09-04', 'IL'),
(24, 'Leslie', 'Lamport', '1941-02-07', 'US'),
(25, 'Michael', 'Stonebraker', '1943-10-11', 'US'),
(26, 'Whitfield', 'Diffie', '1944-05-05', 'US'),
(27, 'Martin', 'Hellman', '1945-10-02', 'US'),
(28, 'Silvio', 'Micali', '1954-10-13', 'IT');

CREATE TABLE winners(
	winner_id INT,
    recipient INT not null,
    year INT
);

INSERT INTO winners(winner_id, recipient, year)
VALUES
(58, 23, 2011),
(59, 21, 2012),
(60, 28, 2012),
(61, 24, 2013),
(62, 25, 2014),
(63, 26, 2015),
(64, 27, 2015);

CREATE TABLE countries(
	ID VARCHAR(2),
    country_name VARCHAR(50)
);

INSERT INTO countries (ID, country_name)
VALUES
('IL', 'Israel'), ('IT', 'Italy'), ('UK', 'United Kingdom'), ('US', 'United States');

CREATE TABLE awards(
	id VARCHAR(4) primary key,
    main_contribution VARCHAR(100)
);

INSERT INTO awards(id, main_contribution) 
VALUES
('2011', 'Bayesian inference algorithms'),
('2012', 'Secure criptographic proofs'),
('2013', 'Distributed computing systems design'),
('2014', 'Database systems design'),
('2015', 'Diffie-Helmann key sharing');

SELECT w.winner_id, w.recipient, w.year
FROM computer_scientists c INNER JOIN winners w on c.id = w.recipient;

SELECT DISTINCT c.ID, c.country_name
FROM computer_scientists s INNER JOIN countries c on c.ID = s.nationality;