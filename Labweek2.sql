select *
from orders
where month(OrderDate) = 11;

select *
from orders
join shippers using (ShipperID)
where month(OrderDate) = 11;

select EmployeeID, FirstName, sum(Quantity * Price) as Total
from employees
join orders using (EmployeeID)
join order_details using (OrderID)
join products using (ProductID)
GROUP BY EmployeeID
order by Total desc;


select OrderID
from order_details
where ProductID in (select ProductID from products where SupplierID in 
(select SupplierID from suppliers where SupplierName = "Tokyo Traders"));