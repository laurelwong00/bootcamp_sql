CREATE TABLE customer(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(255) NOT NULL,
    city_id INT NOT NULL,
    customer_address VARCHAR(255) NOT NULL,
    contact_person VARCHAR(255),
    email VARCHAR(128) NOT NULL,
    phone VARCHAR(128) NOT NULL
    
);

CREATE TABLE product(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    sku VARCHAR(32) NOT NULL,
    product_name VARCHAR(128) NOT NULL,
    product_description TEXT NOT NULL,
    current_price DECIMAL(8,2) NOT NULL,
    quantity_in_stock INT NOT NULL
);

CREATE TABLE invoice(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    invoice_number VARCHAR(255) NOT NULL,
    customer_id INT NOT NULL,
    user_account_id INT NOT NULL,
    total_price DECIMAL(8,2) NOT NULL,
    time_issued TIMESTAMP,
    time_due TIMESTAMP,
    time_paid TIMESTAMP,
    time_cancelled TIMESTAMP,
	time_refunded TIMESTAMP,
    
    FOREIGN KEY (customer_id) references customer(id)
);

CREATE TABLE invoice_item(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    invoice_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(8,2) NOT NULL,
    line_total_price DECIMAL(8,2) NOT NULL,
    
    FOREIGN KEY(invoice_id) references invoice(id),
    FOREIGN KEY(product_id) references product(id)
);

INSERT INTO CUSTOMER VALUES
(1, 'Drogerie Wien', 1, 'Deckergasse 15A', 'Emil Steinbach', 'abc@gmail.com', 123455678);
INSERT INTO CUSTOMER VALUES
(2, 'John', 4, 'Deckergasse 1A', '9upper', 'abck@gmail.com', 12345567);
INSERT INTO CUSTOMER VALUES
(3, 'Mary', 8, 'Deckergasse 18A', '9upper', 'abcd@gmail.com', 1234556789);


INSERT INTO PRODUCT VALUES
(1, '330120', '9UP PRODUCT', 'COMPLETELY 9UP', 60, 122);
INSERT INTO PRODUCT VALUES
(2, '330121', '9UPPER PRODUCT', 'COMPLETELY 9UPPER', 50, 50);
INSERT INTO PRODUCT VALUES
(3, '330122', '9UPPER PRODUCTS', 'SUPER 9UPPER', 40, 600);
INSERT INTO PRODUCT VALUES
(4, '330123', '9UPPER PRODUCTSS', 'SUPER COMPLETELY 9UPPER', 30, 500);


INSERT INTO INVOICE VALUES
(1, 123456780, 2, 41, 1423, NULL, NULL, NULL, NULL, NULL);
INSERT INTO INVOICE VALUES
(2, 123456780, 3, 42, 1400, NULL, NULL, NULL, NULL, NULL);
INSERT INTO INVOICE VALUES
(3, 123456780, 2, 43, 17000, NULL, NULL, NULL, NULL, NULL);


INSERT INTO INVOICE_ITEM VALUES
(1, 1, 1, 40, 23, 920);
INSERT INTO INVOICE_ITEM VALUES
(2, 1, 2, 4, 20, 80);
INSERT INTO INVOICE_ITEM VALUES
(3, 1, 3, 4, 10, 40);
INSERT INTO INVOICE_ITEM VALUES
(4, 1, 2, 4, 30, 120);

SELECT (SELECT 'customer' FROM DUAL) AS table_name , c.id, c.customer_name AS name
FROM customer c
LEFT JOIN invoice i ON c.id = i.customer_id
WHERE invoice_number IS NULL
UNION
SELECT (SELECT 'product' FROM DUAL) AS table_name, p.id, p.product_name AS name
FROM product p
LEFT JOIN invoice_item ii ON p.id = ii.product_id
WHERE invoice_id IS NULL;


