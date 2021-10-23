DROP DATABASE IF EXISTS bank_customer;

    CREATE DATABASE bank_customer;
    USE bank_customer;

#Bank_customer (accno primary key, cust_name, place)


    CREATE TABLE bank_customer (
        accno INT(10) PRIMARY KEY,
        cust_name VARCHAR(25) PRIMARY KEY,
        place VARCHAR(30)
    );

#Deposit (accno foreign key, deposit_no, damount)

    CREATE TABLE deposit(
        accno INT(10),
        deposit_no VARCHAR(10) PRIMARY KEY,
        damount INT(32),
        CONSTRAINT fk_accno FOREIGN KEY (accno) REFERENCES bank_customer(accno)
    );

#Loan (accno foreign key loan_no, Lamount)

    CREATE TABLE loan(
        accno INT(10),
        loan_no INT(15),
        lamount INT(32),
        CONSTRAINT fk_accno1 FOREIGN KEY(accno) REFERENCES bank_customer(accno) 
    );


    INSERT INTO bank_customer(accno,cust_name,place)
    VALUES("00001","MIDLAJ C","WAYANAD"),
    ("00002","MINHAJ","CALICUT"),
    ("00003","MINHA","WAYANAD"),
    ("00004","ANZIL","MALAPPURAM"),
    ("00005","AKHIL","PALAKKAD"),
    ("00006","EDWIN","IDUKKI");

    INSERT INTO deposit(accno,deposit_no,damount)
    VALUES("00001","00001","120000"),
    ("00001","00002","300000"),
    ("00003","00003","52000"),
    ("00002","00004","10000")
    ;

    INSERT INTO loan(accno,loan_no,lamount)
    VALUES("00005","00001","120000"),
    ("00004","00002","240000"),
    ("00002","00003","10000");



#Display the details of the customers

    SELECT * FROM 
    (
        (
            bank_customer.bank_customer bc 
            LEFT JOIN bank_customer.loan l
            ON (bc.accno=l.accno)
        )LEFT JOIN bank_customer.deposit d 
            ON (bc.accno=d.accno)
    );

#Display the customers along with deposit amount who have only deposit with the bank

    SELECT * FROM 
    (bank_customer.bank_customer bc LEFT JOIN bank_customer.deposit d 
    ON (bc.accno=d.accno))
    WHERE (d.deposit_no!='');

#Display the customers along with loan amount who have only loan with the bank
    SELECT * FROM 
    (bank_customer.bank_customer bc LEFT JOIN bank_customer.loan l
    ON (bc.accno=l.accno))
    WHERE (l.loan_no!='');

#Display the customers they have both loan and deposit with the bank

    SELECT * 
    FROM 
    (
        (
                bank_customer.bank_customer bc 
                LEFT JOIN bank_customer.loan l
                ON (bc.accno=l.accno)
        )LEFT JOIN bank_customer.deposit d 
            ON (bc.accno=d.accno)
    )
    WHERE (l.loan_no!='' AND d.deposit_no!='');


#Display the customer who have neither a loan nor a deposit with the banK    

    SELECT * FROM bank_customer
    WHERE accno NOT IN (
        SELECT bc.accno
        FROM
        (
            (
                bank_customer.bank_customer bc 
                LEFT JOIN bank_customer.loan l
                ON (bc.accno=l.accno)
            )LEFT JOIN bank_customer.deposit d 
                ON (bc.accno=d.accno)
        )
        WHERE (l.loan_no!='' OR d.deposit_no!='')
    );