--Data Cleaning 

SELECT * FROM ['SQL - Retail Sales Analysis_utf$']
WHERE 
    sale_date IS NULL OR sale_time IS NULL OR customer_id IS NULL OR 
    gender IS NULL OR age IS NULL OR category IS NULL OR 
    quantiy IS NULL OR price_per_unit IS NULL OR cogs IS NULL;

DELETE FROM ['SQL - Retail Sales Analysis_utf$']
WHERE 
    sale_date IS NULL OR sale_time IS NULL OR customer_id IS NULL OR 
    gender IS NULL OR age IS NULL OR category IS NULL OR 
    quantiy IS NULL OR price_per_unit IS NULL OR cogs IS NULL;
	--Data Exploration and Analysis

	--1. **Write a SQL query to retrieve all columns for sales made on '2022-11-05**:

SELECT *
FROM ['SQL - Retail Sales Analysis_utf$']
WHERE sale_date = '2022-11-05';

--2. **Write a SQL query to retrieve all transactions where the category is 
--'Clothing' and the quantity sold is more than 4 in the month of Nov-2022**:

SELECT *                                           
FROM ['SQL - Retail Sales Analysis_utf$']
where category='Clothing'and DATEPART(YEAR,sale_date)='2022'and DATEPART(MONTH,sale_date)='11'
and quantiy >4

--3. **Write a SQL query to calculate the total sales (total_sale) for each category.**:
select category,sum(total_sale) as Total_sale
from ['SQL - Retail Sales Analysis_utf$']
group by category

--4. **Write a SQL query to find the average age of customers 
--who purchased items from the 'Beauty' category.**:
select category,AVG(age) as Average_age from ['SQL - Retail Sales Analysis_utf$']
where category='Beauty'
group by category

--5. **Write a SQL query to find all transactions where the total_sale is greater than 1000.**:

select * from ['SQL - Retail Sales Analysis_utf$'] where total_sale>1000
--6. **Write a SQL query to find the total number of
transactions (transaction_id) made by each gender in each category.**:

select gender,category,sum(total_sale) as Total_sales from ['SQL - Retail Sales Analysis_utf$']
group by gender,category
--7. **Write a SQL query to calculate the average sale for each month.
Find out best selling month in each year**:

select * from 
(select *,ROW_NUMBER() over (partition by Year order by Avg_Sales  )as Rn from 
(select DATEPART(YEAR,sale_date) as Year,DATEPART(MONTH,sale_date) as Month,
AVG(total_sale) as Avg_Sales from ['SQL - Retail Sales Analysis_utf$']
group by DATEPART(YEAR,sale_date),DATEPART(MONTH,sale_date)) as A) as B
where Rn =1

--8. **Write a SQL query to find the top 5 customers based on the highest total sales **:
SELECT top 5
    customer_id,
    SUM(total_sale) as total_sales
FROM ['SQL - Retail Sales Analysis_utf$']
group by customer_id
order by total_sales desc

--9. **Write a SQL query to find the number of unique customers who 
purchased items from each category.**:

SELECT 
    category,    
    COUNT(DISTINCT customer_id) as cnt_unique_cs
FROM ['SQL - Retail Sales Analysis_utf$']
GROUP BY category

--10. **Write a SQL query to create each shift and number of 
orders (Example Morning <12, Afternoon Between 12 & 17, Evening7)**: >1

SELECT 
    CASE 
        WHEN DATEPART(HOUR, sale_time) < 12 THEN 'Morning'
        WHEN DATEPART(HOUR, sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END AS Shift,
    COUNT(*) AS Number_of_Orders
FROM ['SQL - Retail Sales Analysis_utf$']
GROUP BY 
    CASE 
        WHEN DATEPART(HOUR, sale_time) < 12 THEN 'Morning'
        WHEN DATEPART(HOUR, sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END
ORDER BY Number_of_Orders DESC;