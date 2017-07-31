#1
SELECT * FROM Products
      WHERE NOT EXISTS
      (SELECT * FROM Orders
      WHERE NOT EXISTS
      (SELECT * FROM OrderDetails
      WHERE Products.productCode = OrderDetails.productCode
      AND Orders.orderNumber = OrderDetails.orderNumber));

#2.1
SELECT CONCAT(firstName, ' ',lastName) as Name FROM Employees wrk WHERE EXISTS
(SELECT * FROM Employees WHERE 
wrk.reportsTo = Employees.employeeNumber AND lastName = 'Patterson' AND firstName = 'Mary');

#2.2
SELECT CONCAT(e.firstName, ' ',e.lastName) as Emp , CONCAT(m.firstName, ' ',m.lastName) as Mgr
FROM employees as e Inner Join employees as m on e.reportsTo = m.employeeNumber
WHERE m.lastName = 'Patterson' AND m.firstName = 'Mary';

#3
SELECT amount, DATE(paymentDate) FROM Payments WHERE amount
> 2*(SELECT AVG(amount) FROM Payments 
WHERE MONTH(paymentDate) = MONTH(Payments.paymentDate) 
AND YEAR(paymentDate) = YEAR(Payments.paymentDate)) 
ORDER BY paymentDate;

#4
SELECT productName, productLIne, FORMAT(100*quantityInStock*Buyprice/(SELECT SUM(quantityInStock*Buyprice) 
FROM Products WHERE P.productLine = Products.productLine),2) AS Percent
FROM Products P ORDER BY productLine, Percent DESC;

#5
SELECT productName FROM Products WHERE productCode IN 
(SELECT productCode FROM OrderDetails O 
WHERE quantityOrdered*priceEach > .5*(SELECT sum(quantityOrdered*priceEach) FROM OrderDetails 
WHERE OrderDetails.orderNumber = O.orderNumber 
GROUP BY O.orderNumber HAVING count(*) > 2));

#6
Select p.ProductLine, p.quantityInStock *(p.MSRP-p.buyPrice) as Profit from products as p 
group by p.productLine order by Profit DESC;

#6.1
Select p.ProductLine, Format(100 * p.quantityInStock *(p.MSRP-p.buyPrice)/(select sum(quantityInStock *(MSRP-buyPrice)) from products),2) as Profit from products as p 
group by p.productLine order by Profit DESC;	

#7



