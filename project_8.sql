/*We've created a database of people and hob
, and each row in hob
 is 
related to a row in per
via the person_id column. Insert one more row in perand then one more 
row in hob
 that is 
related to the newly inserted person.*/


CREATE TABLE per (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    name TEXT,
    age INTEGER);
    
INSERT INTO per(name, age) VALUES ("Bobby McBobbyFace", 12);
INSERT INTO per(name, age) VALUES ("Lucy BoBucie", 25);
INSERT INTO per(name, age) VALUES ("Banana FoFanna", 14);
INSERT INTO per(name, age) VALUES ("Shish Kabob", 20);
INSERT INTO per(name, age) VALUES ("Fluffy Sparkles", 8);
INSERT INTO per(name, age) VALUES ("Another name", 40);

insert into per(name,age) values("kdfkjd",3434);

CREATE table hob (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    person_id INTEGER,
    name TEXT);
    
INSERT INTO hob
 (person_id, name) VALUES (1, "drawing");
INSERT INTO hob
 (person_id, name) VALUES (1, "coding");
INSERT INTO hob
 (person_id, name) VALUES (2, "dancing");
INSERT INTO hob
 (person_id, name) VALUES (2, "coding");
INSERT INTO hob
 (person_id, name) VALUES (3, "skating");
INSERT INTO hob
 (person_id, name) VALUES (3, "rowing");
INSERT INTO hob
 (person_id, name) VALUES (3, "drawing");
INSERT INTO hob
 (person_id, name) VALUES (4, "coding");
INSERT INTO hob
 (person_id, name) VALUES (4, "dilly-dallying");
INSERT INTO hob
 (person_id, name) VALUES (4, "meowing");
INSERT INTO hob
 (person_id, name) VALUES (6, "running");


insert into hob(person_id,name)
values (46,"lkdjfklsj");

