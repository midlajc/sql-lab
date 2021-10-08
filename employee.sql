DROP DATABASE IF EXISTS employee;

#Create a table employee with fields (EmpID, EName, Salary, Department, and Age).Insert some records. Write SQL queries using aggregate functions and group by clause

    CREATE DATABASE employee;

    USE employee;

    CREATE TABLE employee(
        EmpID VARCHAR(10) PRIMARY KEY,
        EName VARCHAR(25) NOT NULL,
        Salary VARCHAR(10),
        Department VARCHAR(15),
        Age INT(3)
    );

    DESC employee;

#Insert some records

    INSERT INTO employee(EmpID,EName,Salary,Department,Age)
    VALUES ("EP001","Vikram Hassan","200000","HR",25),
    ("EP002","Reema Wheatley","250000","IT",28),
    ("EP003","Aurora Blanchard","100000","PLANNING",30),
    ("EP004","Iris Forster","150000","PURCHASE",20),
    ("EP005","Hayleigh Floyd","180000","PURCHASE",23),
    ("EP006","Muhammed Arshad","500000","PLANNING",20),
    ("EP007","Muhammed Ali","500000","SALES",20),
    ("EP008","Midlaj C","1","MANAGEMENT",19),
    ("EP009","Minha","500000","OPERATION",20),
    ("EP010","Mubashir Ali","500000","PURCHASE",20)
    ;
    
#Display the total number of employees.

    SELECT COUNT(*) FROM employee;

#Display the name and age of the oldest employee of each department.

    SELECT ANY_VALUE(EName) AS "EName",MAX(Age) AS Age,Department from employee GROUP BY Department ORDERED BY Age;

#Display the average age of employees of each department

    SELECT AVG(Age) AS Age,Department FROM employee GROUP BY Department;

#Display departments and the average salaries    

    SELECT AVG(Salary) AS Salary,Department FROM employee GROUP BY Department;

#Display the lowest salary in employee table

    SELECT MIN(Salary) FROM employee;

#Display the number of employees working in purchase department

    SELECT COUNT(*) FROM employee WHERE Department="PURCHASE";

#Display the highest salary in sales department;

    SELECT MAX(Salary) FROM employee WHERE Department="SALES";

#Display the difference between highest and lowest salary    

    SELECT MAX(Salary)-MIN(Salary) FROM employee;