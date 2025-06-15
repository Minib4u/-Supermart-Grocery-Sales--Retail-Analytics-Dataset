create database Grocery;
use grocery;

select * from sales;

SELECT `order id`
FROM sales;

 # Check for missing values
SELECT 
  SUM(CASE WHEN `Order ID` IS NULL THEN 1 ELSE 0 END) AS missing_Order_ID,
  SUM(CASE WHEN `Customer Name` IS NULL THEN 1 ELSE 0 END) AS missing_Customer_Name,
  SUM(CASE WHEN `Profit` IS NULL THEN 1 ELSE 0 END) AS missing_Profit
FROM sales;

 # Encode categorical variables
 select 
DENSE_RANK() OVER (PARTITION BY category ORDER BY `sub category` DESC), 
DENSE_RANK() OVER (PARTITION BY `sub category` ORDER BY city DESC), 
DENSE_RANK() OVER (PARTITION BY city ORDER BY region DESC), 
DENSE_RANK() OVER (PARTITION BY region ORDER BY state DESC)
from sales;

select * from sales;

# Distribution of Sales by Category
select category, sum(sales)
from sales
group by category
order by sum(sales)desc;

#highest sales customer name and city
select `order id`,'customer name', city
from sales
order by `order id` desc
limit 1;

#sales trend over time
select `order date`, sum(sales) as total_sales
from sales
group by `order date`
order by total_sales desc;

#avg discount
select avg(discount)
from sales
where discount > 0.30;

# avg profit
select avg(profit)
from sales;

#Max total amount date sales
select `order date`, sales
from sales
order by sales desc
limit 1;

 # Select features and target variable
SELECT Category,`Sub Category`,City, Region, State, Discount, Profit, Sales,
  MONTH(STR_TO_DATE(`Order Date`, '%d-%m-%Y')) AS month_no
FROM sales;

 




  

