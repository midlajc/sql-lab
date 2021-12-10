2

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
    (
        (
            bank_customer.bank_customer bc 
            LEFT JOIN bank_customer.loan l
            ON (bc.accno=l.accno)
        )LEFT JOIN bank_customer.deposit d 
            ON (bc.accno=d.accno)
    )
    WHERE (d.deposit_no!='' AND l.loan_no IS NULL);

#Display the customers along with loan amount who have only loan with the bank
    SELECT * FROM 
    (
        (
            bank_customer.bank_customer bc 
            LEFT JOIN bank_customer.loan l
            ON (bc.accno=l.accno)
        )LEFT JOIN bank_customer.deposit d 
            ON (bc.accno=d.accno)
    )
    WHERE (l.loan_no!='' AND d.deposit_no IS NULL);

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


#Display the customer who have neither a loan nor a deposit with the bank 

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