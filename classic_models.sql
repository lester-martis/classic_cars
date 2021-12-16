
-- 1. Top Ordered Toys' Categories
SELECT
    pr.productLine,
    od.quantityOrdered AS Orders,
    os.shippedDate,
    (od.quantityOrdered * od.priceEach) AS Amount
FROM
	orderdetails od
JOIN
	orders os
ON
	os.orderNumber = od.orderNumber
JOIN
	products pr
ON
	od.productCode = pr.productCode;
-- GROUP BY pr.productLine
-- ORDER BY Orders DESC ;

-- 2. ------Sale Value of products ------
SELECT
	os.orderDate,
	od.productCode,
    pr.productName,
    (od.quantityOrdered * od.priceEach) AS sales_amount
FROM
	orderdetails od
JOIN
	products pr
ON
	od.productCode = pr.productCode
JOIN
	orders os
ON
	od.orderNumber = os.orderNumber;
    
    
-- 3.---Sales performance - Country wise---------------------------------

SELECT
		os.orderDate,
		cs.country,
		(od.quantityOrdered) * pr.MSRP AS salesamount
        
FROM
	customers cs
JOIN
	orders os
ON
	cs.customerNumber = os.customerNumber
JOIN
	orderdetails od
ON
	od.orderNumber = os.orderNumber
JOIN
	products pr
ON
	od.productCode = pr.productCode
-- WHERE country = 'France'
ORDER BY country;

-- 4. ------List of customers and their Order amounts (Invoice amount)-----(done)-----

SELECT
	od.orderNumber,
    os.shippedDate,
	cs.customerNumber,
	cs.customerName,
	od.quantityOrdered,
	(od.quantityOrdered * od.priceEach) AS OrderAmount
FROM
	orderdetails od
JOIN
	orders os
ON
	od.orderNumber=os.orderNumber
JOIN
	customers cs
ON
	os.customerNumber=cs.customerNumber;

-- 5. ---------Total Business year wise-------
SELECT
	os.shippedDate,
    cs.customerName,
    cs.country,
    (od.quantityOrdered * od.priceEach) AS SalesAmount
FROM
	orders os
JOIN
	orderdetails od
ON
	os.orderNumber = od.orderNumber
JOIN customers cs
ON cs.customerNumber = os.customerNumber
WHERE shippedDate IS NULL;

-- 6. Calculate Profit----
SELECT
	os.shippedDate,
    (od.quantityOrdered * od.priceEach) AS salesAmount,
    od.quantityOrdered AS soldqty,
    (od.priceEach - pr.buyPrice) AS profit_amount,
    ROUND((od.priceEach / pr.buyPrice) * 100, 2) AS Profit_rate
FROM
	orderdetails od
JOIN
	orders os
ON
	od.orderNumber = os.orderNumber
JOIN
	products pr
ON
	pr.productCode = od.productCode;
    

    
    