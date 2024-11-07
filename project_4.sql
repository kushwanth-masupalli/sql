/*                                                                                  Challenge: Playlist maker
Step 1
We've created a database of songs and artists, and you'll make playlists from them in this challenge. In this first step, select the title of all the songs by the artist named 'Queen'.
Step 2
Now you'll make a 'Pop' playlist. In preparation, select the name of all of the artists from the 'Pop' genre
Step 3
To finish creating the 'Pop' playlist, add another query that will select the title of all the songs from the 'Pop' artists. It should use IN on a nested subquery that's based on your previous query.*/


--motto
-- to learn about nested select statemetns 


create table if not exists artists(
    idd int primary key AUTO_INCREMENT,
    NAME VARCHAR(44),
    COUNTRY VARCHAR(30),
    GENRE VARCHAR(50)
);

INSERT INTO artists(name,country,genre) values('oeif','eoifj','pop');
INSERT INTO artists (name, country, genre)
    VALUES ("Taylor Swift", "US", "Pop");
INSERT INTO artists (name, country, genre)
    VALUES ("Led Zeppelin", "US", "Hard rock");
INSERT INTO artists (name, country, genre)
    VALUES ("ABBA", "Sweden", "Disco");
INSERT INTO artists (name, country, genre)
    VALUES ("Queen", "UK", "Rock");
INSERT INTO artists (name, country, genre)
    VALUES ("Celine Dion", "Canada", "Pop");
INSERT INTO artists (name, country, genre)
    VALUES ("Meatloaf", "US", "Hard rock");
INSERT INTO artists (name, country, genre)
    VALUES ("Garth Brooks", "US", "Country");
INSERT INTO artists (name, country, genre)
    VALUES ("Shania Twain", "Canada", "Country");
INSERT INTO artists (name, country, genre)
    VALUES ("Rihanna", "US", "Pop");
INSERT INTO artists (name, country, genre)
    VALUES ("Guns N' Roses", "US", "Hard rock");
INSERT INTO artists (name, country, genre)
    VALUES ("Gloria Estefan", "US", "Pop");
INSERT INTO artists (name, country, genre)
    VALUES ("Bob Marley", "Jamaica", "Reggae");


CREATE TABLE song (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    artist TEXT,
    title TEXT);

INSERT INTO song (artist, title)
    VALUES ("Taylor Swift", "Shake it off");
INSERT INTO song(artist, title)
    VALUES ("Rihanna", "Stay");
INSERT INTO song(artist, title)
    VALUES ("Celine Dion", "My heart will go on");
INSERT INTO song (artist, title)
    VALUES ("Celine Dion", "A new day has come");
INSERT INTO song (artist, title)
    VALUES ("Shania Twain", "Party for two");
INSERT INTO song (artist, title)
    VALUES ("Gloria Estefan", "Conga");
INSERT INTO song (artist, title)
    VALUES ("Led Zeppelin", "Stairway to heaven");
INSERT INTO song (artist, title)
    VALUES ("ABBA", "Mamma mia");
INSERT INTO song (artist, title)
    VALUES ("Queen", "Bicycle Race");
INSERT INTO song (artist, title)
    VALUES ("Queen", "Bohemian Rhapsody");
INSERT INTO song (artist, title)
    VALUES ("Guns N' Roses", "Don't cry");
    


select title from song where artist = "Queen";



select name from artists where genre = "Pop";



select title from song where artist IN( select name from artists where genre = "Pop");
