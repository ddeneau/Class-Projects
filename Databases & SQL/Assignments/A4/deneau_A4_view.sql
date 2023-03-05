-- Answer 1 --
USE ap;
CREATE VIEW late_invoices_2018 AS
	SELECT vendor_name, invoice_number, invoice_total, 
		DATE_FORMAT(invoice_due_date, '%a, %b, %D') AS 'due_date',
        DATE_FORMAT(payment_date, '%a, %b, %D') AS 'payment_date',
        DATEDIFF(payment_date, invoice_due_date) AS 'days_late'
		FROM vendors JOIN invoices USING(vendor_id)
		WHERE DATEDIFF(payment_date, invoice_due_date) > 0 OR payment_date IS NULL
	ORDER BY vendor_name, DATEDIFF(payment_date, invoice_due_date) DESC, invoice_total DESC;
    