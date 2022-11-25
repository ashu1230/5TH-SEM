-- 1. Find out the product which has been sold to 'Ivan Sayross'.
select product_no,
    description
from product_master
where product_no in (
        select product_no
        from sales_order_details
        where s_order_no in (
                select s_order_no
                from sales_order
                where client_no in (
                        select client_no
                        from client_master
                        where name = 'Ivan Sayross'
                    )
            )
    );
-- 2. Find out the product and their quantities that will have do delivered.
select product_no,
    qty_disp
from sales_order_details
where s_order_no in (
        select s_order_no
        from sales_order
        where dely_type = 'F'
    );
-- 3. Find the product_no and description of moving products.
select product_no,
    description
from product_master
where product_no in (
        select product_no
        from sales_order_details
        where s_order_no in (
                select s_order_no
                from sales_order
                where order_status = 'Ip'
            )
    );
-- 4. Find out the names of clients who have purchased 'CD DRIVE'
select name
from client_master
where client_no in (
        select client_no
        from sales_order
        where s_order_no in (
                select s_order_no
                from sales_order_details
                where product_no in (
                        select product_no
                        from product_master
                        where description = 'CD DRIVE'
                    )
            )
    );
-- 5. List the product_no and s_order_no of customers haaving qty ordered less than 5 from the order details table for the product "1.44 floppies".
select product_no,
    s_order_no
from sales_order_details
where product_no in (
        select product_no
        from product_master
        where description = '1.44 floppies'
    )
    and qty_order < 5;
-- 6. Find the products and their quantities for the orders placed by 'Vandan Saitwal ' and "Ivan Bayross".
select product_no,
    qty_order
from sales_order_details
where s_order_no in (
        select s_order_no
        from sales_order
        where client_no in (
                select client_no
                from client_master
                where name in ('Vandan Saitwal', 'Ivan Bayross')
            )
    );
-- 7. Find the products and their quantities for the orders placed by client_no " C00001" and "C00002"
select product_no,
    qty_order
from sales_order_details
where s_order_no in (
        select s_order_no
        from sales_order
        where client_no in ('C00001', 'C00002')
    );
-- 8. Find the order No,, Client No and salesman No. where a client has been received by more than one salesman.
select s_order_no,
    client_no,
    salesman_no
from sales_order
where client_no in (
        select client_no
        from sales_order
        group by client_no
        having count(salesman_no) > 1
    );
-- 9. Display the s_order_date in the format "dd-mon-yy" e.g. "12- feb-96"
select date_format(s_order_date, '%d-%b-%y')
from sales_order;
-- 10. Find the date , 15 days after date.
select date_format(
        date_add(s_order_date, interval 15 day),
        '%d-%b-%y'
    )
from sales_order;
