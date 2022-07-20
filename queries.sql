-- acces mysql command prompt gui editore
mysql -u root -p 

-- crud operations

-- show databse
show databases;

-- create database
CREATE DATABASE prodapt_database;

--use database
USE prodapt_database;

--show tables / list tables
SHOW TABLES;

--create Table
--VARCHAR(M) 1 AND 255

CREATE TABLE course_list (
    course_id INT NOT NULL AUTO_INCREMENT,
    course_title VARCHAR(50) NOT NULL,
    course_author VARCHAR(40) NOT NULL,
    course_date DATE,
    PRIMARY KEY(course_id)
)

CREATE TABLE employee_list (
    employee_id INT NOT NULL AUTO_INCREMENT,
    employee_name VARCHAR(50) NOT NULL,
    employee_profession VARCHAR(40) NOT NULL,
    employee_dateofbirth DATE,
    PRIMARY KEY(employee_id)
)

--drop table

DROP TABLE course_list;

-- insert ONE RECORD data into table

INSERT INTO course_list(course_title, course_author, course_date) VALUES ("java" , "aman", NOW ())

-- insert multiple records data into table
INSERT INTO course_list(course_title, course_author, course_date) 
VALUES
("mysql", "aman",NOW()),
("angular", "aman",NOW()),
("api", "aman",NOW());

--select data from table 
select * from course_list;
select course_title from course_list;

-- update records in the table 
UPDATE course_list SET course_title="api testing" WHERE course_id =4;

--delete query
DELETE FROM course_list WHERE course_id=4;


--rename table
RENAME TABLE old_table_name to new_table_name;




ALTER TABLE course_list
ADD
course_score VARCHAR(100) NOT NULL;

--add multiple column

ALTER TABLE course_list
ADD course_score VARCHAR(100) NOT NULL,
ADD course_score_two VARCHAR(100) NOT NULL;

--describe table
describe table_name;

--mopdify column type
ALTER TABLE course_list
MODIFY course_score_two VARCHAR(50) NOT NULL,
MODIFY course_title VARCHAR(100) NOT NULL;

--rename column name
ALTER TABLE course_list
CHANGE COLUMN old_column_name  new_course_name INT NOT NULL;

ALTER TABLE course_list
CHANGE COLUMN course_score_two course_status INT NOT NULL;

--delete column
ALTER TABLE course_list
DROP COLUMN column_name;

--relationships--
--FOREIGN key relationship

CREATE TABLE Orders (
  OrderID INT NOT NULL ,
  OrderNumber INT NOT NULL,
  PersonID int ,
  PRIMARY KEY(OrderID),
CONSTRAINT FK_PersonOrder FOREIGN KEY(PersonID) REFERENCES Persons(PersonID)
)

CREATE TABLE Project (
  ProjectID INT NOT NULL ,
  ProjectNumber INT NOT NULL,
  EmployeeID int ,
  PRIMARY KEY(ProjectID),
  FOREIGN KEY(EmployeeID) REFERENCES Employees(EmployeeID)
);

--ALTER FOREIGN KEY
ALTER TABLE Orders
ADD CONSTRAINT FK_PersonOrder FOREIGN KEY (PersonID) REFERENCES Persons(PersonID)


--drop FOREIGN KEY
ALTER TABLE Orders DROP CONSTRAINT FK_PersonOrder;

-- import existing database
--iside mysql terminal

source path/mysql_file_name

--order details table
select
OrderNumber,
orderLineNumber,
quantityOrdered * priceEach
FROM
orderdetails
ORDER BY 
quantityOrdered* priceEach DESC;

SELECT
OrderNumber,
orderLineNumber,
quantityOrdered * priceEach AS subtotal
FROM
orderdetails
ORDER BY 
subtotal DESC;

-- status
-- In Process
-- On Hold
-- Canceled
-- Resolved
-- Disputed
-- Shipped

SELECT 
orderNumber, status
FROM 
orders
ORDER BY FIELD (status
 "In Process",
"On Hold",
 "Canceled",
 " Resolved",
"Disputed",
"Shipped"
);

SELECT
firstName
lastName
reportsTo
FROM
employees
ORDER BY reportsTo DESC;

--filtering data
-- WHERE
-- SELECT DISTINCT
-- AND 
-- OR
-- In
-- NOT In
-- BETWEEN
-- IS NULL
-- LIMIT

-- FROM -> WHERE -> SELECT ->ORDER BY 
SELECT
firstName,
lastName,
jobTitle
FROM
employees
WHERE
jobTitle="sales rep";

SELECT
firstName,
lastName,
jobTitle,
officeCode
FROM
employees
WHERE
jobTitle="sales rep" AND
officeCode=1;


SELECT
firstName,
lastName,
jobTitle
officeCode
FROM
employees
WHERE
jobTitle="sales rep" OR
officeCode=1;
ORDER BY
jobTitle,
officeCode

----------
SELECT
firstName,
lastName,
officeCode
FROM
employees
WHERE
officeCode BETWEEN 1 AND 3
ORDER BY
officeCode;

--LIKE CLAUSE
SELECT
firstName,
lastName
FROM
employees
WHERE
lastName LIKE'%son'
ORDER BY firstName;

"Tho%"
"%son"
"%att%"
"_r%"
'a_%'
"a__%"
"t%n"

-----IN operator

SELECT
firstName,
lastName,
officeCode
FROM
employees
WHERE
officeCode IN (1,2,3)
ORDER BY
officeCod