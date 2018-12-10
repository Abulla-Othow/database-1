-------------------------
-- Create Customers table
-------------------------
CREATE TABLE Customers
(
  cust_id      char(10)  NOT NULL ,
  cust_name    char(50)  NOT NULL ,
  cust_address char(50)  ,
  cust_city    char(50)  ,
  cust_state   char(5)   ,
  cust_zip     char(10)  ,
  cust_country char(50)  ,
  cust_contact char(50)  ,
  cust_email   char(254) 
);

--------------------------
-- Create OrderItems table
--------------------------
CREATE TABLE OrderItems
(
  order_num  int          NOT NULL ,
  order_item int          NOT NULL ,
  prod_id    char(10)     NOT NULL ,
  quantity   int          NOT NULL ,
  item_price decimal(8,2) NOT NULL 
);

----------------------
-- Create Orders table
----------------------
CREATE TABLE Orders
(
  order_num  int      NOT NULL ,
  order_date date     NOT NULL ,
  cust_id    char(10) NOT NULL 
);

------------------------
-- Create Products table
------------------------
CREATE TABLE Products
(
  prod_id    char(10)      NOT NULL ,
  vend_id    char(10)      NOT NULL ,
  prod_name  char(254)     NOT NULL ,
  prod_price decimal(8,2)  NOT NULL ,
  prod_desc  varchar(1000) 
);

-----------------------
-- Create Vendors table
-----------------------
CREATE TABLE Vendors
(
  vend_id      char(10) NOT NULL ,
  vend_name    char(50) NOT NULL ,
  vend_address char(50) ,
  vend_city    char(50) ,
  vend_state   char(5)  ,
  vend_zip     char(10) ,
  vend_country char(50) 
);


----------------------
-- Define primary keys
----------------------
ALTER TABLE Customers ADD PRIMARY KEY (cust_id);
ALTER TABLE OrderItems ADD PRIMARY KEY (order_num, order_item);
ALTER TABLE Orders ADD PRIMARY KEY (order_num);
ALTER TABLE Products ADD PRIMARY KEY (prod_id);
ALTER TABLE Vendors ADD PRIMARY KEY (vend_id);


----------------------
-- Define foreign keys
----------------------
ALTER TABLE OrderItems
ADD CONSTRAINT FK_OrIt_Or FOREIGN KEY (order_num) REFERENCES Orders (order_num);
ALTER TABLE OrderItems
ADD CONSTRAINT FK_OrIt_Pr FOREIGN KEY (prod_id) REFERENCES Products (prod_id);
ALTER TABLE Orders
ADD CONSTRAINT FK_Or_Cu FOREIGN KEY (cust_id) REFERENCES Customers (cust_id);
ALTER TABLE Products
ADD CONSTRAINT FK_Pr_Ve FOREIGN KEY (vend_id) REFERENCES Vendors (vend_id);
