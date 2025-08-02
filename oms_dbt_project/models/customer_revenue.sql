select O.CUSTOMERID, C.CUSTMER_NAME ,
SUM(O.ORDER_COUNT) AS order_count ,
SUM(O.REVENUE) as revenue 
FROM 
{{ref("orders_fact")}} O
JOIN 
{{ref("customer_stg")}} C ON C.CUSTOMERID = O.CUSTOMERID
group by O.CUSTOMERID, C.CUSTMER_NAME
