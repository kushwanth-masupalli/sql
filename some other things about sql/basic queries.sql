-- select * FROM student;
-- select name,major FROM student;

-- select student.name,student.major 
-- FROM student;

-- select student.name,student.major 
-- FROM student
-- ORDER by major;

-- select student.id,student.name,student.major 
-- FROM student
-- ORDER by id desc;

-- select * FROM student
-- where id>1;

-- select * FROM student
-- where name="kushwanth" or major ="ai" 
-- order by name ,major desc;

-- select * FROM student
-- limit 4;


-- this symbol is comment 
-- this symbol <> is for negation 
--  all the other operator are applicable
    

CREATE TABLE trigger_test(
    message varchar(50)
);

INSERT INTO employee
values(110,'KEVIN','martinez','1986-02-19','m',69000,106,3);

select * from trigger_test;

--UNDERSTAND THE FOLLOWING THINGS
-- SELECT 
--    (COUNT(CITY) - COUNT(DISTINCT CITY)) AS difference
-- FROM STATION;

--UNDERSTAND THIS ALSO
SELECT CITY, LENGTH(CITY) 
FROM STATION
ORDER BY LENGTH(CITY), CITY
LIMIT 1;

SELECT CITY, LENGTH(CITY) 
FROM STATION
ORDER BY LENGTH(CITY) DESC, CITY
LIMIT 1;