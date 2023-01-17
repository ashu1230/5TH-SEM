---Q2. WAP in PL/SQL for addition of 1 to 100 numbers

Declare
a number;
sum1 number :=0;
Begin
a:=1;
loop
sum1:=sum1+a;
exit when (a=100);
a:=a+1;
end loop;
dbms_output.put_line('Sum between 1 to 100 is '||sum1);
End;

