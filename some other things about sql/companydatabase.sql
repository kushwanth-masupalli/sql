
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

select * FROM employee;
-- select * FROM employee 
-- order by first_name,salary ;

select * FROM employee
limit 5;

select first_name,last_name FROM employee;

select first_name AS surname , last_name AS forename FROM employee;

-- to find all the distinc things in something
select distinct sex FROM employee;

--functions

--count function is used to no of things in a tabel for a specific coloum

select COUNT(emp_id)
FROM employee;

select COUNT(emp_id)
FROM employee
where sex='F'  && birth_day>'1971-01-01';

select AVG(salary)
FROM employee
where sex='M';


select sum(salary)
FROM employee 
where sex ="F";

select COUNT(sex),sex
FROM employee
GROUP BY sex;


select sum(total_sales),emp_id
FROM works_with
group by emp_id;

-- wild card argument % and _ usage explained try to understand
select * 
FROM client 
where client_name LIKE '%LLC';


SELECT * 
FROM client 
where client_name LIKE '%school';

Select * 
FROM employee
Where birth_day LIKE '____-10%';


--union keyword is used to join the columns of two different tables
--the no of columns should be same

SELECT  first_name AS names, branch_id
FROM employee
union 
select branch_name,mgr_id
FROM branch
union 
select client_name,branch_id
FROM client;

select client_name,client.branch_id
FROM client
UNION 
select supplier_name,branch_supplier.branch_id
FROM branch_supplier;

--the significance of jion keyword
-- if you some scenario where you need to join two colums of same things it is very helpful

insert into branch values(4,"buffalo",NULL,NULL);

select employee.emp_id,employee.first_name,branch.branch_name
FROM employee 
right Join branch
on  mgr_id =emp_id ;



--nested queries a well and good concept in sql

select employee.first_name,employee.last_name
FROM employee
where employee.emp_id in (
    select works_with.emp_id
    FROM  works_with
    where works_with.total_sales>30000
);


select client_name 
FROM client
where client.branch_id=(
    select branch_id
FROM branch
where branch.mgr_id=102
);



-- ON DELETE SET NULL this thing will delete the only element if it is deleted from the the database
-- ON DLELET CASCADE
-- this thing right here will delete the entire row if the forigen key is removed form the table


-- MOD FUNCTOIN AND DISTINCT KEYWORD YOU KNOW 

SELECT DISTINCT CITY
FROM STATION  
WHERE MOD(ID,2)=0;



SELECT sex,COUNT(emp_id) 
from employee
group by sex;