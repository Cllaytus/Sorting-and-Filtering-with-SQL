-- Create a table called assignment
CREATE TABLE ASSIGNMENT
(OrderID int primary key not null,
ProdName varchar(90) not null,
RegionName varchar(90) not null,
FiscalQtr varchar(90) not null,
NetSales int not null);

select *
from ASSIGNMENT;

INSERT INTO ASSIGNMENT (OrderID, ProdName, RegionName, FiscalQtr, NetSales)
values (111, 'Printer', 'East', 'Q1-2016', 7956),
(112, 'Scanner', 'West', 'Q1-2016', 7856); -- testing the first two records

-- retrieving the test records
SELECT *
FROM ASSIGNMENT;

-- inserting the remaining values into the table assignment 
INSERT INTO ASSIGNMENT (OrderID, ProdName, RegionName, FiscalQtr, NetSales)
values (113, 'Television', 'North', 'Q1-2016', 7301), -- continuing from the third record 
(114, 'Laptop', 'South', 'Q1-2016', 5719),
(115, 'Printer', 'East', 'Q2-2016', 5719),
(116, 'Scanner', 'West', 'Q2-2016', 5873), 
(117, 'Television', 'North', 'Q2-2016', 1361),
(118, 'Laptop', 'South', 'Q2-2016', 3659),
(119, 'Printer', 'East', 'Q3-2016', 6869),
(120, 'Scanner', 'West', 'Q3-2016', 1736), 
(121, 'Television', 'North', 'Q3-2016', 2061),
(122, 'Laptop', 'South', 'Q3-2016', 8253),
(123, 'Printer', 'East', 'Q4-2016', 6054),
(124, 'Scanner', 'West', 'Q4-2016', 8550), 
(125, 'Television', 'North', 'Q4-2016', 2073),
(126, 'Laptop', 'South', 'Q4-2016', 9961);

-- Operators in SQL
-- Arithmetic op = +,-, *, ?
-- Comparism op = >,<,>=,<=,=, !=
-- = is when its just one value in a column but IN is when you are looking for more than one value in the same column-
-- Logical op = AND , OR, NOT, IN, BETWEEN
-- Wildcard op = LIKE, but you have to add % where the missing string is. E.g Having start (having RT)= '%rt'

SELECT PRODNAME, FISCALQTR, NETSALES
FROM ASSIGNMENT
WHERE NETSALES >= 5000;

SELECT FISCALQTR, NETSALES + 2900
FROM ASSIGNMENT
WHERE NETSALES > 4500;

SELECT ORDERID, REGIONNAME, NETSALES
FROM ASSIGNMENT
WHERE REGIONNAME = 'WEST';

SELECT *
FROM ASSIGNMENT
WHERE PRODNAME = 'Television'
 and netsales > 6000;
 
 select *
 from assignment
 where NETSALES not between 3500 and 5000;
 
 select * 
 from assignment
 where REGIONNAME = 'EAST'
 OR REGIONNAME ='WEST';
 
SELECT *
FROM ASSIGNMENT
WHERE ORDERID IN (112,117,119);

-- Filtering Functions in SQL
-- The Keyword WHERE is the filtering function in SQL