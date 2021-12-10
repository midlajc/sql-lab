DROP DATABASE IF EXISTS products;

#Create a table product with the fields (Product_code primary key, Product_Name,Category, Quantity, Price)

    CREATE DATABASE products;

    USE products;

    CREATE TABLE product (
        Product_code VARCHAR(5) PRIMARY KEY,
        Product_Name VARCHAR(30) NOT NULL,
        Category VARCHAR(20),
        Quantity INT(10),
        Price INT(15)
    );


#Insert some records Write the queries to perform the following

    INSERT INTO product(Product_code,Product_Name,Category,Quantity,Price)
    VALUES("P001","Chandika Soap","Bath Soap",10,10),
    ("P002","Cole Gate","Paste",99,21),
    ("P003","Ujala Washing Powder","Washing Powder",250,30),
    ("P004","Sun Light Washing Powder","Washing Powder",2000,150),
    ("P005","KP Namboodiris","Paste",2000,25);

    DESC product;
    SELECT * FROM product;

#Display the records in the descending order of Product_Name    

    SELECT * FROM product ORDER BY Product_Name DESC;

#Display Product_Code, Product_Name with price between 20 and 50

    SELECT Product_Code,Product_Name FROM product WHERE Price BETWEEN 20 AND 50;

#Display the details of products which belongs to the categories of ‘bath soap’,‘paste’, or ‘washing powder’    

    SELECT * FROM product WHERE Category IN ("Paste","Washing Powder","Bath Soap");

#Display the products whose Quantity less than 100 or greater than 500

    SELECT * FROM product WHERE Quantity>500 OR Quantity<100;

#Display the products whose names starts with 's'

    SELECT * FROM product WHERE Product_Name LIKE "S%";

#Display the products which not belongs to the category 'paste'

    SELECT * FROM product WHERE Category != "Paste";

#Display the products whose second letter is 'u' and belongs to the Category 'washing powder'\

    SELECT * FROM product WHERE Product_Name LIKE "_u%" AND Category="Washing Powder";
