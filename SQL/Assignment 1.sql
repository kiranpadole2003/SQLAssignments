CREATE DATABASE studentdb;
USE studentdb;

CREATE TABLE students(
	student_id int auto_increment primary key,
	name varchar(255),
	age int,
	gender varchar(10),
	email varchar(255)
);

INSERT INTO students (name, age, gender, email) VALUES ('Amit Sharma', 21, 'Male', 'amit.sharma@example.com');
INSERT INTO students (name, age, gender, email) VALUES ('Sneha Patel', 20, 'Female', 'sneha.patel@example.com');
INSERT INTO students (name, age, gender, email) VALUES ('Rahul Verma', 22, 'Male', 'rahul.verma@example.com');
INSERT INTO students (name, age, gender, email) VALUES ('Priya Mehta', 19, 'Female', 'priya.mehta@example.com');
INSERT INTO students (name, age, gender, email) VALUES ('Karan Singh', 23, 'Male', 'karan.singh@example.com');
INSERT INTO students (name, age, gender, email) VALUES ('Neha Joshi', 21, 'Female', 'neha.joshi@example.com');
INSERT INTO students (name, age, gender, email) VALUES ('Ankit Desai', 20, 'Male', 'ankit.desai@example.com');
INSERT INTO students (name, age, gender, email) VALUES ('Riya Sen', 22, 'Female', 'riya.sen@example.com');
INSERT INTO students (name, age, gender, email) VALUES ('Vikram Rao', 24, 'Male', 'vikram.rao@example.com');
INSERT INTO students (name, age, gender, email) VALUES ('Tanya Kulkarni', 21, 'Female', 'tanya.kulkarni@example.com');
INSERT INTO students (name, age, gender, email) VALUES ('Deepak Nair', 22, 'Male', 'deepak.nair@example.com');
INSERT INTO students (name, age, gender, email) VALUES ('Pooja Mishra', 20, 'Female', 'pooja.mishra@example.com');
INSERT INTO students (name, age, gender, email) VALUES ('Rohan Gupta', 23, 'Male', 'rohan.gupta@example.com');
INSERT INTO students (name, age, gender, email) VALUES ('Swati Reddy', 21, 'Female', 'swati.reddy@example.com');
INSERT INTO students (name, age, gender, email) VALUES ('Manoj Kumar', 25, 'Male', 'manoj.kumar@example.com');
INSERT INTO students (name, age, gender, email) VALUES ('Kavita Bansal', 20, 'Female', 'kavita.bansal@example.com');
INSERT INTO students (name, age, gender, email) VALUES ('Nikhil Jain', 22, 'Male', 'nikhil.jain@example.com');
INSERT INTO students (name, age, gender, email) VALUES ('Shruti Shah', 19, 'Female', 'shruti.shah@example.com');
INSERT INTO students (name, age, gender, email) VALUES ('Arjun Malhotra', 23, 'Male', 'arjun.malhotra@example.com');
INSERT INTO students (name, age, gender, email) VALUES ('Divya Iyer', 21, 'Female', 'divya.iyer@example.com');


CREATE TABLE courses(
	course_id int auto_increment primary key,
    course_name varchar(255),
    credits int
);

INSERT INTO courses (course_name, credits) VALUES ('Introduction to Computer Science', 4);
INSERT INTO courses (course_name, credits) VALUES ('Database Management Systems', 3);
INSERT INTO courses (course_name, credits) VALUES ('Operating Systems', 4);
INSERT INTO courses (course_name, credits) VALUES ('Data Structures and Algorithms', 4);
INSERT INTO courses (course_name, credits) VALUES ('Web Development Fundamentals', 3);
INSERT INTO courses (course_name, credits) VALUES ('Object-Oriented Programming in Java', 4);
INSERT INTO courses (course_name, credits) VALUES ('Software Engineering', 3);
INSERT INTO courses (course_name, credits) VALUES ('Artificial Intelligence', 4);
INSERT INTO courses (course_name, credits) VALUES ('Mobile App Development', 3);
INSERT INTO courses (course_name, credits) VALUES ('Computer Networks', 3);

CREATE TABLE enrollments(
	enrollment_id int auto_increment primary key,
	student_id int references students(student_id),
    course_id int references courses(course_id),
    enroll_date date 
);

INSERT INTO enrollments (student_id, course_id, enroll_date) VALUES (1, 3, '2024-07-01');
INSERT INTO enrollments (student_id, course_id, enroll_date) VALUES (2, 5, '2024-07-03');
INSERT INTO enrollments (student_id, course_id, enroll_date) VALUES (3, 1, '2024-07-02');
INSERT INTO enrollments (student_id, course_id, enroll_date) VALUES (4, 2, '2024-07-04');
INSERT INTO enrollments (student_id, course_id, enroll_date) VALUES (5, 6, '2024-07-05');
INSERT INTO enrollments (student_id, course_id, enroll_date) VALUES (6, 4, '2024-07-06');
INSERT INTO enrollments (student_id, course_id, enroll_date) VALUES (7, 8, '2024-07-07');
INSERT INTO enrollments (student_id, course_id, enroll_date) VALUES (8, 7, '2024-07-08');
INSERT INTO enrollments (student_id, course_id, enroll_date) VALUES (9, 9, '2024-07-09');
INSERT INTO enrollments (student_id, course_id, enroll_date) VALUES (10, 10, '2024-07-10');

INSERT INTO enrollments (student_id, course_id, enroll_date) VALUES (11, 1, '2024-07-02');
INSERT INTO enrollments (student_id, course_id, enroll_date) VALUES (12, 2, '2024-07-03');
INSERT INTO enrollments (student_id, course_id, enroll_date) VALUES (13, 3, '2024-07-05');
INSERT INTO enrollments (student_id, course_id, enroll_date) VALUES (14, 4, '2024-07-07');
INSERT INTO enrollments (student_id, course_id, enroll_date) VALUES (15, 5, '2024-07-08');
INSERT INTO enrollments (student_id, course_id, enroll_date) VALUES (16, 6, '2024-07-09');
INSERT INTO enrollments (student_id, course_id, enroll_date) VALUES (17, 7, '2024-07-10');
INSERT INTO enrollments (student_id, course_id, enroll_date) VALUES (18, 8, '2024-07-11');
INSERT INTO enrollments (student_id, course_id, enroll_date) VALUES (19, 9, '2024-07-12');
INSERT INTO enrollments (student_id, course_id, enroll_date) VALUES (20, 10, '2024-07-13');

-- Some students enrolled in multiple courses
INSERT INTO enrollments (student_id, course_id, enroll_date) VALUES (1, 2, '2024-07-05');
INSERT INTO enrollments (student_id, course_id, enroll_date) VALUES (3, 4, '2024-07-06');
INSERT INTO enrollments (student_id, course_id, enroll_date) VALUES (5, 1, '2024-07-07');
INSERT INTO enrollments (student_id, course_id, enroll_date) VALUES (7, 5, '2024-07-08');
INSERT INTO enrollments (student_id, course_id, enroll_date) VALUES (9, 6, '2024-07-09');

CREATE TABLE fees(
	student_id int references students(student_id),
    amount int,
    payment_status varchar(50),
    payment_date date
);

INSERT INTO fees (student_id, amount, payment_status, payment_date) VALUES (1, 25000, 'Paid', '2024-06-15');
INSERT INTO fees (student_id, amount, payment_status, payment_date) VALUES (2, 25000, 'Unpaid', NULL);
INSERT INTO fees (student_id, amount, payment_status, payment_date) VALUES (3, 25000, 'Paid', '2024-06-18');
INSERT INTO fees (student_id, amount, payment_status, payment_date) VALUES (4, 25000, 'Paid', '2024-06-20');
INSERT INTO fees (student_id, amount, payment_status, payment_date) VALUES (5, 25000, 'Unpaid', NULL);
INSERT INTO fees (student_id, amount, payment_status, payment_date) VALUES (6, 25000, 'Paid', '2024-06-19');
INSERT INTO fees (student_id, amount, payment_status, payment_date) VALUES (7, 25000, 'Paid', '2024-06-17');
INSERT INTO fees (student_id, amount, payment_status, payment_date) VALUES (8, 25000, 'Unpaid', NULL);
INSERT INTO fees (student_id, amount, payment_status, payment_date) VALUES (9, 25000, 'Paid', '2024-06-22');
INSERT INTO fees (student_id, amount, payment_status, payment_date) VALUES (10, 25000, 'Paid', '2024-06-21');

INSERT INTO fees (student_id, amount, payment_status, payment_date) VALUES (11, 25000, 'Unpaid', NULL);
INSERT INTO fees (student_id, amount, payment_status, payment_date) VALUES (12, 25000, 'Paid', '2024-06-16');
INSERT INTO fees (student_id, amount, payment_status, payment_date) VALUES (13, 25000, 'Paid', '2024-06-20');
INSERT INTO fees (student_id, amount, payment_status, payment_date) VALUES (14, 25000, 'Unpaid', NULL);
INSERT INTO fees (student_id, amount, payment_status, payment_date) VALUES (15, 25000, 'Paid', '2024-06-15');
INSERT INTO fees (student_id, amount, payment_status, payment_date) VALUES (16, 25000, 'Paid', '2024-06-19');
INSERT INTO fees (student_id, amount, payment_status, payment_date) VALUES (17, 25000, 'Unpaid', NULL);
INSERT INTO fees (student_id, amount, payment_status, payment_date) VALUES (18, 25000, 'Paid', '2024-06-23');
INSERT INTO fees (student_id, amount, payment_status, payment_date) VALUES (19, 25000, 'Unpaid', NULL);
INSERT INTO fees (student_id, amount, payment_status, payment_date) VALUES (20, 25000, 'Paid', '2024-06-24');

#1
SELECT * FROM students;

#2
SELECT name, email
FROM students
WHERE gender = 'female';

#3
SELECT course_name, credits
FROM courses;

#4
SELECT email
FROM students
WHERE student_id = 5;

#5
SELECT name
FROM students
WHERE age = 22;

#6
SELECT * FROM courses
WHERE credits = 3;

#7
SELECT DISTINCT gender
FROM students;

#8
SELECT *
FROM students
ORDER BY name
LIMIT 5;

#9
SELECT COUNT(*) as Total_stu
FROM students;

#10
SELECT * FROM students
WHERE name = 'Shruti Shah';

#11
SELECT * FROM students
WHERE age BETWEEN 20 and 22;

#12
SELECT * FROM students
WHERE name LIKE 's%';

#13
SELECT * FROM students
WHERE age IN (19,21,23);

#14
SELECT * FROM students
WHERE email LIKE '%example.com';

#15
SELECT * FROM students
WHERE gender <> 'male';

#17
SELECT * FROM students
WHERE name LIKE '%ya%';

#18
SELECT * FROM students
WHERE name IN ('Priya Mehta', 'Deepak Nair');

#19
SELECT * FROM students
WHERE age = 25;

#20
SELECT * FROM students
WHERE name <> 'Riya Sen';

#21
SELECT * FROM students
ORDER BY age desc;

#22
SELECT * FROM students
ORDER BY age desc
LIMIT 3;

#23
SELECT * FROM students
ORDER BY name asc;

#24
SELECT * FROM courses
ORDER BY credits, course_name;

#25
SELECT * FROM students
ORDER BY gender, age;

#26
SELECT * FROM enrollments
ORDER BY enroll_date
LIMIT 10;

#27
SELECT * FROM students
ORDER BY student_id desc
LIMIT 5;

#28
SELECT * FROM students
ORDER BY age asc
LIMIT 3;

#29
SELECT * FROM courses
ORDER BY course_name desc;

#30
SELECT * FROM enrollments
ORDER BY enroll_date desc
LIMIT 5;

#41
SELECT COUNT(*) AS TOTAL_STU
FROM students;

#42
SELECT AVG(distinct age) AS Avg_age
FROM students;

#43
SELECT COUNT(course_id) as "NO OF Courses"
FROM courses
Where credits > 3;

#44
SELECT SUM(amount) as "Total amount"
FROM fees
WHERE payment_status = 'paid';

#45
SELECT COUNT(amount) as "Total amount"
FROM fees
WHERE payment_status = 'paid';

#46
SELECT course_id, COUNT(student_id) as "No Of Students"
FROM enrollments
GROUP BY course_id;

#47
SELECT MAX(age) as "MAXIMUM AGE", MIN(age) as "MINIMUM AGE"
FROM students;

#48
SELECT gender, COUNT(student_id) as "NO Of Students"
FROM students
GROUP BY gender;

#49
SELECT COUNT(student_id) as "NO Of Student"
FROM fees
WHERE payment_status = 'unpaid';

#50
SELECT AVG(distinct credits) as "Average credits"
FROM courses;

#51
SELECT gender, COUNT(student_id) as "No Of Students"
FROM students
GROUP BY gender;

#52
select * from enrollments;

SELECT student_id, COUNT(course_id) AS "No Of Enrollments"
FROM enrollments
GROUP BY student_id;

#53
SELECT course_id, COUNT(student_id) AS "No of ENROLLMENTS"
FROM enrollments
GROUP BY course_id;

#54
SELECT student_id, COUNT(course_id) AS No_Of_Students
FROM enrollments
GROUP BY student_id
HAVING No_Of_Students > 1;

#55
SELECT payment_status, SUM(amount) as Total_fees
FROM fees
GROUP BY payment_status;

#56
SELECT enroll_date, COUNT(enrollment_id) as NO_Of_enrollment
FROM enrollments
GROUP BY enroll_date;

#57
SELECT age, COUNT(student_id) as NO_Of_Students
FROM students
GROUP BY age;

#58
SELECT course_id, COUNT(enrollment_id) AS No_of_ENROLLMENTS
FROM enrollments
GROUP BY course_id
HAVING No_of_ENROLLMENTS > 1;

#59
SELECT gender, AVG(distinct age) as Avg_age
FROM students
GROUP BY gender;

#60
SELECT payment_date, COUNT(student_id) as No_of_student
FROM fees
WHERE payment_status = 'paid'
GROUP BY payment_date;

#71
select concat(name, ' - ', email) as Information
from students; 

#72
SELECT length(name) as length
from students;

#73
select date_format(payment_date, '%d-%m-%Y') as Payment_date
from fees
where payment_date is not null;

#74
select date_format(curdate(), '%d-%m-%Y') as Today;

#75
select (age - 22) as "Age Difference"
from students;

#76
select floor(credits/2) as NearestInteger
from courses;

#77
select substring(course_name, 1, 5) as info
from courses;

#78
select dayname(enroll_date) as dayName
from enrollments;

#79
select substring(email, 1, instr(email, '@')-1) as UserName
from students;

#83
select distinct age
from students;

#84
select distinct credits
from courses;

#86
ALTER TABLE students
ADD phone char(10) default '8888888888';

#87
ALTER TABLE students
MODIFY email varchar(300);

desc students;

select * from students;

#88
ALTER TABLE courses
drop column credits;

#89
ALTER TABLE students 
modify email varchar(300) unique;

#97
select * from students
limit 5 offset 5;

#98
ALTER TABLE students
RENAME column gender TO sex;

#99
rename table courses to subjects;
