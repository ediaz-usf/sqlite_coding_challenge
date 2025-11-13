-- task 1

SELECT 
    concat(first_name, ' ', last_name) AS customer_name,
    sum(quantity * unit_price) AS total_spent
from customers c
join orders o on c.id = o.customer_id
join order_items oi on o.id = oi.order_id
group by first_name, last_name
order by total_spent desc
limit 5;

-- task 2

select 
    category,
    sum(quantity * unit_price) as total_revenue
from products p 
join order_items oi on p.id = oi.product_id
join orders o on oi.order_id = o.id
group by category
order by total_revenue desc


