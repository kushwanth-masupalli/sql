/*                                                    Challenge: Gradebook
Step 1
We've created a database to track student grades, with their name, number grade, and what percent of 
activities they've completed. In this first step, select all of the rows, and display the name, 
number_grade, and percent_completed, which you can compute by multiplying and rounding the 
fraction_completed column.
Step 2
Now, this step is a little tricky. The goal is a table that shows how many students have earned which
letter_grade. You can output the letter_grade by using CASE with the number_grade column, outputting 'A' 
for grades > 90, 'B' for grades > 80, 'C' for grades > 70, and 'F' otherwise. Then you can use COUNT with 
GROUP BY to show the number of students with each of those grades.*/


--motto== learn about case statement 


CREATE TABLE student_grades (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    name TEXT,
    number_grade INTEGER,
    fraction_completed float);


INSERT INTO student_grades (name, number_grade, fraction_completed)
    VALUES ("Winston", 90, 0.805);
INSERT INTO student_grades (name, number_grade, fraction_completed)
    VALUES ("Winnefer", 95, 0.901);
INSERT INTO student_grades (name, number_grade, fraction_completed)
    VALUES ("Winsteen", 85, 0.906);
INSERT INTO student_grades (name, number_grade, fraction_completed)
    VALUES ("Wincifer", 66, 0.7054);
INSERT INTO student_grades (name, number_grade, fraction_completed)
    VALUES ("Winster", 76, 0.5013);
INSERT INTO student_grades (name, number_grade, fraction_completed)
    VALUES ("Winstonia", 82, 0.9045);

select name,number_grade,ROUND(fraction_completed*100) as completedwork
from student_grades;

select count(*),
case 
   when number_grade >90 then 'a'
  when  number_grade >80 then 'b'
   when number_grade > 70 then 'c'
   else 'd'

end as grade
from student_grades
group by grade;