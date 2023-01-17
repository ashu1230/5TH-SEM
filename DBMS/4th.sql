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

