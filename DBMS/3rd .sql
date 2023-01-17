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
    
