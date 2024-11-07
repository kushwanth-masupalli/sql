/*                Challenge: TODO list database stats
Step 1
Here's a table containing a TODO list with the number of minutes it 
will take to complete each item. Insert another item to your todo list
 with the estimated minutes it will take.*/

-- OBJECTIVE  1)NAME OF TASK 
--            2)TIME IT TAKES

CREATE TABLE IF NOT EXISTS to_do(
    id int PRIMARY KEY AUTO_INCREMENT,
    taskname VARCHAR(49)
);

--AUTO_INCREMENT IS ONLY FOR PRIMARY KEYS NOT FOR ALL COLUMNS
ALTER TABLE to_do 
ADD COLUMN TIMETAKEN INT;

-- DESCRIBE  TO_DO;
    INSERT INTO  to_do(taskname,TIMETAKEN) VALUES ('GOIDFJKD',29);
    INSERT INTO  to_do(taskname,TIMETAKEN) VALUES ('KDJFKDJ',29);
    INSERT INTO  to_do(taskname,TIMETAKEN) VALUES ('233EFDD',29);
    INSERT INTO  to_do(taskname,TIMETAKEN) VALUES ('GB FDVZJKD',29);
    INSERT INTO  to_do(taskname,TIMETAKEN) VALUES ('GOERWSEFDJKD',29);


SELECT * FROM TO_DO;

DELETE FROM TO_DO
WHERE ID=1;

SELECT SUM(TIMETAKEN) FROM TO_DO;

SELECT COUNT(TASKNAME)  FROM TO_DO;


SELECT * FROM TO_DO;

INSERT INTO TO_DO (id,taskname,timetaken)  VALUES(1,"KDFJIE",39);

SELECT * FROM TO_DO
;
