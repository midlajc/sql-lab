DROP DATABASE IF EXISTS fibonacci;

#Create a procedure to print Fibonacci number up to a limit, limit is passed as an argument

    CREATE DATABASE fibonacci;

    USE fibonacci;

    DELIMITER /

    CREATE PROCEDURE print(IN thetext TEXT)
    BEGIN
        SELECT thetext AS '';
    END/

    CREATE PROCEDURE fibonacci(IN lm INT)
    BEGIN
        DECLARE A,B,C,I INT;
        SET A=-1,B=1,I=0;
        WHILE I<lm DO
            SET C=A+B;
            CALL print(C);
            SET A=B;
            SET B=C;
            SET I=I+1;
        END WHILE;
    END/                

    DELIMITER ;

    CALL fibonacci(9);
