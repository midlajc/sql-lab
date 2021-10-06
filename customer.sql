
DROP DATABASE IF EXISTS customer;

#CREATE

CREATE DATABASE customer;
USE customer;
CREATE TABLE customer (
    cust_no varchar(5) primary key,
    cust_name varchar(15) not null,
    age INT(3),
    phone varchar(10)
);

DESCRIBE customer;
select "\n\n";
#INSERT 5 VALUES

INSERT INTO customer (cust_no, cust_name, age, phone)
VALUES ("cs1", "akhil", 22, "3413379793"),
    ("cs2", "amal", 21, "4396016943"),
    ("cs3", "ansil", 20, "2345098948"),
    ("cs4", "edwin", 20, "3231275920"),
    ("cs5", "aslam", 20, "1234567890");
select "\n\n";
SELECT * FROM customer;

#ADD D_DATE TO CUSTOMER

ALTER TABLE customer add d_birth date;
DESCRIBE customer;

select "\n\n";
#CREATE CUST_PHONE FROM CUSTOMER

CREATE TABLE cust_phone (SELECT cust_name,phone from customer);
DESCRIBE cust_phone;
select "\n\n";
SELECT * FROM cust_phone;

select "\n\n";
#DROP AGE FROM CUSTOMER

ALTER TABLE customer drop age;
DESCRIBE customer;

select "\n\n";
#CHANGE CUSROMER.CUST_NAME TYPE TO VARCHAR(25)

ALTER TABLE customer MODIFY cust_name varchar(25);
DESCRIBE customer;

select "\n\n";
#RENAME CUSTOMER TO CUST

ALTER TABLE customer RENAME cust;
SHOW TABLES;

select "\n\n";
#DROP TABLES

DROP TABLE cust;
DROP TABLE cust_phone;


select "\n\n";
SHOW TABLES;
