-- Lab 3 --
USE om;
-- 1 -- Need to group by 
SELECT vendor_name,
	COUNT(invoice_id) AS invoice_count,
    CONCAT('$ ', FORMAT(
    SUM(invoice_total), 2)) AS invoice_total_sum,
	CONCAT('$ ', FORMAT(
    AVG(invoice_total), 2)) AS invoice_average
FROM ap.vendors
	JOIN ap.invoices
    USING(vendor_id)
GROUP BY vendor_name
ORDER BY invoice_count DESC;


-- 3 --
SELECT vendor_name, COUNT(DISTINCT account_number) AS number_of_accounts
FROM ap.vendors
	INNER JOIN ap.invoices USING(vendor_id)
    INNER JOIN ap.invoice_line_items USING(invoice_id)
    GROUP BY vendor_name
    HAVING number_of_accounts > 1;
    
-- 4 --
SELECT vendor_name
	FROM ap.vendors
    WHERE vendor_id IN
		(SELECT DISTINCT vendor_id FROM ap.invoices)
	ORDER BY vendor_name;
    
-- 5 --
SELECT invoice_number, invoice_total
	FROM ap.invoices
    WHERE payment_total > 
		(SELECT AVG(payment_total) FROM ap.invoices
			WHERE payment_total > 0)
    ORDER BY invoice_total DESC;
