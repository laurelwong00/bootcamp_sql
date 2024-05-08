use sys;
create table Product (
	id integer,
    name varchar(255),
    price decimal(8,2),
    description text,
    created_at timestamp
);
select * from Product;
insert into Product (id, name, price, description, created_at)
values
(1,'Laptop', 999.99, 'High-perfromace laptop with SSD storage.', current_timestamp),
(2,'Smartphone', 599.50, '4G smartphone with advanced camera features.', current_timestamp),
(3,'Headphones', 79.99, 'Wireless headphones with noise-canceling technology', current_timestamp);

select sum(price) from Product as Total_Price;
SELECT MIN(price) AS "Min Price for Phones" FROM Product WHERE LOWER(name) LIKE '%phone%';
SELECT *, description AS "Product Description" FROM Product WHERE LOWER(description) LIKE '%wireless%';

SELECT * FROM Product ORDER BY name ASC;
SELECT * FROM Product WHERE price = (SELECT MAX(price) FROM Product);
SELECT * FROM Product WHERE LOWER(name) LIKE '%laptop%';
SELECT AVG(price) FROM Product;
SELECT * FROM Product ORDER BY created_at ASC LIMIT 3; 

-- trial 
SELECT * FROM Product ORDER BY created_at ASC LIMIT 3; 
SELECT * 
FROM Product 
ORDER BY created_at ASC;





