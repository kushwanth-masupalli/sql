--                                    MY SQL
/*  
        SQL  refers to  STRUCTURED QUEURY LANGUAGE 
        MY SQL is  a  relational database management system

        RDBMS -
                An RDBMS (Relational Database Management System) is a type of database 
                management system that stores data in a structured format using tables. Each
                table consists of rows and columns, and data across tables is linked through 
                relationships based on keys (like primary and foreign keys). This structure
                makes it easier to organize, retrieve, and manipulate data.

        MySQL is ideal for both small and large applications
        MySQL is very fast, reliable, scalable, and easy to use
        MySQL is cross-platform

        all keywords in sql are not case sensitive  as == AS .



*/


/*                     CREATING TABLES IN MYSQL
  
       CREATE TABLE table_name(
           column_name type ,
           column_name type,
           .
           .
           .
       );


       CREATE TABLE IF NOT EXISTS(
           column_name type,
           column_name type,
           .
           .
           .
       );

       DESCRIBE TABLE; -- this command is used to describe table is exists
       SHOW COLUMNS FROM table_name;  --  similar to describe


*/



/*                          DATATYPES IN SQL
     
    INT          -- stores an integer
    FLOAT(P)     --float with precison p 
                    EX : 123.456 if p=5 the the number will be 123.45
                    p is max no it can store
    DOUBLE       -- double precison floating point number
    DECIMAL(P,S) --  p is max no it can store
                     s is no of digits after decimal
    
   CHAR(n)	   --Fixed-length string of n characters.
   VARCHAR(n)  --	Variable-length string with a maximum of n characters.
   TEXT        --Variable-length text (large amount of text).
  

  DATE	    --Stores date values in YYYY-MM-DD format.
  TIME	    --Stores time values in HH:MM:SS format.
  DATETIME	--Stores date and time in YYYY-MM-DD HH:MM:SS format.
  TIMESTAMP	--Stores date and time; often used for recording when a row was created or modified.
  YEAR	    --Stores a year value, typically YYYY.
                       

     
*/

/*
       SOME IMPORTANT KEYWORDS

       1)PRIMARY KEY -- this will make the column that you wrote as primary
       2)FOREIGN KEY -- this will make the column foreign key

              column_name data_type,
              FOREIGN KEY (column_name) REFERENCES other_table (column_name);
       
       3)AUTO_INCREMENT -- this will automatically increment the int datatype of the column
       4)DEFAULT "value" -- this will give a give value to it if no value is given
       5)NOT NULL --  the give column should not be a null
       6)UNIQUE  --this will ensure that all the values are unique 
       7)ON DELETE SET CASCADE --
       
        FOREIGN KEY (column_name) REFERENCES parent_table(column_name) ON DELETE CASCADE;
      
       8)ON DELETE SET NULL --

       FOREIGN KEY (column_name) REFERENCES parent_table(column_name) ON DELETE NULL;


*/

/*
             INSERTION INTO TABLE 
        
        --to insert a single value
        INSERT INTO table_name(col1,col2,clo3) VALUES(value1,value2,value3);
        
        --to insert multiple values
        INSERT INTO table_name (column1, column2, column3, ...)
        VALUES (value1, value2, value3, ...), 
        (value1, value2, value3, ...),
        (value1, value2, value3, ...);


        REPLACE INTO is similar to INSERT, but if a row with the same primary key or unique
        key already exists, it will delete the old row and insert the new one.
        
        
        REPLACE INTO table_name (column1, column2, column3, ...)
        VALUES (value1, value2, value3, ...);
*/
CREATE TABLE employee (
  emp_id INT PRIMARY KEY,
  first_name VARCHAR(40),
  last_name VARCHAR(40),
  birth_day DATE,
  sex VARCHAR(1),
  salary INT,
  super_id INT,
  branch_id INT
);

CREATE TABLE branch (
  branch_id INT PRIMARY KEY,
  branch_name VARCHAR(40),
  mgr_id INT,
  mgr_start_date DATE,
  FOREIGN KEY(mgr_id) REFERENCES employee(emp_id) ON DELETE SET NULL
);

ALTER TABLE employee
ADD FOREIGN KEY(branch_id)
REFERENCES branch(branch_id)
ON DELETE SET NULL;

ALTER TABLE employee
ADD FOREIGN KEY(super_id)
REFERENCES employee(emp_id)
ON DELETE SET NULL;

CREATE TABLE client (
  client_id INT PRIMARY KEY,
  client_name VARCHAR(40),
  branch_id INT,
  FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE SET NULL
);

CREATE TABLE works_with (
  emp_id INT,
  client_id INT,
  total_sales INT,
  PRIMARY KEY(emp_id, client_id),
  FOREIGN KEY(emp_id) REFERENCES employee(emp_id) ON DELETE CASCADE,
  FOREIGN KEY(client_id) REFERENCES client(client_id) ON DELETE CASCADE
);

CREATE TABLE branch_supplier (
  branch_id INT,
  supplier_name VARCHAR(40),
  supply_type VARCHAR(40),
  PRIMARY KEY(branch_id, supplier_name),
  FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE CASCADE
);


-- -----------------------------------------------------------------------------

-- Corporate
INSERT INTO employee VALUES(100, 'David', 'Wallace', '1967-11-17', 'M', 250000, NULL, NULL);

INSERT INTO branch VALUES(1, 'Corporate', 100, '2006-02-09');

UPDATE employee
SET branch_id = 1
WHERE emp_id = 100;

INSERT INTO employee VALUES(101, 'Jan', 'Levinson', '1961-05-11', 'F', 110000, 100, 1);

-- Scranton
INSERT INTO employee VALUES(102, 'Michael', 'Scott', '1964-03-15', 'M', 75000, 100, NULL);

INSERT INTO branch VALUES(2, 'Scranton', 102, '1992-04-06');

UPDATE employee
SET branch_id = 2
WHERE emp_id = 102;

  INSERT INTO employee VALUES(103, 'Angela', 'Martin', '1971-06-25', 'F', 63000, 102, 2);
  INSERT INTO employee VALUES(104, 'Kelly', 'Kapoor', '1980-02-05', 'F', 55000, 102, 2);
  INSERT INTO employee VALUES(105, 'Stanley', 'Hudson', '1958-02-19', 'M', 69000, 102, 2);

-- Stamford
INSERT INTO employee VALUES(106, 'Josh', 'Porter', '1969-09-05', 'M', 78000, 100, NULL);

INSERT INTO branch VALUES(3, 'Stamford', 106, '1998-02-13');

UPDATE employee
SET branch_id = 3
WHERE emp_id = 106;

INSERT INTO employee VALUES(107, 'Andy', 'Bernard', '1973-07-22', 'M', 65000, 106, 3);
INSERT INTO employee VALUES(108, 'Jim', 'Halpert', '1978-10-01', 'M', 71000, 106, 3);


-- BRANCH SUPPLIER
INSERT INTO branch_supplier VALUES(2, 'Hammer Mill', 'Paper');
INSERT INTO branch_supplier VALUES(2, 'Uni-ball', 'Writing Utensils');
INSERT INTO branch_supplier VALUES(3, 'Patriot Paper', 'Paper');
INSERT INTO branch_supplier VALUES(2, 'J.T. Forms & Labels', 'Custom Forms');
INSERT INTO branch_supplier VALUES(3, 'Uni-ball', 'Writing Utensils');
INSERT INTO branch_supplier VALUES(3, 'Hammer Mill', 'Paper');
INSERT INTO branch_supplier VALUES(3, 'Stamford Lables', 'Custom Forms');

-- CLIENT
INSERT INTO client VALUES(400, 'Dunmore Highschool', 2);
INSERT INTO client VALUES(401, 'Lackawana Country', 2);
INSERT INTO client VALUES(402, 'FedEx', 3);
INSERT INTO client VALUES(403, 'John Daly Law, LLC', 3);
INSERT INTO client VALUES(404, 'Scranton Whitepages', 2);
INSERT INTO client VALUES(405, 'Times Newspaper', 3);
INSERT INTO client VALUES(406, 'FedEx', 2);

-- WORKS_WITH
INSERT INTO works_with VALUES(105, 400, 55000);
INSERT INTO works_with VALUES(102, 401, 267000);
INSERT INTO works_with VALUES(108, 402, 22500);
INSERT INTO works_with VALUES(107, 403, 5000);
INSERT INTO works_with VALUES(108, 403, 12000);
INSERT INTO works_with VALUES(105, 404, 33000);
INSERT INTO works_with VALUES(107, 405, 26000);
INSERT INTO works_with VALUES(102, 406, 15000);
INSERT INTO works_with VALUES(105, 406, 130000);



select * from employee;

select * from employee 
where emp_id >104;            -- here we have used where

select first_name,sex 
from employee;

select distinct sex           --it will give distinct things
from employee;

/*      AND Syntax
            SELECT column1, column2, ... 
            FROM table_name
            WHERE condition1 AND condition2 AND condition3 ...;
        OR Syntax
            SELECT column1, column2, ...
            FROM table_name
            WHERE condition1 OR condition2 OR condition3 ...;
        NOT Syntax
            SELECT column1, column2, ...
            FROM table_name
            WHERE NOT condition;

*/
select first_name 
from employee
where super_id=1 OR branch_id =3;   


/*                ORDER BY 
      The ORDER BY keyword is used to sort the result-set in
       ascending or descending order.

       The ORDER BY keyword sorts the records in ascending order by default. 
       To sort the records in descending order, use the DESC keyword.
*/
select first_name,emp_id
from employee
order by salary;

select * from employee;

select first_name,super_id
from employee
order by super_id,first_name desc;


select first_name as name 
from employee 
where super_id is not null;

/*          UPDATE 
        UPDATE table_name
        SET column1 = value1, column2 = value2, ...
        WHERE condition;

        DELETE FROM table_name WHERE condition;

*/

/*                  LIMIT 
      this key word will limit the no of outputs 
*/

select first_name ,emp_id 
from employee
limit 5;

/*
             MIN and MAX 
    
    these two functions will give the min and max values from a column
*/
select MIN(salary),MAX(salary)
from employee;

select MAX(salary)
from employee;



/*
         COUNT 
         
         The COUNT() function returns the number of rows
          that matches a specified criterion.
        
        
         SELECT COUNT(column_name)
         FROM table_name
         WHERE condition;

*/
select count(emp_id)
from employee
where super_id=102;


/*   The AVG() function returns the average value of a numeric column. 


       SELECT AVG(column_name)
       FROM table_name
       WHERE condition;
    
    The SUM() function returns the total sum of a numeric column. 


      SELECT SUM(column_name)
      FROM table_name
      WHERE condition;
  

*/

select AVG(salary) as avg_salary
from employee
where salary>78000;

select sum(salary) as sumofsalary
from employee;


/*          LIKE Syntax
     SELECT column1, column2, ...
     FROM table_name
     WHERE columnN LIKE pattern;
  
*/

select first_name 
from employee 
where first_name like 'j%';

select * 
from employee
where first_name not like 'j%';




/*             Wildcard Characters in MySQL
       
       Symbol    	Description	Example
       %	     Represents zero or more characters	bl% finds bl, black, blue, and blob
       _	     Represents a single character	h_t finds hot, hat, and hit
*/

select * from employee
where emp_id like '1_5';


/*
             IN Syntax
         SELECT column_name(s)
         FROM table_name
         WHERE column_name IN (value1, value2, ...);
*/


select * from employee
where emp_id in (100,101,102,103);

select * from employee 
where emp_id in (select emp_id from employee where emp_id<104);




/*
          BETWEEN Syntax
    SELECT column_name(s)
    FROM table_name
    WHERE column_name BETWEEN value1 AND value2;
*/

select * from employee
where emp_id between 101 AND 105;

/*       MySQL Joining Tables
      
       A JOIN clause is used to combine rows from two or more tables,
        based on a related column between them.


        INNER JOIN: Returns records that have matching values in both tables
        LEFT JOIN: Returns all records from the left table, and the matched records from the right table
        RIGHT JOIN: Returns all records from the right table, and the matched records from the left table
        CROSS JOIN: Returns all records from both tables

*/

select client_name from client
inner join branch on client.branch_id =branch.branch_id;


select client_name from client
left join branch on client.branch_id =branch.branch_id;


select client_name from client
right join branch on client.branch_id =branch.branch_id;


select client_name from client
cross join branch on client.branch_id =branch.branch_id;


/*                UNION 
         SELECT column_name(s) FROM table1
         UNION
         SELECT column_name(s) FROM table2;

         Every SELECT statement within UNION must have the same number of columns
         The columns must also have similar data types
         The columns in every SELECT statement must also be in the same order

         select distinct values by default if you want duplicates also mean
         use UNION ALL 

  
*/


select client_name,client_id
from client
union 
select  branch_name,branch_id  from branch;
 

 /*          GROUP 
     
     The GROUP BY statement groups rows that have the same values into summary
      rows, like "find the number of customers in each country".

     The GROUP BY statement is often used with aggregate functions (COUNT(),
     MAX(), MIN(), SUM(), AVG()) to group the result-set by one or more columns.
 
 */

select count(sex),sex
from employee
group by(sex);


select count(branch_id),branch_id
from branch_supplier
group by branch_id;



/*         HAVING 
        

         SELECT column_name(s)
         FROM table_name
         WHERE condition
         GROUP BY column_name(s)
         HAVING condition
        

*/


select count(branch_id),branch_id
from branch_supplier
group by branch_id
having branch_id>2;


/*           CASE

           CASE
          WHEN condition1 THEN result1
          WHEN condition2 THEN result2
          WHEN conditionN THEN resultN
          ELSE result
          END;


*/

select branch_id ,
 case 
   when branch_id =2 then 'bracndh id from 2'
   when branch_id = 3 then 'branch id from 3'
   else   'kdfjie'
 END AS KDFJ

from client;
