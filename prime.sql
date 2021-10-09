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
    exit_label:BEGIN
        DECLARE I FLOAT;
        DECLARE che FLOAT;
        DECLARE sta VARCHAR(1);
        SET I=2;
        IF num<2 THEN
            CALL print("The Given Number is less Than 2");
        ELSE    
            WHILE I<num DO
                IF num%I=0 THEN
                    CALL print(CONCAT("The Given Number ",num," Is Not a Prime"));
                    LEAVE exit_label;
                END IF;
                SET I=I+1;
            END WHILE;
            CALL print(CONCAT("The Given Number ",num," is Prime"));
        END IF;
    END/

    DELIMITER ;       

    CALL prime(4);