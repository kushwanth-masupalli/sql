DELETE FROM student;

CREATE TABLE student (
    id INT,
    name VARCHAR(20),
    major VARCHAR(10),
    PRIMARY KEY (id)
);

insert into
    student
values
    (1, "kushwanth", "cse");

insert into
    student
values
    (2, "bharath", "ai");

insert into
    student
VALUES
    (3, "manoj", "king");

select
    *
from
    student;

UPDATE student
set
    major = "core"
where
    major = "king"
    AND id = 3;

DELETE FROM student
where
    major = "core";