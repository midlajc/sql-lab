#Write a program block to calculate the electricity bill by accepting cust_no and
#units_consumed

DROP DATABASE IF EXISTS electricity;

    CREATE DATABASE electricity;
    USE electricity;

    CREATE TABLE electricity_bill(
        cust_no VARCHAR(15),
        unit_used INT(5) NOT NULL,
        bill_date timestamp NOT NULL DEFAULT current_timestamp(),
        amount INT(10) NOT NULL
    );

    DELIMITER //

    CREATE PROCEDURE calc_bill(IN cust_no VARCHAR(10),IN unit_used INT)
    BEGIN
        DECLARE rate1,rate2,rate3,rate4,amount FLOAT;
        SET rate1=3.1;
        SET rate2=4.5;
        SET rate3=5.9;
        SET rate4=7;
        CASE
            WHEN unit_used<=120 AND unit_used>0 THEN
                SET amount=unit_used*rate1;
            WHEN unit_used<=250 THEN
                SET amount=unit_used*rate2;
            WHEN unit_used<=500 THEN
                SET amount=unit_used*rate3;
            WHEN unit_used>500 THEN
                SET amount=unit_used*rate4;
            ELSE SET amount=85;
        END CASE;
        INSERT INTO electricity_bill(cust_no,unit_used,amount)
        VALUES(cust_no,unit_used,amount);
    END//

    DELIMITER ;

    DESC electricity_bill;

    CALL calc_bill("CM0001",120);
    CALL calc_bill("CM0002",121);

    SELECT * FROM electricity_bill;