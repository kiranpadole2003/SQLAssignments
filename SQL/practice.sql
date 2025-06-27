CREATE DATABASE company;
use company;

CREATE TABLE salesman(
salesman_id INT PRIMARY KEY,
name VARCHAR(50),
city VARCHAR(20),
commission FLOAT NOT NULL
);

INSERT INTO salesman
(salesman_id, name, city, commission)
VALUES
(5001, "James Hoog", "New York", 0.15),
(5002, "Nail Knite", "Paris", 0.13),
(5005, "Pit Alex", "London", 0.11),
(5006, "Mc Lyon", "Paris", 0.14),
(5003, "Lauson Hen", "",0.12),
(5007, "Paul Adam", "Rome", 0.13);

SELECT * FROM  salesman;

CREATE TABLE customer(
customer_id INT PRIMARY KEY,
customer_name VARCHAR(50),
city VARCHAR(20),
grade VARCHAR(3),
salesman_id INT,
FOREIGN KEY (salesman_id) REFERENCES salesman(salesman_id)
);

INSERT INTO customer
(customer_id, customer_name, city, grade, salesman_id)
VALUES
(3002, "Nick Rimando", "New York", 100, 5001),
(3005, "Graham Zusi", "California", 200, 5002),
(3001, "Brad Guzan", "London", NULL, NULL),
(3004, "Fabian Johns", "Paris", 300, 5006),
(3007, "Brad Davis", "New York", 200, 5001),
(3009, "Geoff Camero", "Berlin", 100, NULL),
(3008, "Julian Green", "London", 300, 5002),
(3003, "Jozy Altidor", "Moncow", 200, 5007);

SELECT * FROM  customer;

CREATE TABLE order1(
order_no INT PRIMARY KEY,
purch_amt FLOAT,
order_date DATE,
customer_id INT,
FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
salesman_id INT,
FOREIGN KEY (salesman_id) REFERENCES salesman(salesman_id)
);

INSERT INTO order1
(order_no, purch_amt, order_date, customer_id, salesman_id)
VALUES
(70001, 150.5, '2016-10-05', 3005, 5002),
(70009, 270.65, '2016-09-10', 3001, NULL),
(70002, 65.26, '2016-10-05', 3002, 5001),
(70004, 110.5, '2016-08-17', 3009, NULL),
(70007, 948.5, '2016-09-10', 3005, 5002),
(70005, 2400.6, '2016-07-27', 3007, 5001),
(70008, 5760, '2016-09-10', 3002, 5001),
(70010, 1983.43, '2016-10-10', 3004, 5006),
(70003, 2480.4, '2016-10-10', 3009, NULL),
(70012, 250.45, '2016-06-27', 3008, 5002),
(70011, 75.29, '2016-08-17', 3003, 5007);

SELECT * FROM order1;

-- display name and commissin of all the salesmen-- 
SELECT name, commission FROM salesman;


-- Retrieve salesman id of all salesmen from orders table without any repeat-- 
SELECT DISTINCT salesman_id FROM order1;

-- display names and city of salesman, who belong to city of paris--
SELECT name, city
FROM salesman
WHERE city='paris'; 

-- display all the information for those customers with a grade of 200-- 
SELECT *
FROM customer
WHERE grade=200;

-- display the order number, order date and the purchase amount for order which will be delivered by the salesman with Id 500 -- 
SELECT 
order_no, order_date,
purch_amt 
FROM order1
WHERE salesman_id=5001;

-- display all the customer, eho are either belongs to the city New Yok  or not had a grade above 100-- 
SELECT * 
FROM customer
WHERE city='new york' OR NOT grade>100;

-- find those salesmen with all information who gets the commission within a range of 0.12 and 0.14--  
SELECT *
FROM salesman
WHERE commission between 0.12 AND 0.14;

-- find all those customer with all information whose names ending with letter'n'
SELECT *
FROM customer
WHERE customer_name LIKE '%n';

-- find those salesman with all information whose name containing the 1st character is 'N' and the character I and reset may be any character-- 
SELECT *
FROM salesman
WHERE name LIKE 'N__i%';

-- find the customer with all information who does not get any grade except null -- 
SELECT *
FROM customer
WHERE grade IS NULL;

-- find the total purchase amount of all orders -- 
SELECT SUM(purch_amt)
FROM order1;

-- find the number of salesman currently listing for all of their customer -- 
SELECT COUNT(salesman_id)
FROM order1;

SELECT COUNT(DISTINCT salesman_id)
FROM order1;


-- find the highest grade for each of the cities of the customers -- 
SELECT city,MAX(grade)
FROM customer
GROUP BY city;

-- find the highest purchase amount ordered by the each customer with their ID and highest purchase amount -- 
SELECT customer_id,MAX(purch_amt)
FROM order1
GROUP BY customer_id;

-- find the highest purchase amount ordered by the each customer on a practicular date with their Id, order date and highest purchase amount
SELECT customer_id, order_date, MAX(purch_amt)
FROM order1
GROUP BY customer_id, order_date;


-- find the highest purchase amount on a date '2012-08-17' for each salesman with their ID -- 
SELECT salesman_id, MAX(purch_amt) 
FROM order1
WHERE order_date = '2016-08-17'
GROUP BY salesman_id;

-- find the highest purchase amount with their customer ID and order date, for only those customer who have the highest purchase amount in a day is more than 2000-- 
SELECT customer_id, order_date, MAX(purch_amt)
FROM order1
GROUP BY customer_id, order_date
HAVING MAX(purch_amt) > 2000.00;

-- write a sql statement that counts all orders for a date august 17th,2026
SELECT COUNT(*)
FROM order1
WHERE order_date = '2016-08-17';







-- (table:nobel_win)-- 

CREATE TABLE nobel_win(
years INT,
subjects VARCHAR(20),
winner VARCHAR(50),
country VARCHAR(30),
category VARCHAR(50));

INSERT INTO nobel_win
(years, subjects, winner, country, category)
VALUES
(1970, "Physics", "Hannes Alfven", "Sweden", "Scientist"),
(1970, "Physics", "Louis Neel", "Louis Neel", "Scientist"),
(1970, "Chemistry", "Luis Federico Leloir", "France","Scientist"),
(1970, "Physiology", "Ulf von Euler", "Sweden", "Scientist"),
(1970, "Physiology", "Bernard Katz", "Germany", "Scientist"),
(1970, "Literature", "Aleksandr Solzhenitsyn", "Russia", "Linguist"),
(1970, "Economics", "Paul Samuelson", "USA", "Economist"),
(1970, "Physiology", "Julius Axelrod", "USA", "Scientist"),
(1971, "Physics", "Dennis Gabor", "Hungary", "Scientist"),
(1971, "Chemistry", "Gerhard Herzberg", "Germany", "Scientist"),
(1971, "Peace", "Willy Brandt", "Germany", "Chancellor"),
(1971, "Literature", "Pablo Neruda", "Chile", "Linguist"),
(1971, "Economics", "Simon Kuznets", "Russia", "Economist"),
(1978, "Peace", "Anwar al-Sadat", "Egypt", "President"),
(1978, "Peace", "Menachem Begin", "Israel", "Prime Minister"),
(1987, "Chemistry", "Donald J. Cram", "USA", "Scientist"),
(1987, "Chemistry", "Jean-Marie Lehn", "France", "Scientist"),
(1987, "Physiology", "Susumu Tonegawa", "Japan", "Scientist"),
(1994, "Economics", "Reinhard Selten", "Germany", "Economist"),
(1994, "Peace", "Yitzhak Rabin", "Israel", "Prime Minister"),
(1987, "Physics", "Johannes Georg Bednorz", "Germany", "Scientist"),
(1987, "Literature", "Joseph Brodsky", "Russia", "Linguist"),
(1987, "Economics", "Robert Solow", "USA", "Economist"),
(1994, "Literature", "Kenzaburo Oe", "Japan", "Linguist");  

-- show the winner of the 1971 prize for literature-- 
SELECT winner
FROM nobel_win
WHERE years=1971
AND subjects='Literature';

-- show all the details of the winner with frist name Louis-- 
SELECT *
FROM nobel_win
WHERE winner LIKE'Louis%';

-- show all the winner in physics for 1970 together with the winner of economics for 1971-- 
SELECT * 
FROM nobel_win
WHERE (subjects = 'Physics' AND years=1970)
UNION
(SELECT *
FROM nobel_win
WHERE(subjects='Economics' AND years=1971));

-- show all the winners of Nobel prize in the year 1970 except the subject physilogy and economics-- 
SELECT * 
FROM nobel_win
where years=1970
AND subjects NOT IN ('Physiology','Economics');

-- find all the details of the nobel winners for  the subject not started with the letter "P' and arranged the list as the most recent comes frist, then by name in order-- 
SELECT * 
FROM nobel_win
WHERE subjects NOT LIKE 'P%'
ORDER BY years DESC, winner;

CREATE TABLE item_mast
(PRO_ID INT,
PRO_NAME VARCHAR(50),
PRO_PRICE FLOAT,
PRO_COM INT);

INSERT INTO item_mast
(PRO_ID, PRO_NAME, PRO_PRICE, PRO_COM)
VALUES
( 101,'Mother Board', 3200.00, 15),
( 102,'Key Board', 450.00, 16),
( 103,'ZIP drive', 250.00, 14),
( 104,'Speaker', 550.00, 16),
( 105,'Monitor', 5000.00, 11),
( 106,'DVD drive', 900.00, 12),
( 107,'CD drive', 800.00, 12),
( 108,'Printer', 2600.00, 13),
( 109,'Refill cartridge', 350.00, 13),
( 110,'Mouse', 250.00, 12);

-- FIND THE NAME AND PRICE OF THE CHEAPEST ITEMS-- 
SELECT PRO_NAME, PRO_PRICE
FROM item_mast
WHERE PRO_PRICE = (SELECT MIN(PRO_PRICE)FROM item_mast);

-- PRACTICE PART-2-- 
-- JOINS-- 

-- find the name and city of those customers and salesmen who lives in the same city -- 
SELECT C.customer_name, S.name, S.city
FROM salesman AS S
INNER JOIN customer AS C
WHERE S.city = C.city;

-- find the names of all customer along with the salesmen who works for them -- 
SELECT customer.customer_name, salesman.salesman_name
FROM customer, salesman
WHERE salesman.salesman_id = customer.salesman_id;

SELECT customer.customer_name, salesman.names
FROM customer
INNER JOIN salesman ON salesman.salesman_id = customer.salesman_id;




DROP DATABASE company;