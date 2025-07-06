create database LabManual;
use LabManual;

CREATE TABLE Employee (
    Employee_id INT AUTO_INCREMENT PRIMARY KEY,
    First_name VARCHAR(255),
    Last_name VARCHAR(255),
    Salary INT,
    Joining_date DATE,
    Department VARCHAR(255)
);

INSERT INTO Employee (Employee_id, First_name, Last_name, Salary, Joining_date, Department)
VALUES 
(1, 'John', 'Abraham', 1000000, STR_TO_DATE('01-JAN-13 12:00:00 AM', '%d-%b-%y %r'), 'Banking'),
(2, 'Michael', 'Clarke', 800000, STR_TO_DATE('01-JAN-13 12:00:00 AM', '%d-%b-%y %r'), 'Insurance'),
(3, 'Roy', 'Thomas', 700000, STR_TO_DATE('01-FEB-13 12:00:00 AM', '%d-%b-%y %r'), 'Banking'),
(4, 'Tom', 'Jose', 600000, STR_TO_DATE('01-FEB-13 12:00:00 AM', '%d-%b-%y %r'), 'Insurance'),
(5, 'Jerry', 'Pinto', 650000, STR_TO_DATE('01-FEB-13 12:00:00 AM', '%d-%b-%y %r'), 'Insurance'),
(6, 'Philip', 'Mathew', 750000, STR_TO_DATE('01-JAN-13 12:00:00 AM', '%d-%b-%y %r'), 'Services'),
(7, 'TestName1', '123', 650000, STR_TO_DATE('01-JAN-13 12:00:00 AM', '%d-%b-%y %r'), 'Services'),
(8, 'TestName2', 'Lname%', 600000, STR_TO_DATE('01-FEB-13 12:00:00 AM', '%d-%b-%y %r'), 'Insurance');


CREATE TABLE Incentives (
    Incentive_id INT AUTO_INCREMENT PRIMARY KEY,
    Employee_ref_id INT,
    Incentive_date DATE,
    Incentive_amount INT,
    FOREIGN KEY (Employee_ref_id) REFERENCES Employee(Employee_id)
);


INSERT INTO Incentives (Employee_ref_id, Incentive_date, Incentive_amount)
VALUES
(1, STR_TO_DATE('01-FEB-13', '%d-%b-%y'), 5000),
(2, STR_TO_DATE('01-FEB-13', '%d-%b-%y'), 3000),
(3, STR_TO_DATE('01-FEB-13', '%d-%b-%y'), 4000),
(1, STR_TO_DATE('01-JAN-13', '%d-%b-%y'), 4500),
(2, STR_TO_DATE('01-JAN-13', '%d-%b-%y'), 3500);

select * from employee;

drop table employee;

select * from Incentives;

Drop table Incentives;

# 3
ALTER TABLE INCENTIVES
ADD CONSTRAINT fk_employee_ref
FOREIGN KEY (Employee_ref_id)
REFERENCES Employee(Employee_id);

# 4
ALTER TABLE Incentives
DROP FOREIGN KEY fk_employee_ref;

# SELECT

# 1 
select * from employee;

# 2
select First_name, Last_name from employee;

# 3
select upper(First_name) AS uppercase_FirstName
from employee;

# SQL ORDER BY

# 1
select distinct department
from employee
order by department;

# 2 
select * from employee
order by First_name ASC;

# 3
SELECT * 
FROM Employee
ORDER BY First_name ASC, Salary DESC;

# SQL GROUP BY QUERY
# 1
select department, sum(Salary) as Total_Salary
from employee
group by department;

# 2
select department, sum(Salary) as Total_Salary
from employee
group by department
order by Total_Salary desc;

# 3
select department, 
count(*) as No_Of_Employee,
sum(Salary) as Total_Salary
from employee
group by department
order by Total_Salary desc;

# 4
select department,
avg(Salary) as Avg_Salary
from employee
group by department
order by Avg_Salary asc;

# 5
select department,
max(Salary) as Max_Salary
from employee
group by department
order by Max_Salary asc;

# 6
select
year(joining_date) as join_year,
month(joining_date) as Join_month,
count(*) as num_employees
from employee
group by year(joining_date), month(joining_date)
order by join_year, join_month;

# 7
select department,
sum(salary) as total_salary
from employee
group by department
having total_salary > 800000
order by total_salary desc;

# SQL Where Condition

# 1
	SELECT * 
	FROM employee
	WHERE First_name = 'John';

# 2
SELECT *
FROM employee
WHERE First_name IN ('John', 'Roy');

SELECT *
FROM employee
WHERE First_name = 'John' OR First_name = 'Roy';

# 3
SELECT *
FROM employee
WHERE First_name NOT IN ('John', 'Roy');


# SQL WILDCARD SEARCH

# 1
SELECT *
FROM employee
WHERE First_name LIKE 'J%';

# 2
SELECT * 
FROM employee
WHERE First_name LIKE '%o%';

# 3
SELECT *
FROM employee
WHERE First_name LIKE '%n';


select * from employee
where First_name = 'John';

# SQL PATTERN MATCHING

# 1
select *
from employee
where First_name Like '___n';

# 2
select *
from employee
where First_name Like 'J___';

# 3
select * 
from employee
where salary > 600000;

# 4
select *
from employee
where salary < 800000;

# 5
select *
from employee
where salary between 500000 and 800000;

# 6
SELECT *
FROM employee
WHERE First_name IN ('Jhon', 'Michael');














