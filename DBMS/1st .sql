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
insert into client_master values(
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
