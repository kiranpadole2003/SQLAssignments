create database windowfunction;

use windowfunction;

create table sales(
	sales_employee varchar(50) not null,
    fiscal_year int not null,
    sale decimal(14, 2) not null,
    primary key(sales_employee, fiscal_year)
);
drop table sales;

insert into sales values('Bob', 2016, 100),
('Bob', 2017, 150),
('Bob', 2018, 200),
('Alice', 2016, 150),
('Alice', 2017, 100),
('Alice', 2018, 200),
('Jhon', 2016, 200),
('Jhon', 2017, 150),
('Jhon', 2018, 250);

select * from sales
order by sales_employee;

select sum(sale)
from sales;

select fiscal_year, sum(sale)
from sales
group by fiscal_year;

select fiscal_year, sales_employee, sale,
	sum(sale) over (partition by fiscal_year order by sale) total_sales
from sales;

# Row_Number()
select *,
	row_number() over(partition by sales_employee order by fiscal_year) as row_num
from sales;

# Rank() - ranks with gaps for ties
select *,
	rank() over(partition by fiscal_year order by sale desc) as rank_in_year
from sales;

# DENSE_RANK() - Rank without gaps
select *,
	dense_rank() over(partition by fiscal_year order by sale desc) as dense_rank_in_year
from sales;

# NTILE(n) - divide row into equal-sized bunckets
select *,
	ntile(2) over(partition by fiscal_year order by sale desc) as half_group
from sales;

# LAG() - get previous row's value
select *,
	lag(sale, 1) over(partition by sales_employee order by fiscal_year) as prev_year_sale
from sales;

# lead() - get next row's value
select *,
	lead(sale, 1) over(partition by sales_employee order by fiscal_year) as next_year_sale
from sales;

# First_value() - first value in window
select *,
	first_value(sale)
    over(partition by sales_employee order by fiscal_year) as first_year_sale
from sales;

# Last_value() - last value in window
SELECT *,
  LAST_VALUE(sale) OVER (
    PARTITION BY sales_employee
    ORDER BY fiscal_year
    ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
  ) AS last_year_sale
FROM sales;

# Percent of Total sale in a year(Using sum & partition)
select *,
	round(100.0 * sale / sum(sale) over(partition by fiscal_year), 2)
    as percent_of_yearly_total
    from sales;
  
# Cummulative Toatl using sum()
select *,
	sum(sale) over(partition by sales_employee order by fiscal_year desc) as sales_sum
from sales;

# Total sale of each employee using sum()
select *,
	sum(sale) over(partition by sales_employee) as total_sale
from sales;

# Average sales per employee over year
select *,
	avg(sale) over(partition by sales_employee) as avg_sale_per_emp
from sales;