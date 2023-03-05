USE om;
-- USE ap; -- q1
SELECT vendor_name, vendor_state
	FROM VENDORS
	WHERE vendor_state = 'CA'
UNION
SELECT vendor_name, 'Outside CA'
	FROM VENDORS
    WHERE vendor_state <> 'CA'
ORDER BY vendor_name;

-- USE ex; q2

SELECT department_name, CONCAT(first_name, ' ', last_name)
	FROM departments
		INNER JOIN employees -- or just JOIN
        -- JOIM employees
        USING (department_number) -- or ON keyword
        -- ON departments.department_number = employees.department_number
	ORDER BY departments.department_name;

-- USE ap; q3
SELECT vendor_name, invoice_date, invoice_number,
	CONCAT('# ', invoice_sequence) AS inv_sequence,
    line_item_amount AS li_amount
    FROM vendors v
    JOIN invoices i
		USING(vendor_id)
	JOIN invoice_line_items l
		USING(invoice_id)
	WHERE vendor_name = 'Wells Fargo Bank'
	ORDER BY inv_sequence;

-- q4 
-- USE ex;
SELECT d.department_number, department_name, employee_id
	FROM departments d
		LEFT JOIN employees e
        USING(department_number)
	WHERE e.employee_id IS NULL
    ORDER BY d.department_number;

-- USE ap; q5
SELECT invoice_number, vendor_name, line_item_description, line_item_amount
	FROM vendors
		JOIN invoices
			USING (vendor_id)
		JOIN invoice_line_items line_items
			USING (invoice_id)
	ORDER BY invoice_number;

-- q6 copy of table with data


-- q7
-- USE om;
CREATE TABLE orders_copy AS
	SELECT * 
    FROM orders;
    
CREATE TABLE items_copy AS
	SELECT * 
    FROM items;
-- q8

SET SQL_SAFE_UPDATES = 0;

DELETE FROM orders_copy
	WHERE shipped_date IS NULL;

-- q9
UPDATE items_copy
	SET unit_price = 1.2 * unit_price
    WHERE artist = 'Umami';
    
-- q10
INSERT INTO items_copy
	VALUES(17,'Mr. Soul', 'Sam Cooke', 15.99);
	
        
		
	

