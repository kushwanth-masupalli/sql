--the defalult keyword we use here is the default value that is going to appear in the tabel
-- if the column is given with the keyword not null it need to be not null if you give null it will
-- give error
-- you know what a auto increment is used for


-- drop table student;
-- CREATE TABLE student (
--     id INT,
--     name VARCHAR(20) unique,
--     major VARCHAR(10) DEFAULT("king"),
--     PRIMARY KEY(id)
-- );

-- CREATE TABLE student (
--     id INT AUTO_INCREMENT,
--     name VARCHAR(20) unique,
--     major VARCHAR(10) DEFAULT("king"),
--     PRIMARY KEY(id)
-- );



-- CREATE TABLE student (
--     id INT AUTO_INCREMENT,
--     name VARCHAR(20) unique NOT NULL,
--     major VARCHAR(10) DEFAULT("king"),
--     PRIMARY KEY(id)
-- );
drop table student;
insert into student(name,major) values("kushwanth","cse");
insert into student(name,major) values("","ai");
insert into student(name,major) VALUES("manoj","king");
select * from student;
DESCRIBE table student;