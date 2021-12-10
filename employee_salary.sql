-- Prepare a salary report of the employees showing the details such as:
-- EmpNo, Name, Basic Pay, DA, Gross Salary, PF, Net Salary, Annual Salary and Tax
-- For this purpose, create a table named SALARIES having the following structure.

-- Field Name Type Width
-- EmpNo Character 10
-- Name Character 20
-- Basic Numeric 6

-- Enter the records of at least 10 employees. Use the following information for calculating the
-- details for the report:
-- DA is fixed as the 40% of the basic pay.
-- PF is fixed as 10% of the basic pay.
-- Gross Salary is (Basic Pay + DA).
-- Net Salary is (Gross Salary – PF)
-- Annual Salary is (12 * Net Salary)

-- Tax is calculated using the following rules:
-- If annual salary is less than 100000, No Tax
-- If annual salary is greater than 100000 but less than or equal to 150000, then the tax is 10%
-- of the excess over 100000.
-- If annual salary is greater than 150000 but less than or equal to 250000, then the tax is 20%
-- of the excess over 150000.
-- If annual salary is greater than 250000, then the tax is 30% of the excess over 250000.

DROP DATABASE IF EXISTS employee_salary;

    CREATE DATABASE employee_salary;
    
    use employee_salary;

    CREATE table employee_salary(
        emp_no VARCHAR(10) PRIMARY KEY,
        name VARCHAR(20) NOT NULL,
        basic_pay Numeric(6) NOT NULL,
        da Numeric(6),
        pf Numeric(6),
        gross_salary Numeric(8),
        net_salary Numeric(8),
        annual_salary Numeric(12),
        tax Numeric(8)
    );

    INSERT INTO employee_salary(emp_no,name,basic_pay)
    VALUES("EMP0001","MIDLAJ C",1),
    ("EMP0002","MINHA",900000),
    ("EMP0003","MINHAJ",450000),
    ("EMP0004","ANSIL",850000),
    ("EMP0005","EDWIN",999),
    ("EMP0006","ASLAM",28000),
    ("EMP0007","AKHIL",85000),
    ("EMP0008","ARSHAD",200000),
    ("EMP0009","MUHAMMED ALI",500000),
    ("EMP0010","MUBASHIR ALI",50000);

    DESC employee_salary;
    SELECT * from employee_salary;

    DELIMITER //

    CREATE PROCEDURE salary_report()
    BEGIN
        DECLARE basicpay,da,pf,gross_salary,net_salary,annual_salary,is_done,tax INT DEFAULT 0;
        DECLARE empno VARCHAR(10);
        DECLARE salary_cursor CURSOR FOR SELECT emp_no,basic_pay FROM employee_salary;
        DECLARE CONTINUE HANDLER FOR NOT FOUND SET is_done=1;
        OPEN salary_cursor;
        loop_label:LOOP
            IF is_done=1 THEN
                LEAVE loop_label;
            END IF;
            FETCH NEXT FROM salary_cursor INTO empno,basicpay;
            SET da=(basicpay*40)/100;
            SET pf=(basicpay*10)/100;
            SET gross_salary=basicpay+da;
            SET net_salary=gross_salary-pf;
            SET annual_salary=net_salary*12;
            CASE
                WHEN annual_salary<=100000 THEN
                    SET tax=0;
                WHEN annual_salary<=150000 THEN
                    SET tax=(annual_salary*10)/100;
                WHEN annual_salary<=250000 THEN
                    SET tax=(annual_salary*20)/100;
                WHEN annual_salary>250000 THEN
                    SET tax=(annual_salary*30)/100;
            END CASE;
            UPDATE employee_salary SET da=da,pf=pf,net_salary=net_salary,gross_salary=gross_salary,annual_salary=annual_salary,tax=tax WHERE emp_no=empno;
        END LOOP;
    END//

    DELIMITER ;

    CALL salary_report();

    SELECT * from employee_salary;