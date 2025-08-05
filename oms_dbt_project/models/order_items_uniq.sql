SELECT 
ORDERITEMID, ORDERID, PRODUCTID, QUANTITY, UNITPRICE, UPDATED_AT 
FROM (
{{ deduplicate(
    relation=source('landing', 'orderitm'),
    partition_by='orderid',
    order_by="updated_at desc",
   )
}} )