DROP DATABASE IF EXISTS circle_db;


    #Write a program code to calculate the area of a circle for a value of radius varying from
    #3 to 7. Store the radius and the corresponding value of calculated area in an empty table
    #named areas with field’s radius and area
    
    CREATE DATABASE circle_db;
    
    USE circle_db;
    
    CREATE TABLE areas(
        radius VARCHAR(10),
        area VARCHAR(10)
    );

    DELIMITER /

    CREATE PROCEDURE calc_areas() 
    BEGIN 
        DECLARE area,radius FLOAT;
        SET radius=3; 
        WHILE radius<7 DO
            SET area=3.14*(radius*radius);
            INSERT INTO areas(radius,area)VALUES(radius,area);
            SET radius=radius+0.1;
        END WHILE;                           
    END/

    DELIMITER ;

    CALL calc_areas();

    SELECT * FROM areas;