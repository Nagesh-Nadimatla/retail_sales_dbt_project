select o.storeid,
sum(i.quantity*i.unitprice) as actual_revenue
,s.salestarget,
round((sum(i.quantity*i.unitprice)/s.salestarget)*100,2) as precentage_achived
from  {{ref('order_stg')}} o 
join {{ref("orderitem_stg")}} i 
on o.orderid =i.orderid 
join {{ref("salestargets")}} s 
on o.storeid=s.storeid
group by o.storeid,s.salestarget;