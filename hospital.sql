DROP DATABASE IF EXISTS hospital;


#Create a table Hospital with the fields (doctorid,doctorname,department,qualification,experience).

    CREATE DATABASE hospital;

    USE hospital;

    CREATE TABLE hospital(
        doctorid VARCHAR(10) PRIMARY KEY,
        doctorname VARCHAR(20) NOT NULL,
        department VARCHAR(15),
        qualification VARCHAR(15),
        experience INT(2)
    );


#Insert 5 records

    INSERT INTO hospital(doctorid,doctorname,department,qualification,experience)
    VALUES("D001","Eden Sadler","Skin","MD",6),
    ("D002","Kristina Randolph","Heart","SD",7),
    ("D003","Arla Lugo","Stomach","MD",4),
    ("D004","Sheridan Aguilar","Skin","SD",8),
    ("D005","Elvis Person","Skin","SD",8);

#Display the details of Doctors

    DESC hospital;
    SELECT * FROM hospital;

#Display the details of doctors who have the qualification ‘MD’    

    SELECT * FROM hospital WHERE qualification="MD";

#Display all doctors who have more than 5 years experience but do not have the qualification ‘MD’    

    SELECT * FROM hospital WHERE qualification!="MD" AND experience>5;

#Display the doctors in ‘Skin’ department

    SELECT * FROM hospital WHERE department="Skin";

#update the experience of doctor with doctored=’D003’ to 5

    UPDATE hospital SET experience=5 WHERE doctorid="D003";

    SELECT * FROM hospital WHERE doctorid="D003";

#Delete the doctor with DoctorID=’D005’   

    DELETE FROM hospital WHERE doctorid="D005";

    SELECT * FROM hospital;