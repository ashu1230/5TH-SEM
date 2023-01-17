--Q1. WAP in PL/SQL for addition of two numbers. 

declare

x number(5);			
y number(5);		
z number(7);	

begin

x:=10;				

y:=20;				

z:=x+y;				

dbms_output.put_line('Sum is '||z);

end;
