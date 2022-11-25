-- Q1.- Print the description and total quantity sold for each product.
select description,
    sum(qty_order)
from product_master p,
    sales_order_details s
where p.product_no = s.product_no
group by description;
-- Q2.- Find the value of each product sold.
select description,
    sum(qty_order * sell_price)
from product_master p,
    sales_order_details s
where p.product_no = s.product_no
group by description;
-- Q3.- Calculate the average quantity sold for each client that has a maximum order value of 15000
select client_no,
    avg(qty_order)
from sales_order_details s,
    sales_order so
where s.s_order_no = so.s_order_no
    and s.qty_order * s.product_rate <= 15000
group by client_no;
-- Q4.- Find out the products which has been sold to Ivan. -->
select description
from product_master p,
    client_master c,
    sales_order so,
    sales_order_details sod
where p.product_no = sod.product_no
    and c.client_no = so.client_no
    and so.s_order_no = sod.s_order_no
    and c.name = 'Ivan Sayross';
-- Q5.- Find the names of clients who have ‘CD Drive’.
select name from client_master c,
    sales_order so,
    sales_order_details sod,
    product_master p
where c.client_no = so.client_no
    and so.s_order_no = sod.s_order_no
    and sod.product_no = p.product_no
    and p.description = 'CD DRIVE';
-- Q6.- Find the products and their quantities for the orders placed by ‘Vandana’ and ‘Ivan’.
select product_no,
    qty_order
from sales_order_details sod,
    sales_order so,
    client_master c
where sod.s_order_no = so.s_order_no
    and so.client_no = c.client_no
    and c.name in ('Vandan Saitwal', 'Ivan Bayross');
-- Q7.- Select product_no, total qty_ordered for each product.
select product_no,
    sum(qty_order)
from sales_order_details
group by product_no;
-- Q8.- Select product_no, product description and qty ordered for each product.
-- select p.product_no , p.description , sum(sod.qty_order) from product_master p , sales_order_details sod where p.product_no = sod.product_no group by p.product_no;
-- Q9.- Display the order number and day on which clients placed their order.
select s_order_no,
    dayname(s_order_date)
from sales_order;
-- Q10.- Display the month and Date when the order must be delivered.
select monthname(dely_date),
    day(dely_date)
from sales_order;
