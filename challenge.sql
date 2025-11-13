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
order by total_revenue desc;

-- task 3

with department_avg_salaries as (
    SELECT 
        d.name,
        round(avg(e.salary), 2) avg_department_salary
    from employees e 
    join departments d on e.department_id = d.id
    group by d.name
)

SELECT
    concat(e.first_name, ' ', e.last_name) AS employee_name,
    d.name AS department_name,
    e.salary,
    das.avg_department_salary
from employees e
join departments d on e.department_id = d.id
join department_avg_salaries das on d.name = das.name
where e.salary > avg_department_salary
order by d.name, e.salary desc;

-- task 4

select 
    city,
    count(*) as gold_customer_count
from customers
where loyalty_level = 'Gold'
group by city
order by gold_customer_count, city desc;