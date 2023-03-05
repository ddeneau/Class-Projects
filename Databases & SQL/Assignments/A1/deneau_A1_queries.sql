/* Answer 1 */
SELECT CONCAT(customer_last_name, ', ', customer_first_name) 
	   AS 'Customer Name',
       CONCAT('Contact #: ', SUBSTRING(customer_phone, 1, 3),'-',
			  SUBSTRING(customer_phone, 4, 3),'-',
			  SUBSTRING(customer_phone, 7, 10))
	   AS 'Customer Contact Number',
	   CONCAT(customer_address, ', ', customer_city, ', ', customer_state, ' ', customer_zip)
       AS 'Customer Address'
	FROM om.customers
    WHERE customer_last_name  < 'F' AND customer_last_name > 'B'  
ORDER BY customer_last_name;


/* Answer 2 */
(SELECT order_id AS 'Order ID', 
	   CONCAT(customer_first_name,' ' ,customer_last_name) AS 'Customer Name' , 
       order_date, IFNULL(shipped_date,'Not Yet Shipped') shipped_date
	FROM om.orders JOIN om.customers
		USING(customer_id)
    WHERE order_date >= '2018-07-11')
UNION
(SELECT order_id, CONCAT(customer_first_name,' ' ,customer_last_name), 
	   order_date, shipped_date
	FROM om.customers JOIN om.orders
		USING(customer_id)
    WHERE shipped_date >= '2018-07-13')
ORDER BY 'Order ID';

/* Answer 3 */
SELECT vendor_name AS 'Vendor Name', CONCAT(first_name, ' ', last_name) AS 'Contact Full Name', 
	   invoice_id AS 'Invoice ID', 
	   invoice_total - payment_total - credit_total AS 'Balance Due'
    FROM ap.vendors
        NATURAL JOIN ap.vendor_contacts
        LEFT JOIN ap.invoices
            USING (vendor_id)
ORDER BY vendor_name;


