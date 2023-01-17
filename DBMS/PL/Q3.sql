Q3. WAP in PL/SQL to check the given number is even or odd. 


DECLARE
	n NUMBER := 3;
	r NUMBER;
BEGIN
	r := MOD(n, 2);

	IF r = 0 THEN
	dbms_output.Put_line('Even');
	ELSE
	dbms_output.Put_line('Odd');
	END IF;
END;

