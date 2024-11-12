-- CREATE TABLE student (
--     id INT,
--     name VARCHAR(20),
--     major VARCHAR(10),
--     PRIMARY KEY(id)
-- );

-- DESCRIBE student;
-- drop table student;
-- ALTER TABLE student add gpa decimal(4,2);

-- alter table student drop column gpa;

insert into student values(1,"kushwanth","cse");
insert into student values(2,"bharath","ai");
insert into student(id,name) VALUES(3,"manoj");

select * from student;