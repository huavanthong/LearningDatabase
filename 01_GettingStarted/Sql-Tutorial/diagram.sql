CREATE TABLE tbl1Customers (
	CustomerID NUMERIC,
	CusterName VARCHAR,
	ContactName VARCHAR,
	Address VARCHAR,
	City VARCHAR,
	PostalCode VARCHAR,
	Country VARCHAR,
	
	CONSTRAINT tbl1_CustomerID_pkey PRIMARY KEY (CustomerID)
);


CREATE TABLE tbl1Employees (
	EmployeeID NUMERIC,
	LastName VARCHAR,
	FirstName VARCHAR,
	BirthDate TIME,
	Photo VARCHAR,
	Notes VARCHAR,
	
	CONSTRAINT tbl1_Employees_pkey PRIMARY KEY (EmployeeID)
);

CREATE TABLE tbl1Shippers( 
	ShipperID NUMERIC,
	ShipperName VARCHAR,
	Phone VARCHAR,
	
	CONSTRAINT tbl1_Shippers_pkey PRIMARY KEY (ShipperID)
);

CREATE TABLE tbl1Suppliers (
	SupplierID NUMERIC,
	SupplierName VARCHAR,
	ContactName VARCHAR,
	Address VARCHAR,
	City VARCHAR,
	PostalCode VARCHAR,
	Country VARCHAR,
	Phone VARCHAR,
	
	CONSTRAINT tbl1_Suppliers_pkey PRIMARY KEY (SupplierID)
);


CREATE TABLE tbl2Categories(
	CategoryID NUMERIC,
	CategoryName VARCHAR,
	Description VARCHAR,
	
	CONSTRAINT tbl2_Categories_pkey PRIMARY KEY(CategoryID)
);

CREATE TABLE tbl1Products (
	ProductID NUMERIC,
	ProductName VARCHAR,
	SupplierID NUMERIC,
	CategoryID NUMERIC,
	Unit NUMERIC,
	Price NUMERIC,
	
	CONSTRAINT tbl1_Products_pkey PRIMARY KEY (ProductID),
	CONSTRAINT Products_Suppliers FOREIGN KEY (SupplierID) REFERENCES tbl1Suppliers(SupplierID),
	CONSTRAINT Products_Categories FOREIGN KEY (CategoryID) REFERENCES tbl2Categories(CategoryID)
);

CREATE TABLE tbl1Orders (
	OrderID NUMERIC,
	CustomerID NUMERIC,
	EmployeeID NUMERIC,
	OrderDate TIMESTAMP,
	ShipperID NUMERIC,
	
	CONSTRAINT tbl1_Orders_pkey PRIMARY KEY (OrderID),
	CONSTRAINT Orders_Customers FOREIGN KEY (CustomerID) REFERENCES tbl1Customers(CustomerID),
	CONSTRAINT Orders_Employees FOREIGN KEY (EmployeeID) REFERENCES tbl1Employees(EmployeeID),
	CONSTRAINT Orders_Shippers FOREIGN KEY (ShipperID) REFERENCES tbl1Shippers(ShipperID)
);

CREATE TABLE tbl3OrderDetails (
	OrderDetailID NUMERIC,
	OrderID NUMERIC,
	ProductID NUMERIC,
	Quantity NUMERIC,
	
	CONSTRAINT tbl3_OrderDetails_pkey PRIMARY KEY (OrderDetailID),
	CONSTRAINT OrderDetails_Orders FOREIGN KEY (OrderID) REFERENCES tbl1Orders(OrderID),
	CONSTRAINT OrderDetails_Products FOREIGN KEY (ProductID) REFERENCES tbl1Products(ProductID)
)


