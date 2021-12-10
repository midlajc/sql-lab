-- Create a STUDENT table with following fields:

-- Field Name Type Width
-- RegNo Character 10
-- Name Character 20
-- Paper1 Numeric 3
-- Paper2 Numeric 3
-- Paper3 Numeric 3
-- Paper4 Numeric 3
-- Paper5 Numeric 3
-- Total Numeric 3
-- Result Character 6
-- Grade Character 1

-- Enter the RegNo, Name and Marks in 5 Papers of at least 10 students. Write a SQL program
-- to process the records to update the table with values for the fields Total
-- (Paper1+Paper2+Paper3+Paper4+Paper5), Result („Passed‟ if total is greater than or equal
-- to 50% of the total; „Failed‟ otherwise), and Grade („A‟ if mark obtained is greater than or
-- equal to 90% of the total mark, „B‟ if mark obtained is greater than or equal to 75% of the
-- total mark, „C‟ if mark obtained is greater than or equal to 60% of the total mark, „D‟ if
-- mark obtained is greater than or equal to 50% of the total mark, and „F‟ if mark obtained is
-- less than 50% of the total mark). Display a report in descending order of the total mark,
-- showing the data entered into the table along with the total marks, result and grade.

DROP DATABASE IF EXISTS student;

    CREATE DATABASE student;

    USE student;

    CREATE TABLE student(
        reg_no VARCHAR(10) PRIMARY KEY,
        name VARCHAR(20) NOT NULL,
        paper1 Numeric(3) NOT NULL,
        paper2 Numeric(3) NOT NULL,
        paper3 Numeric(3) NOT NULL,
        paper4 Numeric(3) NOT NULL,
        paper5 Numeric(3) NOT NULL,
        total Numeric(3),
        result VARCHAR(6),
        grade CHAR
    );

    INSERT INTO student(reg_no,name,paper1,paper2,paper3,paper4,paper5)
    value("WMO001","MIDLAJ C",1,1,1,1,1),
    ("WMO002","MINHA",95,84,99,100,88),
    ("WMO003","MINHAJ",100,88,86,97,77),
    ("WMO004","ANSIL",88,77,97,56,87),
    ("WMO005","EDWIN",86,99,67,85,98),
    ("WMO006","ASLAM",97,76,88,99,67),
    ("WMO007","ARSHAD",89,58,100,88,99),
    ("WMO008","MUHAMMED ALI",77,69,100,88,95),
    ("WMO009","MUBASHIR ALI",100,89,99,91,69),
    ("WMO010","AKHIL",99,84,69,96,100);

    DESC student;
    SELECT * FROM student;

    DELIMITER //

    CREATE PROCEDURE process_mark()
    BEGIN
        DECLARE p1,p2,p3,p4,p5 INT DEFAULT 0;
        DECLARE is_done,total,percentage FLOAT DEFAULT 0;
        DECLARE regno,result VARCHAR(10);
        DECLARE grade CHAR;
        DECLARE mark_cursor CURSOR FOR SELECT reg_no,paper1,paper2,paper3,paper4,paper5 FROM student.student ;
        DECLARE CONTINUE HANDLER FOR NOT FOUND SET is_done=1;
        OPEN mark_cursor;
        loop_label:LOOP
            IF is_done=1 THEN
                LEAVE loop_label;
            END IF;
            FETCH NEXT FROM mark_cursor INTO regno,p1,p2,p3,p4,p5;
            SET total=p1+p2+p3+p4+p5;
            SET percentage=(total*100)/500;

            IF  percentage > 50 THEN
                SET result="Passed";
            ELSE
                SET result="Failed";
            END IF;

            CASE
                WHEN percentage>=90 THEN
                    SET grade='A';
                WHEN percentage>=75 THEN
                    SET grade='B';
                WHEN percentage>=60 THEN
                    SET grade='C';
                WHEN percentage>=50 THEN
                    SET grade='D';
                WHEN percentage<50 THEN
                    SET grade='F';
            END CASE;
            UPDATE student SET total=total,result=result,grade=grade WHERE reg_no=regno;
        END LOOP;
    END//

    DELIMITER ;

    CALL process_mark();

    SELECT * FROM student ORDER BY total DESC;