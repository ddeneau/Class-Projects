-- Partial script for the stored procedure 'owed_to_state_vendors'

-- HINT: This stored procedure is built around a SELECT query.
-- You may want to first build the query, and then plug it into the code below.
-- See the hints below, right after the BEGIN line, for help with the SELECT query.

DROP PROCEDURE IF EXISTS owed_to_state_vendors;

DELIMITER //

-- --> The CREATE statement goes here. Remember to add the parameter 
-- --- (in parentheses); its data type should be VARCHAR(50)
CREATE PROCEDURE owed_to_state_vendors(
		IN state_abbreviation VARCHAR(50))
BEGIN    
	SELECT vendor_name, SUM(invoice_total - payment_total - credit_total) AS invoice_total, 
		COUNT(invoice_id) AS number_of_invoices
		FROM vendors JOIN invoices USING(vendor_id)
        WHERE vendor_state = state_abbreviation
	GROUP BY vendor_name
	HAVING invoice_total > 0
    ORDER BY vendor_name;
END //

DELIMITER ;

CALL owed_to_state_vendors('CA');
-- --> TEST YOUR CODE:
-- --- Run this statement: CALL owed_to_state_vendors('CA');
-- --- Do your see two rows with the following values?
-- --- 
-- --- 'Blue Cross', 224.00, 3
-- --- 'Ford Motor Credit Company', 503.20, 1
-- --- 
-- --- If "Yes", you have built the stored procedure as required; 
-- --- if "No", continue working on it.
-- --- If you see an extra row from IBM, please re-run your create_databases.sql script 
-- --- as this may show up after completing Question 3. 


