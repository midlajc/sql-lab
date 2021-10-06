
DROP DATABASE IF EXISTS customer;

#Create a table customer (cust_no varchar (5), cust_name varchar (15), age number,phone varchar (10))

    CREATE DATABASE customer;
    USE customer;
    CREATE TABLE customer (
        cust_no varchar(5) primary key,
        cust_name varchar(15) not null,
        age INT(3),
        phone varchar(10)
    );

    DESCRIBE customer;

#insert 5 records and display it

    INSERT INTO customer (cust_no, cust_name, age, phone)
    VALUES ("cs1", "akhil", 22, "3413379793"),
        ("cs2", "amal", 21, "4396016943"),
        ("cs3", "ansil", 20, "2345098948"),
        ("cs4", "edwin", 20, "3231275920"),
        ("cs5", "aslam", 20, "1234567890");

    SELECT * FROM customer;

#add new field d_birth with date datatype

    ALTER TABLE customer add d_birth date;

    DESCRIBE customer;

#create another table cust_phone with fields cust_name and phone from customer table

    CREATE TABLE cust_phone (SELECT cust_name,phone from customer);

    DESCRIBE cust_phone;

    SELECT * FROM cust_phone;

#remove the field age

    ALTER TABLE customer drop age;

    DESCRIBE customer;

#change the size of the cust_name to 25

    ALTER TABLE customer MODIFY cust_name varchar(25);
    
    DESCRIBE customer;

#delete all the records from the table

    DELETE FROM customer;

#rename the table cutomer to cust

    ALTER TABLE customer RENAME cust;
    
    SHOW TABLES;

#drop the table

    DROP TABLE cust;
    
    DROP TABLE cust_phone;

    SHOW TABLES;
