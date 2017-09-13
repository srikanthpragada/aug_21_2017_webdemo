CREATE PROCEDURE sp_get_total_sales
AS
select prodname, sum(amount)  as TotalSales
from products p inner join sales s
on ( p.prodid = s.prodid)
group by prodname
order by prodname 


execute sp_get_total_sales