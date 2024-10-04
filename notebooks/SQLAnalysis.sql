select *
from customers c
join orders o
on c.customer_id = o.order_customer_id;

select count(sale_id) from sales;

select customer_segment, sum(sales) from sales
group by customer_segment;

-- Total sales by market
select market, sum(sales) as total_sales
from orders o
join sales s
on o.order_id = s.order_id
group by market
order by total_sales desc;

-- Average profit by market
SELECT market, AVG(s.profit_margin) AS avg_profit_margin
FROM orders o
JOIN sales s ON o.order_id = s.order_id
GROUP BY market
ORDER BY avg_profit_margin DESC;

-- Total orders by market
SELECT market, COUNT(o.order_id) AS total_orders
FROM orders o
GROUP BY market
ORDER BY total_orders DESC;


SELECT 
    market,
    customer_state,
    total_sales
FROM (
    SELECT
        o.market,
        c.customer_state,
        SUM(s.sales) AS total_sales,
        RANK() OVER (PARTITION BY o.market ORDER BY SUM(s.sales) DESC) AS market_rank
    FROM
        orders o
    JOIN
        customers c ON o.order_customer_id = c.customer_id
    JOIN
        sales s ON o.order_id = s.order_id
    GROUP BY
        o.market, c.customer_state
) ranked_sales
WHERE 
    market_rank = 1;