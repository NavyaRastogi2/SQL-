

DROP TABLE Product;
DROP TABLE Online_Product;
DROP TABLE Store_Product;

CREATE TABLE Product (
    product_id   NUMBER,
    product_name VARCHAR2(30),
    category     VARCHAR2(20),
    price        NUMBER(10,2),
    quantity     NUMBER,
    discount     NUMBER(5,2)
);

INSERT INTO Product VALUES (101, 'Laptop',    'Electronics', 55000, 5,  10);
INSERT INTO Product VALUES (102, 'Mobile',    'Electronics', 25000, 10, 5);
INSERT INTO Product VALUES (103, 'Printer',   'Electronics', 18000, 4,  8);
INSERT INTO Product VALUES (104, 'Chair',     'Furniture',   6000,  20, 12);
INSERT INTO Product VALUES (105, 'Table',     'Furniture',   12000, 8,  10);
INSERT INTO Product VALUES (106, 'Headphone', 'Accessories', 3000,  15, 5);

COMMIT;

SELECT * FROM Product;


-- ==========================================
-- A. ARITHMETIC OPERATORS
-- ==========================================

-- 1. Total value of each product (price x quantity)
SELECT product_name, price, quantity,
       price * quantity AS Total_Value
FROM Product;

-- 2. Discount amount for each product
SELECT product_name, price, discount,
       price * discount / 100 AS Discount_Amount
FROM Product;

-- 3. Final price after deducting the discount
SELECT product_name, price, discount,
       price - (price * discount / 100) AS Final_Price
FROM Product;

-- 4. Price after adding 18% GST
SELECT product_name, price,
       price + (price * 18 / 100) AS Price_With_GST
FROM Product;

-- 5. Remainder when quantity is divided by 3
SELECT product_name, quantity,
       MOD(quantity, 3) AS Remainder
FROM Product;


-- ==========================================
-- B. LOGICAL OPERATORS
-- ==========================================

-- 1. Electronics AND price greater than 20,000
SELECT *
FROM Product
WHERE category = 'Electronics'
AND price > 20000;

-- 2. Furniture OR Accessories
SELECT *
FROM Product
WHERE category = 'Furniture'
OR category = 'Accessories';

-- 3. NOT in the Electronics category
SELECT *
FROM Product
WHERE NOT category = 'Electronics';


-- ==========================================
-- C. COMPARISON OPERATORS
-- ==========================================

-- 1. Price greater than 10,000
SELECT *
FROM Product
WHERE price > 10000;

-- 2. Price less than 10,000
SELECT *
FROM Product
WHERE price < 10000;

-- 3. Quantity greater than or equal to 10
SELECT *
FROM Product
WHERE quantity >= 10;

-- 4. Discount equal to 10%
SELECT *
FROM Product
WHERE discount = 10;

-- 5. Price not equal to 12,000
SELECT *
FROM Product
WHERE price != 12000;


-- ==========================================
-- D. SPECIAL OPERATORS
-- ==========================================

-- 1. Price BETWEEN 5,000 and 20,000
SELECT *
FROM Product
WHERE price BETWEEN 5000 AND 20000;

-- 2. Category IN Electronics and Furniture
SELECT *
FROM Product
WHERE category IN ('Electronics', 'Furniture');

-- 3. Category NOT IN Electronics and Furniture
SELECT *
FROM Product
WHERE category NOT IN ('Electronics', 'Furniture');

-- 4. Name starts with 'L'
SELECT *
FROM Product
WHERE product_name LIKE 'L%';

-- 5. Name contains 'o'  (LIKE is case-sensitive in Oracle)
SELECT *
FROM Product
WHERE product_name LIKE '%o%';

-- 6. Price greater than ANY price of Furniture products
SELECT *
FROM Product
WHERE price > ANY (SELECT price
                   FROM Product
                   WHERE category = 'Furniture');

-- 7. Price greater than ALL prices of Accessories products
SELECT *
FROM Product
WHERE price > ALL (SELECT price
                   FROM Product
                   WHERE category = 'Accessories');


-- ==========================================
-- E. SET OPERATORS
-- ==========================================

CREATE TABLE Online_Product (
    product_name VARCHAR2(30)
);

CREATE TABLE Store_Product (
    product_name VARCHAR2(30)
);

INSERT INTO Online_Product VALUES ('Laptop');
INSERT INTO Online_Product VALUES ('Mobile');
INSERT INTO Online_Product VALUES ('Printer');
INSERT INTO Online_Product VALUES ('Headphone');

INSERT INTO Store_Product VALUES ('Mobile');
INSERT INTO Store_Product VALUES ('Printer');
INSERT INTO Store_Product VALUES ('Chair');
INSERT INTO Store_Product VALUES ('Table');

COMMIT;

-- 1. UNION: online or store (duplicates removed)
SELECT product_name FROM Online_Product
UNION
SELECT product_name FROM Store_Product;

-- 2. UNION ALL: online or store, including duplicates
SELECT product_name FROM Online_Product
UNION ALL
SELECT product_name FROM Store_Product;

-- 3. INTERSECT: available in both online and store
SELECT product_name FROM Online_Product
INTERSECT
SELECT product_name FROM Store_Product;

-- 4. MINUS: available online but not in the store
SELECT product_name FROM Online_Product
MINUS
SELECT product_name FROM Store_Product;

