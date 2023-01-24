create table client_master (
 client_no varchar(6),
 name varchar(20),
 city varchar(15),
 state varchar(15),
 pincode int(6),
 bal_due decimal(10, 2)
);

create table product_master (
 product_no varchar(6),
 description varchar(20),
 profit_percent decimal(10, 2),
 unit_measure varchar(15),
 qty_on_hand int(6),
 reorder_lvl int(6),
 sell_price decimal(10, 2),
 cost_price decimal(10, 2)
);

insert into client_master
values(
 '0001',
 'Ivan',
 'Bombay',
 'Maharashtra',
 400054,
 15000
 ),
 (
 '0002',
 'Vandana',
 'Madras',
 'Tamilnadu',
 780001,
 0
 ),
 (
 '0003',
 'Pramada',
 'Bombay',
 'Maharashtra',
 400057,
 5000
 ),
 (
 '0004',
 'Basu',
 'Bombay',
 'Maharashtra',
 400056,
 0
 ),
 ('0005', 'Ravi', 'Delhi', 'Delhi', 100001, 2000),
 (
 '0006',
 'Rukmini',
 'Bombay',
 'Maharashtra',
 400050,
 0
 );
 
insert into product_master
values (
 'P00001',
 '1.44floppies',
 5,
 'piece',
 100,
 20,
 525,
 500
 ),
 (
 'P03453',
 'Monitors',
 6,
 'piece',
 10,
 3,
 12000,
 11200
 ),
 ('P06734', 'Mouse', 5, 'piece', 20, 5, 1050, 500),
 (
 'P07865',
 '1.22 floppies',
 5,
 'piece',
 100,
 20,
 525,
 500
 ),
 (
 'P07868',
 'Keyboards',
 2,
 'piece',
 10,
 3,
 3150,
 3050
 ),
 (
 'P07885',
 'CD Drive',
 2.5,
 'piece',
 10,
 3,
 5250,
 5100
 ),
 (
 'P07965',
 '540 HDD',
 4,
 'piece',
 10,
 3,
 8400,
 8000
 ),
 (
 'P07975',
 '1.44 Drive',
 5,
 'piece',
 10,
 3,
 1050,
 1000
 ),
 (
 'P08865',
 '1.22 Drive',
 5,
 'piece',
 2,
 3,
 1050,
 1000
 );
 
select name
from client_master;
select name,
 city
from client_master;
select description
from product_master;
select name
from client_master
where city = 'Bombay';
select *
from client_master
where client_no = '0001'
 or client_no = '0002';
select *
from product_master
where description = '1.44 drive'
 or description = '1.22 Drive';
select *
from product_master
where sell_price > 5000;
select *
from client_master
where city = 'Bombay'
 or city = 'Delhi'
 or city = 'Madras';
select *
from product_master
where sell_price > 2000
 and sell_price <= 5000;
select name,
 city,
 state
from client_master
where state != 'Maharashtra';
delete from client_master
where client_no = '0001';
update client_master
set city = 'Bombay'
where client_no = '0005';
update client_master
set bal_due = 1000
where client_no = '0001';
select *
from product_master
where sell_price > 1500;
select *
from client_master
where city like '_a%';
select *
from client_master
where name like '_a%';
select *
from product_master
order by description;
select count(*)
from product_master;
select avg(sell_price)
from product_master;
select min(sell_price)
from product_master;
select max(sell_price)
from product_master;
select min(sell_price) as min_price,
 max(sell_price) as max_price
from product_master;
select count(*)
from product_master
where sell_price >= 1500;
create table sales_master(
 salesman_no varchar(6) primary key,
 sal_name varchar(20) not null,
 address varchar(20) not null,
 city varchar(20),
 state varchar(20),
 pincode int(6),
 sal_amt decimal(8, 2) not null,
 tgt_to_get decimal(6, 2) not null,
 ytd_sales decimal(6, 2) not null,
 remarks varchar(30),
 constraint chk_salesman_no check(
 salesman_no like 's%'
 and sal_amt > 0
 and tgt_to_get > 0
 and ytd_sales > 0
 )
 
);

create table sales_order(
 s_order_no varchar(6),
 s_order_date date not null,
 client_no varchar(25) not null,
 -- dely_add varchar(6) not null,
 dely_type char(1) default 'f',
 billed_yn char(1) default 'n',
 salesman_no varchar(6) not null,
 dely_date date not null,
 order_status varchar(10) not null,
 primary key(s_order_no, s_order_date),
 constraint first_letter_s_order_no check(s_order_no like '0%'),
 constraint fk_client_no foreign key(client_no) references client_master(client_no),
 constraint fk_salesman_no foreign key(salesman_no) references salesman_master(salesman_no),
 constraint c1 check(dely_type in ('p', 'f')),
 constraint billed_yn_check check(
 (billed_yn in ('y', 'n'))
 and (order_status in ('Ip', 'F', 'Bo', 'C'))
 and (dely_date >= s_order_date)
 )
);
create table sales_order_details(
 s_order_no varchar(6),
 product_no varchar(6),
 qty_order int(8),
 qty_disp int(8),
 product_rate decimal(10, 2),
 primary key(s_order_no, product_no),
 constraint fk_s_order_no foreign key(s_order_no) references sales_order(s_order_no),
 constraint fk_product_no foreign key(product_no) references product_master(product_no)
);

insert into sales_master
values (
 's00001',
 'Kiran',
 'A/14 worli',
 'Bombay',
 'Mah',
 '400002',
 3000,
 100,
 50,
 'Good'
 ),
 (
 's00002',
 'Raj',
 'A/14 worli',
 'Bombay',
 'Mah',
 '400002',
 3000,
 100,
 50,
 'Good'
 ),
 (
 's00003',
 'Ravi',
 'P-7 Bandra',
 'Bombay',
 'Mah',
 '400032',
 3000,
 200,
 100,
 'Good'
 ),
 (
 's00004',
 'Ashish',
 'A/5 Juhu',
 'Bombay',
 'Mah',
 '400044',
 3500,
 200,
 150,
 'Good'
 );
insert into sales_order
values (
 '019001',
 '1996-01-12',
 '0001',
 'F',
 'N',
 's0001',
 '1996-01-20',
 'Ip'
 ),
 (
 '019002',
 '1996-01-25',
 '0002',
 'P',
 'N',
 's0002',
 '1996-01-27',
 'C'
 ),
 (
 '019003',
 '1996-01-12',
 '0003',
 'F',
 'N',
 's0003',
 '1996-01-20',
 'Ip'
 ),
 (
 '016865',
 '1996-02-18',
 '0003',
 'F',
 'Y',
 's00003',
 '1996-02-20',
 'F'
 ),
 (
 '019003',
 '1996-04-03',
 '0001',
 'F',
 'Y',
 's00001',
 '1996-04-07',
 'F'
 ),
 (
 '046866',
 '1996-05-20',
 '0004',
 'P',
 'N',
 's00002',
 '1996-05-22',
 'C'
 ),
 (
 '010008',
 '1996-05-24',
 '0005',
 'F',
 'N',
 's00004',
 '1996-05-26',
 'Ip'
 );
insert into sales_order_details
values ('019001', 'P00001', 4, 4, 525),
 ('019001', 'P07965', 2, 1, 8400),
 ('019001', 'P07885', 2, 1, 5250),
 ('019002', 'P00001', 10, 0, 525),
 ('046865', 'P07868', 3, 3, 3150),
 ('046865', 'P07885', 10, 10, 5250),
 ('019003', 'P00001', 4, 4, 1050),
 ('019003', 'P03453', 2, 2, 1050),
 ('046866', 'P06734', 1, 1, 12000),
 ('046866', 'P07965', 1, 0, 8400),
 ('010008', 'P07975', 1, 0, 1050),
 ('010008', 'P00001', 10, 5, 525);
create table challan_header(
 challan_no varchar(6) primary key,
 s_order_no varchar(6) references sales_order(s_order_no),
 challan_date date not null,
 billed_yn char(1) default 'N' check(billed_yn in ('Y', 'N'))
);

create table challan_details(
 challan_no varchar(6),
 product_no varchar(6) references product_master(product_no),
 qty_disp decimal(4, 2) not null,
 primary key(challan_no, product_no)
);
insert into challan_header
values ('CH9001', '019001', "1995-12-12", 'Y'),
 ('CH865', '046865', "1995-11-12", 'Y'),
 ('CH3965', '010008', "1995-10-12", 'Y');
insert into challan_details
values ('CH9001', 'P00001', 4),
 ('CH9001', 'P07965', 1),
 ('CH9001', 'P07885', 1),
 ('CH6865', 'P07868', 3),
 ('CH6865', 'P03453', 4),
 ('CH6865', 'P00001', 10),
 ('CH3965', 'P00001', 5),
 ('CH3965', 'P07975', 2);
alter table client_master
add primary key(client_no);
alter table client_master
add phone_no varchar(10);
alter table product_master
modify description varchar(20) not null,
 modify profit_percent decimal(5, 2) not null,
 modify sell_price decimal(10, 2) not null,
 modify cost_price decimal(10, 2) not null;
alter table client_master
modify client_no varchar(4);
select product_no,
 description
from product_master
where profit_percent between 20 and 30;

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
-- 5. List the product_no and s_order_no of customers haaving qty ordered less than 5 from the order 
details table for the product "1.44 floppies".
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
-- 8. Find the order No,, Client No and salesman No. where a client has been received by more than one 
salesman.
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
-- select p.product_no , p.description , sum(sod.qty_order) from product_master p , sales_order_details 
sod where p.product_no = sod.product_no group by p.product_no;
-- Q9.- Display the order number and day on which clients placed their order.
select s_order_no,
 dayname(s_order_date)
from sales_order;
-- Q10.- Display the month and Date when the order must be delivered.
select monthname(dely_date),
 day(dely_date)
from sales_order;
-- 1. Find the product_no and description of non- moving products.
select product_no,
 description
from product_master
where product_no not in (
 select product_no
 from sales_order_details
 where s_order_no in (
 select s_order_no
 from sales_order
 where order_status = 'Ip'
 )
 );
-- 2. Find the customer name, city and pincode for the client who has placed order no “019001”
select name,
 city,
 pincode
from client_master
where client_no in (
 select client_no
 from sales_order
 where s_order_no = '019001'
 );
-- 3. Find the client names who have placed order before the month of may 96.
select name
from client_master
where client_no in (
 select client_no
 from sales_order
 where s_order_date < '1996-05-01'
 );
-- 4. Find out if product “1.44 Drive” is ordered by only client and print the client_no name to whom it 
was sold.
select client_no,
 name
from client_master
where client_no in (
 select client_no
 from sales_order
 where s_order_no in (
 select s_order_no
 from sales_order_details
 where product_no = 'P00001'
 )
 );
-- 5. find the names of client who have placed orders worth Rs.10000 or more.
select name
from client_master
where client_no in (
 select client_no
 from sales_order
 where s_order_no in (
 select s_order_no
 from sales_order_details
 where qty_order * product_rate >= 10000
 )
 );
-- 6. Select the orders placed by ‘Rahul Desai”
select s_order_no
from sales_order
where client_no in (
 select client_no
 from client_master
 where name = 'Rahul Desai'
 );
-- 7. Select the names of persons who are in Mr. Pradeep’s department and who have also worked on an 
inventory control system.
-- select name from emp where name= 'Pradeep' and pname = 'Inventory Control System';
-- 8. Select all the clients and the salesman in the city of Bombay.
select name
from client_master
where city = 'Bombay'
UNION
select sal_name
from sales_master
where city = 'Bombay';
-- 9. Select salesman name in “Bombay” who has atleast one client located at “Bombay”
select DISTINCT sal_name
from sales_master
where salesman_no in (
 select salesman_no
 from sales_order
 where client_no in (
 select client_no
 from client_master
 where city = 'Bombay'
 )
 );
-- 10. Select the product_no, description, qty_on-hand,cost_price of non_moving items in the 
product_master table.
select product_no,
 description,
 qty_on_hand,
 cost_price
from product_master
where product_no not in (
 select product_no
 from sales_order_details
 where s_order_no in (
 select s_order_no
 from sales_order
 where order_status = 'Ip'
 )
 );
-- 1. Create an index on the table client_master, field client_no.
create index client_no_index on client_master(client_no);
-- 2. Create an index on the sales_order, field s_order_no.
create index s_order_no_index on sales_order(s_order_no);
-- 3. Create an composite index on the sales_order_details table for the columns s_order_no and 
product_no.
create index s_order_no_product_no_index on sales_order_details(s_order_no, product_no);
-- 4. Create an composite index ch_index on challan_header table for the columns challan no and 
s_order_no.
--
create index ch_index on challan_header(challan_no, s_order_no);
-- 5. Create an uniQuestion index on the table salesman_master, field salesman_no.
create unique index salesman_no_index on sales_master(salesman_no);
-- 6. Drop index ch_index on table challan_header.
drop index ch_index on challan_header;
-- 7. Create view on salesman_master whose sal_amt is less than 3500.
create view salesman_view as
select *
from sales_master
where sal_amt < 3500;
-- 8. Create a view client_view on client_master and rename the columns as name, add1, add2, city, 
pcode, state respectively.
create view client_view as
select name,
 city,
 pincode as pcode,
 state
from client_master;
-- 9. Select the client names from client_view who lives in city ‘Bombay’.
select name
from client_view
where city = 'Bombay';
-- 10. Drop the view client_view.
drop view client_view;
-- <div style="page-break-after: always;"></div>
