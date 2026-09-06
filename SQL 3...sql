CREATE DATABASE learning_db;
USE learning_db;
CREATE TABLE learners(
learner_id INT PRIMARY KEY,
full_name VARCHAR(100),
country VARCHAR(50)
);
CREATE TABLE courses(
course_id INT PRIMARY KEY,
course_name VARCHAR(100),
category VARCHAR(50),
unit_price DECIMAL(10,2)
);

USE learning_db;
INSERT INTO learners(learner_id,
full_name, country)
VALUES 
(1,'Arun Kumar','India'),
(2, 'Priya Sharma','India'),
(3, 'John Smith','USA'),
(4, 'Maria Garcia','Spain'),
(5, 'David Lee','Dubai');
USE learning_db;
INSERT INTO courses(course_id,
course_name,category,unit_price)
VALUES
(101,'Python Baics','Programming',
500.00),
(102,'SQL Fundamentals','Database',
400.00),
(103,'Power BI','Data Analytics',
600.00),
(104,'Excel Advanced','Productivity',
350.00),
(105,'Python for Data Analysis','Programming',
1000.00);
USE learning_db;
DROP TABLE IF EXISTS purchases;
CREATE TABLE purcahses(
purchase_id INT PRIMARY KEY,
learner_id INT,
course_id INT,
quantity INT,
purchase_date DATE,
FOREIGN KEY(learner_id)
REFERENCES learners(learner_id),
FOREIGN KEY(course_id)
REFERENCES courses(course_id)
);


USE learning_db;
SHOW TABLES;
USE learning_db;
SHOW CREATE TABLE purchaes;
SHOW TABLES FROM learning_db;
USE learning_db;

INSERT INTO purchases
(purchase_id,learner_id,course_id,
quantity,purchase_date)
VALUES
(1,1,101,1,'2026-08-01'),
(2,1,103,2,'2026-08-02'),
(3,2,102,1,'2026-08-03'),
(4,3,104,1,'2026-08-04'),
(5,4,105,1,'2026-08-05'),
(6,5,101,2,'2026-08-06'),
(7,2,104,1,'2026-08-07'),
(8,3,103,1,'2026-08-08');
SELECT*FROM purchases;
USE learning_db;
SHOW CREATE TABLE purchaes;

USE learning_db;
DROP TABLE IF EXISTS purchases;
CREATE TABLE purchases(
purchase_id INT PRIMARY KEY,
learner_id INT,
course_id INT,
quantity INT,
purchase_date DATE
);
SHOW TABLES;
SELECT*FROM purchases
USE learning_db;
SHOW TABLES;
DESCRIBE learners;
DESCRIBE courses;
USE learning_db;
SELECT 
l.learner_id,
l.learner_name,
c.course_name,
c.category,
p.quantity,
p.purchase_date
FROM learners l
INNER JOIN purchases p
ON l.learner_id=p.leaner_id
INNER JOIN courses c
ON p.course_id=c.course_id;
DESCRIBE learners;
USE learning_db;
SELECT 
l.learner_id,
l.full_name AS learner_name;
c.course_name,
c.category,
p.quantity,
c.unit_price
ROUND(p.quantity*c.unit_price,2)
 AS total_amount,
p.purchase_date
FROM learners l
INNER JOIN purchases p
ON l.learner_id=p.leaner_id
INNER JOIN courses c
ON p.course_id=c.course_id;
ORDER BTY total_amount DESC,
DESCRIBE purchases;
DESCRIBE learners;
DESCRIBE courses;
SELECT
    learners.learner_id,
    learners.full_name,
    courses.course_name,
    courses.category,
    purchases.quantity,
    courses.unit_price,
    ROUND(purchases.quantity * courses.unit_price, 2) AS total_amount,
    purchases.purchase_date
FROM learners
INNER JOIN purchases
    ON learners.learner_id = purchases.learner_id
INNER JOIN courses
    ON purchases.course_id = courses.course_id
ORDER BY total_amount DESC;
SELECT
    learners.learner_id,
    learners.full_name AS learner_name,
    courses.course_name,
    courses.category,
    purchases.quantity,
    courses.unit_price,
    ROUND(purchases.quantity * courses.unit_price, 2) AS total_amount,
    purchases.purchase_date
FROM learners
LEFT JOIN purchases
    ON learners.learner_id = purchases.learner_id
LEFT JOIN courses
    ON purchases.course_id = courses.course_id
ORDER BY total_amount DESC;
SELECT 
    c.course_name,
    SUM(p.quantity) AS total_quantity
FROM courses c
JOIN purchases p ON c.course_id = p.course_id
GROUP BY c.course_id, c.course_name
ORDER BY total_quantity DESC
LIMIT 3;
SELECT 
    c.category,
    SUM(p.quantity * c.unit_price) AS total_revenue,
    COUNT(DISTINCT p.learner_id) AS unique_learners
FROM courses c
JOIN purchases p ON c.course_id = p.course_id
GROUP BY c.category;
SELECT 
    c.course_name
FROM courses c
LEFT JOIN purchases p ON c.course_id = p.course_id
WHERE p.course_id IS NULL;




























