-- Get a list of the 3 long-standing customers for each country
WITH customer_info AS ( 
SELECT customerid,countryfrom customers 
, 
country_info
select customerid,country sum (total) from customer_info group by customerid,country
),
top_customers as 
SELECT *,
	RANK() OVER(PARTITION BY country ORDER BY total DESC)
FROM customer_country
)
SELECT *
FROM top_customers
WHERE rank <= 3; 


-- Modify the previous query to get the 3 newest customers in each each country.
with order_info(
 select  orderid, customerid ,sum(quantity)
	from orders 
	JOIN order_details as od ON o.order_id = od.order_id
	JOIN customers as c ON o.customer_id = c.customer_id
	JOIN products as p ON od.product_id = p.product_id
	), 
	order_detail
	select customerid,sum(unitsonorder) as total
	country,
from order_info
group by customerid ,total,

top_order as ( --customers ranked by total WITHIN the country they live
SELECT *,
	RANK() OVER(PARTITION BY total ORDER BY country DESC)
FROM order_info
)
SELECT *
FROM order_info
WHERE rank <= 3

-- Get the 3 most frequently ordered products in each city
-- FOR SIMPLICITY, we're interpreting "most frequent" as 
-- "highest number of total units ordered within a country"
-- hint: do something with the quanity column