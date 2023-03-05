




USE ap;
SELECT UPPER(vendor_name)  AS 'Vendor Name',
	CONCAT(MID(vendor_phone, 2, 3), '.', TRIM(MID(vendor_phone, 6, 4)), '.', RIGHT(vendor_phone, 4))
    AS 'Vendor Phone',
    DATE_FORMAT(invoice_date, '%M %e, %Y') AS 'Invoice Date'
FROM vendors
	JOIN invoices i USING(vendor_id)
WHERE invoice_date =
	(SELECT MAX(invoice_date)
	FROM invoices
    WHERE invoices.vendor_id = i.vendor_id)
ORDER BY vendor_name

/*
USE ap;
SELECT vendor_name  AS 'Vendor Name',
	invoice_number AS 'Invoice Number',
    CAST(invoice_date AS DATETIME) AS 'Invoice Date/Time',
    CONCAT('$', FORMAT(invoice_total, 2)) AS 'Invoice Total'
FROM vendors
	JOIN invoices i USING(vendor_id)
WHERE invoice_date =
	(SELECT MAX(invoice_date)
	FROM invoices
    WHERE invoices.vendor_id = i.vendor_id)
ORDER BY vendor_name

USE ap;
SELECT DISTINCT vendor_name, 
	vendor_state
    FROM vendors JOIN invoices
		USING(vendor_id)
	JOIN invoice_line_items
		USING(invoice_id)
	WHERE line_item_amount > 3000
    ORDER BY vendor_name
*/
