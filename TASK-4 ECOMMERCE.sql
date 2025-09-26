use classicmodels;
select * from classicmodels.customers ;

select customerName,country,creditLimit from customers 
where country="usa" and creditLimit>=5000
order by creditLimit desc;

select country , avg(creditlimit) AS AverageCreditLimit  
from customers
group by country 
order by AverageCreditLimit desc ;


-- subqueries
select CustomerName, Country, CreditLimit
from customers
where CreditLimit > (
    select avg(CreditLimit) from customers
);

select OrderNumber, CustomerNumber, OrderDate
from orders
where OrderNumber in(
    select OrderNumber
    from orderdetails
    group by OrderNumber
   having SUM(QuantityOrdered * PriceEach) > 50000
);

select EmployeeNumber, FirstName, LastName
from employees
where EmployeeNumber in(
    select SalesRepEmployeeNumber
    from customers
   group by SalesRepEmployeeNumber
   having COUNT(CustomerNumber) > 5
);

-- views
create view HighCreditCustomers as
select CustomerNumber, CustomerName, Country, CreditLimit
from customers
where CreditLimit > 50000;

-- joins

select o.OrderNumber, o.OrderDate, c.CustomerName
from orders o
inner join customers c
on o.CustomerNumber = c.CustomerNumber;

select c.CustomerName, o.OrderNumber, o.OrderDate
from customers c
left join orders o
on c.CustomerNumber = o.CustomerNumber;

select o.OrderNumber, o.OrderDate, c.CustomerName
from orders o
right join customers c
on o.CustomerNumber = c.CustomerNumber;


