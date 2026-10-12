create database project111;
USE project111;
CREATE TABLE Customer (
    Customer_ID INT PRIMARY KEY,
    Customer_Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL
);


CREATE TABLE Product (
    Product_ID INT PRIMARY KEY,
    Product_Name VARCHAR(100) NOT NULL,
    Price DECIMAL(10,2) NOT NULL CHECK (Price >= 0),
    Stock_Quantity INT NOT NULL CHECK (Stock_Quantity >= 0)
);


CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY,
    Customer_ID INT NOT NULL,
    Order_Date DATE NOT NULL,
    Total_Amount DECIMAL(10,2) NOT NULL CHECK (Total_Amount >= 0),
    Order_Status VARCHAR(20) NOT NULL CHECK (Order_Status IN ('Pending', 'Shipped', 'Delivered', 'Cancelled')),
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
);


CREATE TABLE Order_Details (
    Order_Detail_ID INT PRIMARY KEY,
    Order_ID INT NOT NULL,
    Product_ID INT NOT NULL,
    Quantity INT NOT NULL CHECK (Quantity > 0),
    Price DECIMAL(10,2) NOT NULL CHECK (Price >= 0),
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID) ON DELETE CASCADE,
    FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID)
);

INSERT INTO Customer
(Customer_ID, Customer_Name, Email)
VALUES
(101, 'Alencia', 'alencia@gmail.com'),
(102, 'Rexon', 'rex2624@gmail.com'),
(103, 'Varshini', 'varshini@gmail.com'),
(104, 'Shahina', 'sha143@gmail.com'),
(105, 'Jeevi', 'jeevi@gmail.com');

INSERT INTO Product
(Product_ID, Product_Name, Price, Stock_Quantity)
VALUES
(201, 'Laptop', 55000.00, 10),
(202, 'Smartphone', 25000.00, 20),
(203, 'Headphones', 1500.00, 50),


(204, 'Keyboard', 1200.00, 30),
(205, 'Mouse', 800.00, 40);