USE TTIChallenge
GO
/*Q1*/
SELECT RIGHT(Full_MFG_Name, LEN(Full_MFG_Name) - CHARINDEX('| ',Full_MFG_Name))
from manufacturer

/*Q2*/
SELECT Quantity, Unit_Price, Quantity * Unit_Price AS "total revenue"
FROM sales

/*Q3*/
SELECT TOP (10) Product, Quantity * (Unit_Price - Unit_Cost) AS "total profit"
FROM sales
ORDER BY [total profit] DESC

/*Q4*/
SELECT manufacturer.Parent_MFG , 
SUM(sales.Quantity * sales.Unit_Cost) AS "total cost", 
SUM(sales.Quantity * (sales.Unit_Price - sales.Unit_Cost)) AS "total profit", 
SUM((sales.Unit_Price - sales.Unit_Cost)/sales.Unit_Price) AS "margin"
FROM sales
INNER JOIN manufacturer ON sales.MFG_Code = manufacturer.MFG_Code
GROUP BY manufacturer.Parent_MFG 

/*Q5*/
SELECT TOP (2) Product, SUM(Unit_Price * Quantity) AS "total sales"
FROM sales
GROUP BY Product
ORDER BY [total sales] DESC


/*Q6*/
SELECT products.TYPE , 
SUM(sales.Quantity * sales.Unit_Price) AS "total revenue",
SUM(sales.Quantity * sales.Unit_Cost) AS "total cost"
FROM sales
INNER JOIN products ON sales.Product = products.Product
GROUP BY products.TYPE 
ORDER BY [total revenue] DESC


/*Q7*/
SELECT SUM(Quantity) AS "number of sold products",
CASE WHEN Date >= '2016-01-01' AND Date <='2016-03-31' THEN 'first Quarter of 2016'
		WHEN Date >= '2016-04-01' AND Date <= '2016-06-30' THEN 'second Quarter of 2016'
		WHEN Date >= '2016-07-01' AND Date <= '2016-09-30' THEN 'third Quarter of 2016'
		WHEN Date >= '2016-10-01' AND Date <= '2016-12-31' THEN 'forth Quarter of 2016'
		WHEN Date >= '2017-01-01' AND Date <= '2017-03-31' THEN 'first Quarter of 2017'
		WHEN Date >= '2017-04-01' AND Date <= '2017-06-30' THEN 'second Quarter of 2017'
		WHEN Date >= '2017-07-01' AND Date <= '2017-09-30' THEN 'third Quarter of 2017'
		WHEN Date >= '2017-10-01' AND Date <= '2017-12-31' THEN 'forth Quarter of 2017'
		END AS bucket
FROM sales
GROUP BY 
	CASE WHEN Date >= '2016-01-01' AND Date <='2016-03-31' THEN 'first Quarter of 2016'
		WHEN Date >= '2016-04-01' AND Date <= '2016-06-30' THEN 'second Quarter of 2016'
		WHEN Date >= '2016-07-01' AND Date <= '2016-09-30' THEN 'third Quarter of 2016'
		WHEN Date >= '2016-10-01' AND Date <= '2016-12-31' THEN 'forth Quarter of 2016'
		WHEN Date >= '2017-01-01' AND Date <= '2017-03-31' THEN 'first Quarter of 2017'
		WHEN Date >= '2017-04-01' AND Date <= '2017-06-30' THEN 'second Quarter of 2017'
		WHEN Date >= '2017-07-01' AND Date <= '2017-09-30' THEN 'third Quarter of 2017'
		WHEN Date >= '2017-10-01' AND Date <= '2017-12-31' THEN 'forth Quarter of 2017'
		end
ORDER BY SUM(Quantity) DESC


/*Q8*/
SELECT SUM(sales.Quantity * sales.Unit_Price) AS "total sales", 
CASE WHEN sales.Date >= '2016-01-01' AND sales.Date <='2016-03-31' THEN 'first Quarter of 2016'
		WHEN sales.Date >= '2016-04-01' AND sales.Date <= '2016-06-30' THEN 'second Quarter of 2016'
		WHEN sales.Date >= '2016-07-01' AND sales.Date <= '2016-09-30' THEN 'third Quarter of 2016'
		WHEN sales.Date >= '2016-10-01' AND sales.Date <= '2016-12-31' THEN 'forth Quarter of 2016'
		WHEN sales.Date >= '2017-01-01' AND sales.Date <= '2017-03-31' THEN 'first Quarter of 2017'
		WHEN sales.Date >= '2017-04-01' AND sales.Date <= '2017-06-30' THEN 'second Quarter of 2017'
		WHEN sales.Date >= '2017-07-01' AND sales.Date <= '2017-09-30' THEN 'third Quarter of 2017'
		WHEN sales.Date >= '2017-10-01' AND sales.Date <= '2017-12-31' THEN 'forth Quarter of 2017'
		END AS bucket
FROM sales 
INNER JOIN products ON products.Product=sales.Product
WHERE products.CATEGORY = 'AUTOMOTIVE'
GROUP BY 
	CASE WHEN sales.Date >= '2016-01-01' AND sales.Date <='2016-03-31' THEN 'first Quarter of 2016'
		WHEN sales.Date >= '2016-04-01' AND sales.Date <= '2016-06-30' THEN 'second Quarter of 2016'
		WHEN sales.Date >= '2016-07-01' AND sales.Date <= '2016-09-30' THEN 'third Quarter of 2016'
		WHEN sales.Date >= '2016-10-01' AND sales.Date <= '2016-12-31' THEN 'forth Quarter of 2016'
		WHEN sales.Date >= '2017-01-01' AND sales.Date <= '2017-03-31' THEN 'first Quarter of 2017'
		WHEN sales.Date >= '2017-04-01' AND sales.Date <= '2017-06-30' THEN 'second Quarter of 2017'
		WHEN sales.Date >= '2017-07-01' AND sales.Date <= '2017-09-30' THEN 'third Quarter of 2017'
		WHEN sales.Date >= '2017-10-01' AND sales.Date <= '2017-12-31' THEN 'forth Quarter of 2017'
		end
ORDER BY [total sales] DESC



/*Q9*/
SELECT products.Product
	FROM products 
	LEFT JOIN sales ON products.Product = sales.Product
	WHERE sales.Product IS NULL
