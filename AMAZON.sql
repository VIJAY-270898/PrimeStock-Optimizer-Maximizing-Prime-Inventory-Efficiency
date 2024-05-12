USE CKASS;
 
-- Understanding the table
select * from itemss;

-- Query   
with cte2 as    
	(
	 with cte as 
	   (
		select  
			ITEM_TYPE, SUM(SQUARE_FOOTAGE) as s_sq_ft, count(item_id) as c_item_id
		from 
			itemss
		GROUP BY ITEM_TYPE)
	 select 
		item_type, total_set*c_item_id AS TOTAL_COUNT, total_set, 500000-(TOTAL_sET*s_sq_ft) as remain_sq_ft
	 from 
		(select item_type, floor(500000/s_sq_ft) as total_set, c_item_id,s_sq_ft  
		 from cte 
		 where item_type='prime_eligible') 
	as A )
select item_type, ifnull(total_count,count_of_batch) as count_of_products 
from
	(select 
		*,floor(lag_sq_ft/s_sq_ft)*c_item_id as count_of_batch 
	 from
		(select 
			* ,lag(remain_sq_ft) over() as lag_sq_ft
		 from 
			cte2 right join (select  
								ITEM_TYPE, SUM(SQUARE_FOOTAGE) as s_sq_ft, count(item_id) as c_item_id
							 from 
								itemss
							 GROUP BY ITEM_TYPE)as A using(item_type)) as B) as D;
                     

