//*
This is the table in order for the users to have credit in their account
*// 
CREATE TABLE Account(
  idAccount INT NOT NULL AUTO_INCREMENT,
  AccountName VARCHAR(20) NULL,
  AcountCredit VARCHAR(20) NULL,
  PRIMARY KEY (idAccount));

//*
This is the table where the customers will enter their data
*// 

CREATE TABLE Customer (
  idCustomer INT NOT NULL AUTO_INCREMENT,
  Title VARCHAR(10) NOT NULL,
  FirstName VARCHAR(25) NOT NULL,
  LastName VARCHAR(25) NOT NULL,
  EmailAddress VARCHAR(45) NOT NULL,
  Address VARCHAR(45) NOT NULL,
  Postcode VARCHAR(10) NOT NULL,
  Username VARCHAR(45) NOT NULL,
  Password VARCHAR(45) NOT NULL,
  RepeatPassword VARCHAR(45) NOT NULL,
  Account_idAccount INT NOT NULL,
  PRIMARY KEY (idCustomer, Account_idAccount),
  CONSTRAINT fk_Customer_Account1
  FOREIGN KEY (Account_idAccount)
  REFERENCES Account (idAccount));
  
 //*
This is the table to see the status of the customers order
*// 

CREATE TABLE Status (
  idStatus INT NOT NULL AUTO_INCREMENT,
  Satus VARCHAR(45) NOT NULL,
  DeliveryDate DATE NOT NULL,
  DeliveryTime TIME NOT NULL,
  Customer_idCustomer INT NOT NULL,
  PRIMARY KEY (idStatus, Customer_idCustomer),
   FOREIGN KEY (Customer_idCustomer)
   REFERENCES Customer(idCustomer));
   
//*
This is the table where the products will be stored which the customers can browse from
*// 
CREATE TABLE Product(
  idProduct INT NOT NULL AUTO_INCREMENT,
  ProductName VARCHAR(45) NOT NULL,
  ProductDescription VARCHAR(45) NOT NULL,
  Category VARCHAR(45) NULL,
  Price VARCHAR(25) NOT NULL,
  Quantity INT NOT NULL,
  PRIMARY KEY (idProduct),
  UNIQUE INDEX idProduct_UNIQUE (idProduct ASC));

//*
This is the table to solve the many to many between the status and product table
*// 

CREATE TABLE Status_has_Product (
  Status_idStatus INT NOT NULL,
  Status_Customer_idCustomer INT NOT NULL,
  Product_idProduct INT NOT NULL,
  PRIMARY KEY (Status_idStatus, Status_Customer_idCustomer, Product_idProduct),
  CONSTRAINT fk_Status_has_Product_Status1
  FOREIGN KEY (Status_idStatus, Status_Customer_idCustomer)
  REFERENCES Status (idStatus , Customer_idCustomer),
  CONSTRAINT fk_Status_has_Product_Product1
  FOREIGN KEY (Product_idProduct)
  REFERENCES Product (idProduct));

	
