-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
select c.id as CategoryNumber
    , p.ProductName
    , c.CategoryName
from Category as c
join Product as p
    on c.id = p.CategoryId;

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
select o.id as OrderId
    , o.OrderDate
    , s.CompanyName
from [Order] as o
join Shipper as s
    on s.Id = o.ShipVia
    where o.OrderDate < date('2012-08-09');

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
select od.OrderId,
    p.ProductName,
    od.Quantity
from Product as p
join OrderDetail as od
    on p.Id = od.ProductId
    where od.OrderId = 10251;

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
select o.Id as OrderId,
    c.CompanyName,
    e.LastName as EmployeeName
from [Order] as o
join Employee as e
    on o.EmployeeId = e.Id
join Customer as c
    on o.CustomerId = c.Id;