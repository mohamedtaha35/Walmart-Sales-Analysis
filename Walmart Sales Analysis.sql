use walmart;


/*set SQL_SAFE_UPDATES = 0;

update walmart_sales
 set Date = str_to_date(Date,'%d/%m/%Y')
 
alter table walmart_sales
 modify column Date date;

set SQL_SAFE_UPDATES = 1;*/

/*select Date ,monthname(Date) as Month_Name 
from walmart_sales limit 5;*/

/*select monthname(Date) as Month_Name,sum(Weekly_Sales) as Total_Monthly_Sales 
from walmart_sales
 group by Month_Name 
 order by field(Month_Name,'January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December')desc;*/

/*select distinct(store) as Store_name,sum(Weekly_Sales) as Total_Monthly_Sales 
from walmart_sales 
group by Store_name
 order by Total_Monthly_Sales desc; */

/*select distinct(store) as Store_name,max(Weekly_Sales) as Store_revenue 
from walmart_sales 
group by Store_name ;*/

/*select distinct(store) as Store_name,sum(Weekly_Sales) as 
Store_sales from walmart_sales
 group by Store_name
 order by Store_sales desc;*/


/*select distinct(Holiday_Flag) as Holiday_Impact,avg(Weekly_Sales) as average_revenue 
from walmart_sales 
group by Holiday_Impact;*/

/*select     
     case
     when Temperature < 40 then 'Cold (<40°F)'
     when Temperature  between  40 and 60 then 'Cool (40°F to 60°F)'
     when Temperature  between  60 and 80 then 'Moderate (60°F to 80°F)'
     else 'Hot (>80°F)'
     end As  Temperature_Bucket,
     avg(Weekly_Sales) as average_revenue,
     count(*) as Number_of_Weeks
from walmart_sales
group by Temperature_Bucket
order by   average_revenue desc;*/

/*ALTER TABLE walmart_sales
add column Month_name varchar(50);*/

/*set SQL_SAFE_UPDATES = 0;

update walmart_sales
set Month_name =monthname(Date);

set SQL_SAFE_UPDATES = 1;*/
/*select 
     year(Date) as Sales_Year,
	 Month_name,
     sum(Weekly_Sales) as Total_Sales,
     avg(Weekly_Sales) as average_Sales
from walmart_sales
where Month_name = 'January'
group by  Month_name,Sales_Year;*/


/*select Month_Name,sum(Weekly_Sales) as Total_Monthly_Sales 
from walmart_sales
 group by Month_Name 
 order by Total_Monthly_Sales desc; */
 
 /*select 
     year(Date) as Sales_Year,
	 Month_name,
     sum(Weekly_Sales) as Total_Sales,
     avg(Weekly_Sales) as average_Sales
from walmart_sales
group by  Month_name,Sales_Year
order by Sales_Year asc,Total_Sales desc;*/

/*with  Yearly_Store_Sales  as (select year(Date) as Sales_Year,Store,
sum(Weekly_Sales) as Total_Sales
from walmart_sales
group by Sales_Year,Store)

select* from (
select *, rank() over(partition by Sales_Year order by Total_Sales desc) as Sales_Rank
from Yearly_Store_Sales ) as Ranked_Table
where Sales_Rank <= 5 ;*/

/*select 
    case 
    when Unemployment < 5 then 'Low (< 5%)'
    when Unemployment between 5 and 8 then 'Moderate (5-8%)'
    else 'High (>8%)'
    end as Economic_Condition,
    avg(Weekly_Sales) as average_Sales,
    count(*) as Number_of_Weeks
from walmart_sales
group by Economic_Condition
order by average_Sales ;*/

/*DELIMITER //

create procedure GetStorePerformance(in input_store_id int)
begin
    select
         store,
         Round(sum(Weekly_sales), 2) as Total_Sales,
         round(avg(Temperature), 2) as avg_Temprature,
         round(avg(Fuel_Price), 2) as avg_Fuel_Price
         from walmart_sales
         where Store = input_store_id
         group by Store;
 end //
 DELIMITER ;*/
 
 /*create view Holiday_Insights as
 select 
     Date,
     store,
     Weekly_Sales,
     case
     when Holiday_Flag = 1 then 'Holiday Week'
     else 'Normal week'
     end as Week_Type,
     Unemployment,
     CPI
from walmart_sales
where Holiday_Flag = 1 ;*/
     
/*select * from holiday_insights;*/

-- Project overView
/*select 
     store,
     round(sum(Weekly_Sales),2) as Total_Sales,
     round(avg(Weekly_Sales),2) as Avg_Sales,
     round(avg(case when Holiday_Flag = 1 then Weekly_Sales end),2) as Avg_Holiday_Sales,
     round(avg(case when Holiday_Flag = 0 then weekly_Sales end),2) as Avg_Non_Holiday_Sales,
     round(avg(Temperature),2) as Avg_Temperature,
     round(avg(Unemployment),2) as Avg_Unemployment_Rate,
     Rank() over(order by sum(Weekly_Sales) desc) as Revenue_Rank
from walmart_sales
group by Store
order by Revenue_Rank ;*/