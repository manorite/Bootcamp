use classicmodels

#1
SELECT * FROM offices ORDER BY country, state , city;

#2
SELECT count(distinct employeeNumber) FROM employees;

#3
SELECT paymentDate,sum(amount) as total_payment FROM payments WHERE paymentDate = '2004-10-28';

# However - notice
#3a
select count(paymentDate) from payments;
select count(distinct paymentDate) from payments;
SELECT paymentDate from payments group by paymentDate having count(paymentDate) > 1;

#4
SELECT paymentDate, sum(amount) as total_payment FROM payments group by paymentDate having paymentDate = '2003-07-21';

#5
SELECT productLine, productName, COUNT(productCode) FROM Products GROUP BY productLine;

#6
SELECT checkNumber, amount FROM Payments WHERE amount <= 3*(SELECT AVG(amount) FROM Payments);

#7
SELECT orderNumber AS `Order number`, FORMAT(SUM(quantityOrdered*priceEach),2) AS `Order value` 
FROM OrderDetails GROUP BY orderNumber HAVING SUM(quantityOrdered*priceEach) > 5000;


# Task 2

#1
SELECT c.customerName, concat(e.firstName," ",e.lastName) AS Employee_Name FROM customers AS c JOIN employees AS e ON c.salesRepEmployeeNumber = e.employeeNumber;

#2 
SELECT paymentDate , sum(amount) as Total FROM payments GROUP BY paymentDate ORDER BY paymentDate;

# 3 
select * from customers where customerName like "Herkku Gifts";
select * from customers where customerNumber = 167;

#4 
select customerName, sum(amount) as Payment_by_each_customer from customers 
join payments on customers.customerNumber = payments.customerNumber 
group by customerName order by Payment_by_each_customer desc;

#4.1
select customerName, sum(amount) as Payment_by_each_customer from customers 
join payments on customers.customerNumber = payments.customerNumber 
group by customerName order by Payment_by_each_customer desc limit 10;

#4.2
select customerName, sum(amount) as Payment_by_each_customer from customers 
join payments on customers.customerNumber = payments.customerNumber 
group by customerName order by Payment_by_each_customer desc 
limit 10,10;
# OFFSET 10 rows fetch next 10 rows only - used in TSQL

# 5
Select p.productName, o.orderDate from products p 
join orderdetails od on p.productCode = od.productCode 
join orders o on o.orderNumber = od.orderNumber
order by o.orderDate;

# 5.1
Select p.productName, o.orderDate , count(1)  from products p 
join orderdetails od on p.productCode = od.productCode 
join orders o on o.orderNumber - od.orderNumber
group by o.orderDate 
order by o.orderDate;

#6
select orderDate , day(orderDate) ,count(1) from orders group by orderDate having day(orderDate) = "Monday";

# 6.1.1
select orderDate , weekday(orderDate),
case 
when weekday(orderDate) = 0 then "Sunday"
when weekday(orderDate) = 1 then "Monday"
when weekday(orderDate) = 2 then "Tuesday"
when weekday(orderDate) = 3 then "Wednesday"
when weekday(orderDate) = 4 then "Thursday"
when weekday(orderDate) = 5 then "Friday"
when weekday(orderDate) = 6 then "Saturday"
END as Week_day
 from orders where Week_day = "Monday";

#6.1.2
select orderDate , weekday(orderDate),
case 
when weekday(orderDate) = 0 then "Sunday"
when weekday(orderDate) = 1 then "Monday"
when weekday(orderDate) = 2 then "Tuesday"
when weekday(orderDate) = 3 then "Wednesday"
when weekday(orderDate) = 4 then "Thursday"
when weekday(orderDate) = 5 then "Friday"
when weekday(orderDate) = 6 then "Saturday"
END as Week_day
 from orders group by orderDate having Week_day = "Monday";
 
 
 #7 
SELECT orderDate
FROM OrderDetails JOIN Products
ON OrderDetails.productCode = Products.productCode
JOIN Orders ON Orders.orderNumber = OrderDetails.orderNumber
WHERE productName = '1940 Ford Pickup Truck'
ORDER BY orderDate DESC;




