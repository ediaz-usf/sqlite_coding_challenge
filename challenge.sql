-- task 1

SELECT 
    c.id,
    first_name,
    last_name,
    product_id,
   sum(quantity * unit_price) AS total_spent
from customers c
join orders o on c.id = o.customer_id
join order_items oi on o.id = oi.order_id
group by c.id, first_name, last_name
order by total_spent desc
limit 5;




