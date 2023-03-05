-- Partial script for the trigger 'new_invoice_row'

DROP TRIGGER IF EXISTS new_invoice_row;

DELIMITER //

-- --> Add here the statement that will create a trigger 
-- --- with the name new_invoice_row
CREATE TRIGGER new_invoice_row
	AFTER INSERT ON invoices
	FOR EACH ROW
	
BEGIN
	DECLARE invoice_id_var INT;
	DECLARE invoice_total_var DECIMAL (9,2);
	-- --> declare here the variable that will catch and hold 
	-- --- the value for the vendor_id column in the newly-added row; 
	-- --- name the variable vendor_id_var; 	
	-- --- don't forget to declare its data type
    DECLARE vendor_id_var INT; 
	DECLARE vendor_name_var VARCHAR(30);

	SET invoice_id_var = NEW.invoice_id;
	-- --> set here the value of the variable invoice_total_var; 
	-- --- it should be equal to the newly-added invoice_total value; 	
	-- --- observe the other SET statements as examples
	SET invoice_total_var = NEW.invoice_total; 
	SET vendor_id_var = NEW.vendor_id;
	SELECT vendor_name INTO vendor_name_var FROM vendors WHERE vendor_id = vendor_id_var;
	INSERT INTO new_invoice_records VALUES
	(invoice_id_var, CONCAT("You have added a new invoice from ", vendor_name_var, " with an invoice total of $", invoice_total_var), NOW());
	-- --> (add here the values that should be inserted into the 
	-- --- new_invoice_records table when the trigger executes;
	-- --- you will need a CONCAT() to generate the text value 
	-- --- that will go into the new_invoice_record_text column);
END//

DELIMITER ;

SELECT * FROM new_invoice_records;
-- --> Test your code:
-- --- Run this INSERT query: 
-- --- INSERT INTO invoices VALUES (118,34,'ZXA-080','2018-02-01',650.50,650.50,0,3,'2018-03-01', NULL);
-- --- Then run this SELECT query: SELECT * FROM new_invoice_records;
-- --- Do your see a row with the following values?
-- --- 
-- --- '118', 'You have added a new invoice from IBM with an invoice total of $650.50', '2020-04-17 02:18:17'
-- --- NOTE: The date and time in your 3rd column will be different.
-- --- 
-- --- If "Yes", you have built the trigger as required; 
-- --- if "No", keep on working on it.