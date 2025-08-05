SELECT 
ORDERID, ORDERDATE, CUSTOMERID, EMPLOYEEID, STOREID,
CASE WHEN STATUS = 01 THEN 'In Progress'
     WHEN STATUS =02  THEN 'Completed'
     WHEN STATUS =03  THEN 'Canceled' else null end as STATUS_DESC,
 UPDATED_AT 
 FROM 
 {{ source('landing','order') }}