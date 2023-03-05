/* Answer 1 */ 
USE my_guitar_shop;
DROP TABLE IF EXISTS customers_copy;
CREATE TABLE customers_copy LIKE customers;
INSERT INTO customers_copy
	SELECT *
		FROM customers;
        
INSERT INTO customers_copy 
VALUES (DEFAULT, 'pduffy@murach.com', '7a718fbd768d2378z511f8249b54897f940e9023',
		'Pamela', 'Duffy', 10, 1);

DROP TABLE IF EXISTS products_copy;
CREATE TABLE products_copy LIKE products;
INSERT INTO products_copy
	SELECT *
		FROM products;

INSERT INTO products_copy
VALUES (11, 4, 'Y_PK100', 'Yamaha PK-100','The Yamaha PK-100 88-key weighted actiondigital piano hasa Graded  Hammer Standard Action, 192-note Polyphony,24 Sounds,Stereo Sound System, EQ,  and Drum Patterns/VirtualAccompaniment -Black',
		800.00, 20.00, SYSDATE());
               

/* Answer 2 */
SELECT product_id, product_name,
			list_price, discount_percent, 
            SUM(quantity) AS 'quantity'
	FROM order_items
		RIGHT OUTER JOIN products_copy USING(product_id)
GROUP BY product_id
ORDER BY product_id;


UPDATE products_copy
SET discount_percent = 0.00
WHERE product_id IN (1,2,5);

UPDATE products_copy
SET discount_percent = 500.00
WHERE product_id IN (8,11);


/* Answer 3 */
SELECT c.customer_id, CONCAT(first_name, last_name) AS customer_name, 
	state, o.order_id, order_date
	FROM customers_copy c
			LEFT JOIN addresses 
				ON shipping_address_id = address_id
            LEFT OUTER JOIN orders o 
				ON c.customer_id = o.customer_id
            LEFT JOIN order_items i 
				ON o.order_id = i.order_id
ORDER BY customer_id;

DELETE FROM customers_copy
WHERE customer_id IN (8,9)	
 