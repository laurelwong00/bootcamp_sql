USE sys;
CREATE TABLE Sales(
id INTEGER,
product_id INTEGER,
product_name VARCHAR(255),
unit_price DECIMAL(8,2),
quantity_sold INTEGER,
discount_amount DECIMAL(8,2),
tax_rate DECIMAL(3,2),
shipping_cost DECIMAL(8,2),
handling_fee DECIMAL(8,2)
);

SELECT * FROM Sales;
INSERT INTO Sales (id, product_id, product_name, unit_price, quantity_sold, discount_amount, tax_rate, shipping_cost, handling_fee)
VALUES
    (1, 1, 'Laptop', 999.99, 2, 0.00, 0.05, 10.50, 5.25),
    (2, 2, 'Smartphone', 599.50, 5, 25.75, 0.075, 5.75, 3.25),
    (3, 3, 'Headphones', 79.99, 10, 5.00, 0.05, 2.99, 1.50);
