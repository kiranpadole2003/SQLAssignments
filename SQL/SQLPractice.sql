CREATE DATABASE net2net;
USE net2net;

CREATE TABLE employee (
id INT,
name VARCHAR(255),
age int,
department varchar(50) not null,
city varchar(50) not null,
salary int);

Insert into employee(id, name, age, department, city, salary)
VALUES
(1, "Rahul Vaerma", 25, "IT", "mumbai", 15000),
(2, "Afsara Khan", 26, "HR", "pune", 20000), 
(3, "Abhimanyu Joshi", 27, "IT", "mumbai", 25000),
(4, "Adity Pandit", 25, "marketing", "surat", 24000),
(5, "Raj Joshi", 24, "finance", "indore", 15000);

select * from employee;

Drop table employee;

SET SQL_SAFE_UPDATES = 0;

UPDATE employee
SET salary = 50000
WHERE department = 'HR';

SET SQL_SAFE_UPDATES = 1;

UPDATE employee
set name = 'Raaj Joshi'
where name = 'Raj Joshi';

DELETE FROM employee
where department = 'HR';

DELETE FROM employee
where name = 'Raj Joshi';

SELECT * 
FROM employee
WHERE age > 25;

desc employee; 

alter table employee
add commission int default 0;

alter table employee
drop column commission;

alter table employee
modify name varchar(100);

alter table employee 
change name fullname varchar(50);

ALTER TABLE employee
RENAME COLUMN fullname TO name;

rename table employee to emp;
rename table emp to employee;

rename database net2net to net2netdb;

create table T(c char(1), y char(1));

insert into T values
('a', 'b'),
('a', 'z'),
('b', 't'),
('a', 'k'),
('c', 'm'),
('a', 'b'),
('b', 't');

select * from T;

select distinct c from T;

select distinct c, y from T;

select distinct city
from employee;

select distinct department
from employee;


select id, name, salary, salary * 0.03 as commission
from employee
where age + 2 > 25;

select 5 + 2 as "add", 5 - 2 as sub, -5 * 2 as mul,
 5 / 2 as "div", 5 % -2 as rem;

select * from employee
where department = 'IT';

select * from employee
where age > 25;

select * from employee
where department not in ('HR', 'IT');

select * from employee limit 2;

select * from employee order by salary desc;

select *
from employee
where id = 1;

select * 
from employee
where id = 1 and city = 'mumbai';

select * from employee
where salary > 1200 and city = 'mumbai';

select * from employee
where city not in ('mumbai');

select * from employee
order by salary desc;

select * 
from employee
order by salary desc
limit 2;

select count(*) as Total_emp
from employee;

select sum(salary) as tot_sal,
avg(salary) as avg_sal,
min(salary) as Min_sal,
max(salary) as max_sal
from employee;

select min(name), max(name)
from employee;

select department, avg(salary)
from employee
group by department;

select * from employee;

select city, count(id) as noOfEmployee
from employee
group by city;

select city, max(Salary) as MaxSalary
from employee
group by city
order by city desc;

select department, count(id) as noOfEmployee
from employee
group by department
order by noOfEmployee desc;

select department, avg(salary) as avgSal
from employee
group by department
having avgSal > 20000;


select lower(city), upper(city), length(city)
from employee;

select concat(name, ' stay in ', city) as "Information"
from employee;

select substring(name, 1, 5)
from employee;

select replace(name, ' ', '. ')
from employee;

select trim('   Ram   Verma   ');

select reverse(name)
from employee;

select abs(-100), ceil(10.3), floor(10.3), round(12.459456, 2), 
mod(28, 3), pow(2, 10), sqrt(256), rand();

select now();
select monthname(curdate());
select date(curdate());
select month(curdate());
select day(curdate());
select datediff('2025-07-01', '2025-06-17');
select date_add('2025-07-01', interval 10 day);
select date_add('2025-07-01', interval 10 month);
select date_add('2025-07-01', interval 10 year);
