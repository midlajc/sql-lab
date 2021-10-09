DROP DATABASE IF EXISTS prime;

#Create a function to check whether a given number is prime or not

    CREATE DATABASE prime;

    use prime;

    DELIMITER /

    CREATE PROCEDURE print(IN thetext TEXT)
    BEGIN
        SELECT thetext AS '';
    END/

    CREATE PROCEDURE prime(IN num FLOAT)
    BEGIN
        DECLARE I FLOAT;
        DECLARE che FLOAT;
        DECLARE sta VARCHAR(1);
        SET sta="0";
        SET I=2;
        IF num<2 THEN
            CALL print("The Given Number is less Than 2");
        ELSE    
            WHILE I<num DO
                IF num%I=0 THEN
                    CALL print("The Given Number Is Not a Prime");
                    SET sta="1";
                END IF;
                SET I=I+1;
            END WHILE;
            IF sta=0 THEN   
                call print("The Given Number is Prime");
            END IF;
        END IF;
    END/

    DELIMITER ;       

    CALL prime(4);