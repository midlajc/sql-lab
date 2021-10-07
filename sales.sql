DROP DATABASE IF EXISTS sales;

#Create a table sales_man ( salesman_no primary key, s_name not null, place,phone unique)

    CREATE DATABASE sales;

    USE sales;

    CREATE TABLE sales_man (
        salesman_no VARCHAR(10),
        s_name VARCHAR(20) NOT NULL,
        place VARCHAR(10),
        phone INT(10),
        CONSTRAINT salesman_no_prk PRIMARY KEY(salesman_no)
    );

    DESCRIBE sales_man;

/*Create table sales_order (order_no primary key order_date not null salesman_no foreign key references 
salesman_no in sales_man del_type values should be either P or F (check constraints)order_status values
should be 'Inprocess','Fullfilled','Backorder', 'Cancelled' (checkconstraints))*/

    CREATE TABLE sales_order(
        order_no VARCHAR(10),
        order_date date NOT NULL,
        salesman_no VARCHAR(10),
        del_type CHAR(1) ,
        order_status VARCHAR(10),
        CONSTRAINT salesman_no_fgk FOREIGN KEY (salesman_no) REFERENCES sales_man(salesman_no),
        CONSTRAINT del_type_const CHECK (del_type='P' OR del_type='F'),
        CONSTRAINT order_status_const CHECK (order_status IN ('Inprocess','Fullfilled','Backorder', 'Cancelled')),
        CONSTRAINT order_no_prk PRIMARY KEY (order_no)
    );

    DESCRIBE sales_order;

    #insert into sales_order(order_no,order_date,del_type) values("2","2021-10-06","A");
    #ERROR 3819 (HY000): Check constraint 'del_type_const' is violated.

    #insert into sales_order(order_no,order_date,del_type,order_status) values("2","2021-10-06","P","HELLO");
    #ERROR 3819 (HY000): Check constraint 'order_status_const' is violated.
    

#Insert few records in both tables

    INSERT INTO sales_man(salesman_no,s_name,place,phone)
    VALUES("1","Steve Jobs","US","1000000"),
    ("2","Bill Gates","US","200000"),
    ("3","Elon Musk","US","300000"),
    ("4","Jeff Bezos","US","400000"),
    ("5","Mark Zuckerberg","US","50000");

    SELECT * FROM sales_man;

    INSERT INTO sales_order(order_no,order_date,salesman_no,del_type,order_status)
    VALUES("1","2021-10-06",1,"P","Fullfilled"),
    ("2","2021-10-06",2,"P","Inprocess"),
    ("3","2021-10-06",3,"P","Fullfilled"),
    ("4","2021-10-06",4,"P","Backorder"),
    ("5","2021-10-06",5,"F","Cancelled");

    SELECT * FROM sales_order;

#Delete Foreign key and Check constraints from sales_order table

    ALTER TABLE sales_order DROP CONSTRAINT salesman_no_fgk;

    ALTER TABLE sales_order DROP CONSTRAINT order_status_const;

    ALTER TABLE sales_order DROP CONSTRAINT del_type_const;

    DESC sales_order;

#Delete primary key from sales_man table

    ALTER TABLE sales_man DROP PRIMARY KEY;

    DESC sales_man;

#Add primary key in sales_man using ALTER TABLE

    ALTER TABLE sales_man ADD CONSTRAINT salesman_no_prk PRIMARY KEY(salesman_no);

    DESC sales_man;

#Add foreign key and CHECK constraints in sales_order table using ALTER TABLE

    ALTER TABLE sales_order ADD CONSTRAINT salesman_no_fgk FOREIGN KEY (salesman_no) REFERENCES sales_man(salesman_no);

    ALTER TABLE sales_order ADD CONSTRAINT order_status_const CHECK (order_status IN ('Inprocess','Fullfilled','Backorder', 'Cancelled'));

    ALTER TABLE sales_order ADD CONSTRAINT del_type_const CHECK (del_type='P' OR del_type='F');

    DESC sales_order;