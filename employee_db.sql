-- Consider the employee database given below. Give an expression in SQL for each of the following queries:
-- EMPLOYEE (Employee-Name, City)
-- WORKS (Employee-Name, Company-Name, Salary)
-- COMPANY (Company-Name, City)
-- MANAGES (Employee-Name, Manager-Name)

DROP DATABASE IF EXISTS employee;

    CREATE DATABASE employee;

    use employee;

    CREATE TABLE company(
        cmp_id VARCHAR(10) PRIMARY KEY,
        cmp_name VARCHAR(20) NOT NULL,
        city VARCHAR(20)
    );

    CREATE TABLE employee(
        emp_id VARCHAR(10) PRIMARY KEY,
        emp_name VARCHAR(20)NOT NULL,
        city VARCHAR(20) NOT NULL
    );

    CREATE TABLE works(
        emp_id VARCHAR(10) NOT NULL,
        cmp_id VARCHAR(10) NOT NULL,
        salary INT(10) NOT NULL,
        FOREIGN KEY (emp_id) REFERENCES employee(emp_id),
        FOREIGN KEY (cmp_id) REFERENCES company(cmp_id)
    );

    CREATE TABLE manager(
        emp_id VARCHAR(10) NOT NULL,
        manager_name VARCHAR(20) NOT NULL,
        FOREIGN KEY (emp_id) REFERENCES employee(emp_id)
    );

    INSERT INTO employee
    VALUES("EMP0001","MIDLAJ C","WAYANAD"),
    ("EMP0002","MINHA","WAYANAD"),
    ("EMP0003","MINHAJ","WAYANAD"),
    ("EMP0004","ANSIL","CALICUT"),
    ("EMP0005","EDWIN","MALAPPURAM"),
    ("EMP0006","ASLAM","PALAKKADU");

    INSERT INTO company
    VALUES("CMP0001","INFOSYS","Bengaluru"),
    ("CMP0002","INFOSYS","CALICUT"),
    ("CMP0003","WIPRO","KOCHI");

    INSERT INTO manager
    VALUES("EMP0001","MIDLAJ"),
    ("EMP0002","MIDLAJ"),
    ("EMP0003","MIDLAJ"),
    ("EMP0004","MIDLAJ"),
    ("EMP0005","MIDLAJ"),
    ("EMP0006","MIDLAJ");

    INSERT works
    VALUES("EMP0001","CMP0001","1000000"),
    ("EMP0002","CMP0001","1000000"),
    ("EMP0003","CMP0003","500000"),
    ("EMP0004","CMP0002","2000000"),
    ("EMP0005","CMP0002","800000"),
    ("EMP0006","CMP0003","900000");
    
-- A) Find the names of all employees who work in Infosys

    SELECT 
        e.emp_id,
        e.emp_name,
        c.cmp_name
    FROM
    (
        (
            employee.employee e
            LEFT JOIN employee.works w
            ON(e.emp_id=w.emp_id)
        )LEFT JOIN employee.company c
        ON(w.cmp_id=c.cmp_id)
    )
    WHERE c.cmp_name="INFOSYS";

-- B) Find the names and cities of residence of all employees who works in Wipro

    SELECT 
        e.emp_id,
        e.emp_name,
        e.city
    FROM
    (
        (
            employee.employee e
            LEFT JOIN employee.works w
            ON(e.emp_id=w.emp_id)
        )LEFT JOIN employee.company c
        ON(w.cmp_id=c.cmp_id)
    )
    WHERE c.cmp_name="WIPRO";

-- C) Find the names, and cities of all employees who work in Infosys and earn more than Rs. 10,000.

    SELECT 
        e.emp_id,
        e.emp_name,
        e.city,
        w.salary
    FROM
    (
        (
            employee.employee e
            LEFT JOIN employee.works w
            ON(e.emp_id=w.emp_id)
        )LEFT JOIN employee.company c
        ON(w.cmp_id=c.cmp_id)
    )
    WHERE c.cmp_name="INFOSYS" AND w.salary>10000;

-- D) Find the employees who live in the same cities as the companies for which they work.

    SELECT 
        e.emp_id,
        e.emp_name,
        e.city as "residence",
        c.city as "compani office"
    FROM
    (
        (
            employee.employee e
            LEFT JOIN employee.works w
            ON(e.emp_id=w.emp_id)
        )LEFT JOIN employee.company c
        ON(w.cmp_id=c.cmp_id)
    )
    WHERE c.city=e.city;

-- E) Find all employees who do not work in Wipro Corporation.

    SELECT 
        e.emp_id,
        e.emp_name,
        e.city,
        c.cmp_name
    FROM
    (
        (
            employee.employee e
            LEFT JOIN employee.works w
            ON(e.emp_id=w.emp_id)
        )LEFT JOIN employee.company c
        ON(w.cmp_id=c.cmp_id)
    )
    WHERE c.cmp_name!="WIPRO";

-- F) Find the company that has the most employees

    SELECT
    cu.cmp_name,
    MAX(cu.count) AS 'emp_count'
    FROM
    (
        SELECT 
        c.cmp_name,
        COUNT(c.cmp_name) AS 'count'
        FROM
        (    
            employee.works w
            LEFT JOIN employee.company c
            ON(w.cmp_id=c.cmp_id)
        )
        GROUP BY c.cmp_name
    ) cu;