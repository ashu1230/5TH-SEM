
select b.book_id,
    b.title,
    b.publisher_name,
    ba.author_name,
    bc.no_of_copies,
    lb.branch_name,
    lb.address
    
from book b,
    book_authors ba,
    book_copies bc,
    library_branch lb
    
where b.book_id = ba.book_id
    and b.book_id = bc.book_id
    and bc.branch_id = lb.branch_id;
    
select bl.card_no,
    bl.date_out,
    bl.due_date
    
from book_lending bl

where bl.date_out between '01-JAN-17' and '30-JUN-17'

group by bl.card_no
having count(bl.card_no) > 3;

delete from book
where book_id = 'B0001';

select *
from book
where pub_year between 2000 and 2005;

create view book_view as

select b.book_id,
    b.title,
    b.publisher_name,
    ba.author_name,
    bc.no_of_copies,
    lb.branch_name,
    lb.address
    
from book b,
    book_authors ba,
    book_copies bc,
    library_branch lb
    
where b.book_id = ba.book_id
    and b.book_id = bc.book_id
    and bc.branch_id = lb.branch_id;
    
