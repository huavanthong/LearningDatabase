-- Drop table if exist
DROP TABLE IF EXISTS foods;
DROP TABLE IF EXISTS company;

-- Must create database for foreign table.
Create table company (
	COMPANY_ID integer,
	COMPANY_NAME VARCHAR(255),
	COMPANY_CITY VARCHAR(255),
	PRIMARY KEY(COMPANY_ID)
);

-- Then create database for foods and column refer to foreign table.
Create table foods (
	ITEM_ID integer,
	ITEM_NAME VARCHAR(255),
	ITEM_UNIT VARCHAR(255),
	COMPANY_ID integer,
	PRIMARY KEY(ITEM_ID),
	CONSTRAINT fk_foods_company
      FOREIGN KEY(COMPANY_ID) 
	  REFERENCES company(COMPANY_ID)
	  ON DELETE SET NULL
);


-- Insert data for foreign table before, if you insert for foods, it return error.
INSERT INTO company(COMPANY_ID, COMPANY_NAME, COMPANY_CITY)
VALUES(1, 'AS Solution', 'HCM'),
      (2, 'Renesas', 'HCM'),
	  (3, 'Akas Foods', 'Delhi');   

-- Then insert data for foods, because it can find the foreign data to reference.
INSERT INTO foods(ITEM_ID, ITEM_NAME, ITEM_UNIT, COMPANY_ID)
VALUES(1,'Hu tieu','Pcs', 1),
      (2,'Rice','Pcs',2),
      (3,'Chicken','Pcs',1),
	  (4, 'Chex Mix', 'Pcs', 3 );
	  
-- Low performance
Select 
	fd.ITEM_NAME,
	fd.ITEM_UNIT,
	cp.COMPANY_NAME,
	cp.COMPANY_CITY
From
	foods fd,
	company cp
Where
	fd.COMPANY_ID = cp.COMPANY_ID

-- High performance
Explain Select 
	fd.ITEM_NAME,
	fd.ITEM_UNIT,
	cp.COMPANY_NAME,
	cp.COMPANY_CITY
From
	foods fd
INNER JOIN 
	company cp
ON
	fd.COMPANY_ID = cp.COMPANY_ID
	
-- To demonstrate the performance on SQL. We can:
Explain Analyze Select 
	fd.ITEM_NAME,
	fd.ITEM_UNIT,
	cp.COMPANY_NAME,
	cp.COMPANY_CITY
From
	foods fd,
	company cp
Where
	fd.COMPANY_ID = cp.COMPANY_ID
	
Explain Analyze Select 
	fd.ITEM_NAME,
	fd.ITEM_UNIT,
	cp.COMPANY_NAME,
	cp.COMPANY_CITY
From
	foods fd
INNER JOIN 
	company cp
ON
	fd.COMPANY_ID = cp.COMPANY_ID
