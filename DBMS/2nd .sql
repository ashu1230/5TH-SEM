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

