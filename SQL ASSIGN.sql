CREATE DATABASE
employee_management;
USE employee_management;
CREATE TABLE departments(
department_id INT PRIMARY KEY,
dapartment_name VARCHAR(100)
);
CREATE TABLE location(
location_id INT PRIMARY KEY,
location VARCHAR(30)
);

CREATE TABLE employees(
employee_id INT PRIMARY KEY,
employee_name VARCHAR(50),
gender ENUM('M','F'),
age INT,
hire_date DATE,
designation VARCHAR(100),
salary DECIMAL(10,2),
department_id INT,
location_id INT,

FOREIGN KEY (department_id)
  REFERENCES
  departments(department_id),
    
    FOREIGN KEY (location_id)
    REFERENCES
   location(location_id)
   );
  
  ALTER TABLE employees
  ADD COLUMN email VARCHAR(150);
  ALTER TABLE employees
  MODIFY COLUMN designation
  VARCHAR(200);
  ALTER TABLE employees
  DROP COLUMN age;
  ALTER TABLE employees
  CHANGE COLUMN hire_date 
  date_of_joining DATE;
  
  ALTER TABLE departments RENAME 
  TO Departments_Info;
  ALTER TABLE location RENAME TO 
  Locations;
  SHOW TABLES;
  TRUNCATE TABLE employees;
  DROP TABLE employees;
  USE employee;
  SHOW TABLES;
  
  
  
  
  
