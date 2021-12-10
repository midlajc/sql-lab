-- An examination has been conducted to a class of 10 students and 4 scores of each student
-- have been provided in the data along with their reg_no, name, total and avg_score. Assign
-- null values to the f ields total and average. Write Postgresql block to do the following

-- Find the total and average of each student. Update the table with the calculated values
-- Assign a letter grade to each student based on the average Score as

-- avg_score between 90 and 100 - A
-- avg_score 75 -89 - B
-- avg_score 60- 74 - C
-- avg_score 50 -59 - D
-- avg_score below 50 - Failed

DROP DATABASE IF EXISTS exam_result;

        CREATE DATABASE exam_result;

        use exam_result;

        CREATE TABLE students(
            roll_no int(5) PRIMARY KEY,
            name VARCHAR(25) NOT NULL
        );

        CREATE TABLE marks(
            roll_no int(5),
            mark int(10),
            FOREIGN KEY (roll_no) REFERENCES students(roll_no)
        );

        CREATE TABLE mark_meta(
            roll_no int(5),
            total int(10),
            avg_mark int(10),
            grade CHAR(1),
            FOREIGN KEY (roll_no) REFERENCES students(roll_no)
        );

        INSERT INTO students
        VALUES(1,"MIDLAJ C"),
        (2,"MINHA"),
        (3,"MINHAJ"),
        (4,"ANSIL"),
        (5,"EDWIN"),
        (6,"ASLAM"),
        (7,"AKHIL"),
        (8,"ARSHAD"),
        (9,"MUHAMMED ALI"),
        (10,"MUBASHIR ALI");

        INSERT INTO marks
        VALUES(1,1),(1,1),(1,1),(1,1),
        (2,100),(2,85),(2,88),(2,95),
        (3,100),(3,49),(3,69),(3,88),
        (4,67),(4,100),(4,85),(4,76),
        (5,87),(5,79),(5,88),(5,99),
        (6,77),(6,98),(6,68),(6,87),
        (7,98),(7,100),(7,75),(7,88),
        (8,100),(8,88),(8,98),(8,86),
        (9,66),(9,67),(9,77),(9,84),
        (10,87),(10,76),(10,75),(10,100);

        DESC students;
        DESC marks;
        DESC mark_meta;

        SELECT * FROM students;
        SELECT * FROM marks;
        SELECT * FROM mark_meta;

        DELIMITER //

        CREATE PROCEDURE process_mark()
        BEGIN
            DECLARE avg_mark,total_mark FLOAT DEFAULT 0;
            DECLARE grade CHAR;
            DECLARE is_done,mark,roll_no,i int DEFAULT 0;
            DECLARE mark_cursor CURSOR FOR SELECT s.roll_no,m.mark FROM (exam_result.students s LEFT JOIN exam_result.marks m on(s.roll_no=m.roll_no)) ORDER BY s.roll_no ASC;
            DECLARE CONTINUE HANDLER FOR NOT FOUND SET is_done=1;
            OPEN mark_cursor;
            FETCH NEXT FROM mark_cursor INTO roll_no,mark;
            loop_label:LOOP
                IF is_done=1 THEN
                    LEAVE loop_label;
                ELSE
                    SET i=0;
                    SET total_mark=0;
                END IF;

                loop_label1:LOOP
                    SET total_mark=total_mark+mark;
                    SET i=i+1;
                    IF i=4 THEN
                        SET i=roll_no;
                        FETCH NEXT FROM mark_cursor INTO roll_no,mark;
                        LEAVE loop_label1;
                    END IF;
                    FETCH NEXT FROM mark_cursor INTO roll_no,mark;
                END LOOP;

                SET avg_mark=total_mark/4;
                CASE
                    WHEN avg_mark<50 THEN
                        SET grade="F";
                    WHEN avg_mark<60 THEN
                        SET grade="D";
                    WHEN avg_mark<75 THEN
                        SET grade="C";
                    WHEN avg_mark<90 THEN
                        SET grade="B";
                    WHEN avg_mark<100 THEN
                        SET grade="A";
                END CASE; 
                INSERT INTO mark_meta VALUES (i,total_mark,avg_mark,grade);
                
            END LOOP;
        END//

        DELIMITER ;

        CALL process_mark();

        SELECT * FROM mark_meta;
