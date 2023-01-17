---Q4. WAP in PL/SQL to inverse a number, eg. Number 5639 when inverted must be display 
 --output 9365

Declare
num number:=&n;
rev number:=0;
Begin
while(num>0)
Loop
rev=rev*10+mod(num,10);
num=num/10;
End loop;
Dbms_Output.Put_Line("Reverse of number is '|| rev);
End;
 
 
 this is not completed programe and give error
 
