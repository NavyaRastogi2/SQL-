CREATE TABLE Product (
    product_id NUMBER,
product_name VARCHAR2(30),
category VARCHAR2(20),
price NUMBER(10,2),
quantity NUMBER,
discount NUMBER(5,2)
);


INSERT INTO Product VALUES (101,'Laptop','Electronics',55000,5,10);
INSERT INTO Product VALUES (102,'Mobile','Electronics',25000,10,5);
INSERT INTO Product VALUES (103,'Printer','Electronics',18000,4,8);
INSERT INTO Product VALUES (104,'Chair','Furniture',6000,20,12);
INSERT INTO Product VALUES (105,'Table','Furniture',12000,8,10);
INSERT INTO Product VALUES (106,'Headphone','Accessories',3000,15,5);


-- VALUE 

SELECT product_name, price, quantity, price * quantity AS Total_Value FROM Product;

-- Discount 
SELECT product_name, price, discount, price * discount / 100 AS Discount_Amount FROM Product;

-- Final price after discount

SELECT product_name, price, discount price - (price * discount / 100) AS Final_Price FROM Product;

-- g 18% GST
SELECT product_name, price, price + (price * 18 / 100) AS Price_aft_GST FROM Product;

-- Remainder when quantity divided by 3
SELECT product_name, quantity, MOD(quantity, 3) AS Remainder FROM Product;


-- Electronics AND price > 20000
SELECT * FROM Product
WHERE category = 'Electronics' AND price > 20000;

-- Furniture OR Accessories
SELECT * FROM Product
WHERE category = 'Furniture' OR category = 'Accessories';

-- NOT in Electronics
SELECT * FROM Product WHERE NOT category = 'Electronics';


-- Price > 10000
SELECT * FROM Product WHERE price > 10000;

-- Price < 10000
SELECT * FROM Product WHERE price < 20000 and price > 2000 and price/10 > 1500;
--for 10% discount margin 

-- Quantity >= 10
SELECT * FROM Product WHERE quantity >= 10 OR ;

-- Discount = 10%
SELECT * FROM Product WHERE discount = 10;

-- Price != 12000
SELECT * FROM Product WHERE price != 12000;

-- BETWEEN 5000 and 20000
SELECT * FROM Product
WHERE price BETWEEN 5000 AND 20000;

-- IN Electronics, Furniture
SELECT * FROM Product WHERE category IN ('Electronics', 'Furniture');

-- NOT IN Electronics, Furniture
SELECT * FROM Product WHERE category NOT IN ('Electronics', 'Furniture');

-- Name starts with 'L'
SELECT * FROM Product WHERE product_name LIKE 'L%';

-- Name contains 'o'
SELECT * FROM Product WHERE product_name LIKE '%o%';

-- Price > ANY price of Furniture products
SELECT * FROM Product WHERE price > ANY (
    SELECT price FROM Product WHERE category = 'Furniture');

-- Price > ALL prices of Accessories products
SELECT * FROM Product WHERE price > ALL (
    SELECT price FROM Product WHERE category = 'Accessories'
);



-- ANOTHER TSBLE 
CREATE TABLE Online_Product (
    product_name VARCHAR2(30));

CREATE TABLE Store_Product (
    product_name VARCHAR2(30));

INSERT INTO Online_Product VALUES ('Laptop');
INSERT INTO Online_Product VALUES ('Mobile');
INSERT INTO Online_Product VALUES ('Printer');
INSERT INTO Online_Product VALUES ('Headphone');

INSERT INTO Store_Product VALUES ('Mobile');
INSERT INTO Store_Product VALUES ('Printer');
INSERT INTO Store_Product VALUES ('Chair');
INSERT INTO Store_Product VALUES ('Table');


-- UNION (online or store, no duplicates)
SELECT product_name FROM Online_Product UNION SELECT product_name FROM Store_Product;

-- UNION ALL (including duplicates)
SELECT product_name FROM Online_Product
UNION ALL
SELECT product_name FROM Store_Product;

-- INTERSECT (in both online and store)
SELECT product_name FROM Online_Product
INTERSECT
SELECT product_name FROM Store_Product;

-- MINUS (in online but not in store) — bonus, likely coming next
SELECT product_name FROM Online_Product
MINUS
SELECT product_name FROM Store_Product;
