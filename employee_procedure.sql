DROP DATABASE IF EXISTS employee;

#create a table emp_salary(empno,enamedept,salary)

    CREATE DATABASE employee;

    USE employee;

    CREATE TABLE employee(
        empno VARCHAR(10) PRIMARY KEY,
        ename VARCHAR(25) NOT NULL,
        enamedept VARCHAR(15),
        salary INT(15)
    );

    DESC employee;

    INSERT INTO employee(empno,ename,salary,enamedept)
    VALUES ("EP001","Vikram Hassan","200000","HR"),
    ("EP002","Reema Wheatley","250000","IT"),
    ("EP003","Aurora Blanchard","100000","PLANNING"),
    ("EP004","Iris Forster","150000","PURCHASE"),
    ("EP005","Hayleigh Floyd","180000","PURCHASE"),
    ("EP006","Muhammed Arshad","500000","PLANNING"),
    ("EP007","Muhammed Ali","500000","SALES"),
    ("EP008","Midlaj C","1","MANAGEMENT"),
    ("EP009","Minha","500000","MANAGEMENT"),
    ("EP010","Mubashir Ali","500000","PURCHASE")
    ;

#Write a function to return the average salary of a particular department by accepting
#departmentname as argument    

    DELIMITER //

    CREATE PROCEDURE average(IN inout_val VARCHAR(10),OUT average_salary FLOAT)
    BEGIN
        DECLARE row_num,total_salary,is_done,temp_salary INT DEFAULT 0;
        DECLARE salary_cursor CURSOR FOR SELECT salary FROM employee WHERE enamedept=inout_val;
        DECLARE CONTINUE HANDLER FOR NOT FOUND SET is_done=1;
        SELECT COUNT(enamedept) INTO row_num FROM employee WHERE enamedept=inout_val;
        OPEN salary_cursor;
        loop_label:LOOP
            FETCH salary_cursor INTO temp_salary;
            IF  is_done=1 THEN
                LEAVE loop_label;
            END IF;    
            SET total_salary=total_salary+temp_salary;
        END LOOP;
        SET average_salary=total_salary/row_num; 
        CLOSE salary_cursor;   
    END//

    DELIMITER ;

    CALL average("MANAGEMENT",@average_salary);

    SELECT @average_salary;