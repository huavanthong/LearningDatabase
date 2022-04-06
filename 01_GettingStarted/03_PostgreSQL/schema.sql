DROP TABLE IF EXISTS tbl1Customers CASCADE;
CREATE TABLE tbl1Customers (
	CustomerID int,
	CusterName VARCHAR,
	ContactName VARCHAR,
	Address VARCHAR,
	City VARCHAR,
	PostalCode VARCHAR,
	Country VARCHAR,
	
	CONSTRAINT tbl1_CustomerID_pkey PRIMARY KEY (CustomerID)
);

DROP TABLE IF EXISTS tbl1Employees CASCADE;
CREATE TABLE tbl1Employees (
	EmployeeID int,
	LastName VARCHAR,
	FirstName VARCHAR,
	BirthDate DATE,
	Photo VARCHAR,
	Notes VARCHAR,
	
	CONSTRAINT tbl1_Employees_pkey PRIMARY KEY (EmployeeID)
);

DROP TABLE IF EXISTS tbl1Shippers CASCADE;
CREATE TABLE tbl1Shippers( 
	ShipperID int,
	ShipperName VARCHAR,
	Phone VARCHAR,
	
	CONSTRAINT tbl1_Shippers_pkey PRIMARY KEY (ShipperID)
);

DROP TABLE IF EXISTS tbl1Suppliers CASCADE;
CREATE TABLE tbl1Suppliers (
	SupplierID int,
	SupplierName VARCHAR,
	ContactName VARCHAR,
	Address VARCHAR,
	City VARCHAR,
	PostalCode VARCHAR,
	Country VARCHAR,
	Phone VARCHAR,
	
	CONSTRAINT tbl1_Suppliers_pkey PRIMARY KEY (SupplierID)
);

DROP TABLE IF EXISTS tbl1Categories CASCADE;
CREATE TABLE tbl1Categories(
	CategoryID smallint,
	CategoryName VARCHAR,
	Description VARCHAR,
	
	CONSTRAINT tbl2_Categories_pkey PRIMARY KEY(CategoryID)
);

DROP TABLE IF EXISTS tbl1Products CASCADE;
CREATE TABLE tbl1Products (
	ProductID int,
	ProductName VARCHAR,
	SupplierID int,
	CategoryID smallint,
	Unit VARCHAR,
	Price NUMERIC,
	
	CONSTRAINT tbl1_Products_pkey PRIMARY KEY (ProductID),
	CONSTRAINT Products_Suppliers FOREIGN KEY (SupplierID) REFERENCES tbl1Suppliers(SupplierID),
	CONSTRAINT Products_Categories FOREIGN KEY (CategoryID) REFERENCES tbl1Categories(CategoryID)
);

DROP TABLE IF EXISTS tbl3Orders CASCADE;
CREATE TABLE tbl3Orders (
	OrderID bigint,
	CustomerID int,
	EmployeeID int,
	OrderDate TIMESTAMP,
	ShipperID int,
	
	CONSTRAINT tbl3_Orders_pkey PRIMARY KEY (OrderID),
	CONSTRAINT Orders_Customers FOREIGN KEY (CustomerID) REFERENCES tbl1Customers(CustomerID),
	CONSTRAINT Orders_Employees FOREIGN KEY (EmployeeID) REFERENCES tbl1Employees(EmployeeID),
	CONSTRAINT Orders_Shippers FOREIGN KEY (ShipperID) REFERENCES tbl1Shippers(ShipperID)
);

DROP TABLE IF EXISTS tbl2OrderDetails CASCADE;
CREATE TABLE tbl2OrderDetails (
	OrderDetailID int,
	OrderID bigint,
	ProductID int,
	Quantity int,
	
	CONSTRAINT tbl3_OrderDetails_pkey PRIMARY KEY (OrderDetailID),
	CONSTRAINT OrderDetails_Orders FOREIGN KEY (OrderID) REFERENCES tbl3Orders(OrderID),
	CONSTRAINT OrderDetails_Products FOREIGN KEY (ProductID) REFERENCES tbl1Products(ProductID)
)


