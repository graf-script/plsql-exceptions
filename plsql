DECLARE
    c_id customers.id%type := 8;
    c_name customers.name%type;
    c_addr customers.adress%type;
BEGIN
    SELECT name, adress INTO c_name, c_addr
    FROM customers
    WHERE id = c_id;
    DBMS_OUTPUT.PUT_LINE ('Name: ' || c_name);
    DBMS_OUTPUT.PUT_LINE ('Adress: ' || c_addr);
EXCEPTION
    WHEN no_data_found THEN
        dbms_output.put_line('No such customer!');
    WHEN others THEN
        dbms_output.put_line('Error!');        
END;
/

-- exceptions

-- программист может явно вызвать исключения с помощью команды RAISE

DECLARE
    exception_name EXCEPTION;
BEGIN
    IF condition THEN
        RAISE exception_name;
    END IF;
EXCEPTION
    WHEN exception_name THEN
    statement
END;

-- пользовательские исключения

DECLARE
    c_id customers.id%type := 0;
    c_name customers.name%type;
    c_addr customers.adress%type;
    -- user defined exception
    ex_invalid_id EXCEPTION;
BEGIN
    IF c_id <= 0 THEN
        RAISE ex_invalid_id;
    ELSE
        SELECT name, adress INTO c_name, c_addr
        FROM customers
        WHERE id = c_id;
        DBMS_OUTPUT.PUT_LINE ('Name: ' || c_name);
        DBMS_OUTPUT.PUT_LINE ('Adress: ' || c_addr);
    END IF;
EXCEPTION
    WHEN ex_invalid_id THEN
        dbms_output.put_line('ID must be greater than zero!');
    WHEN no_data_found THEN
        dbms_output.put_line('No such customer!');
    WHEN others THEN
        dbms_output.put_line('Error!');
END;
/

