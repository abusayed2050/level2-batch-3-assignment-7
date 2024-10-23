/* 1.Database Setup:
        Install PostgreSQL on your system if not already installed.
        Create a fresh database titled "university_db" or any other appropriate name.
*/

create database university_db;

/* 2.Table Creation:

        Create a "students" table with the following fields:

        student_id (Primary Key): Integer, unique identifier for students.
        student_name: String, representing the student's name.
        age: Integer, indicating the student's age.
        email: String, storing the student's email address.
        frontend_mark: Integer, indicating the student's frontend assignment marks.
        backend_mark: Integer, indicating the student's backend assignment marks.
        status: String, storing the student's result status. 
*/

create table students(
        student_id serial, 
        student_name varchar(50),
        age integer,
        email varchar(30),
        frontend_mark integer, 
        backend_mark integer, 
        status  char(10),
        primary key(student_id )
);

alter table students 
        alter column status set default NULL;

/* 2.Table Creation:

        Create a "courses" table with the following fields:

        course_id (Primary Key): Integer, unique identifier for courses.
        course_name: String, indicating the course's name.
        credits: Integer, signifying the number of credits for the course.
*/

create table courses(
        course_id serial, 
        course_name varchar(20),
        credits integer,
        primary key(course_id )
);

/* 2.Table Creation:
        Create an "enrollment" table with the following fields:

        enrollment_id (Primary Key): Integer, unique identifier for enrollments.
        student_id (Foreign Key): Integer, referencing student_id in the "Students" table.
        course_id (Foreign Key): Integer, referencing course_id in the "Courses" table.
*/

create table enrollment(
        enrollment_id serial, 
        student_id integer,
        course_id integer,
        primary key(enrollment_id ),
        foreign key(student_id) references students(student_id) on delete set null ,
        foreign key(course_id) references courses(course_id) on delete set null
);

/* Sample Data
          Insert the following sample data into the "students" table 
*/

insert into students(
        student_name,
        age,
        email,
        frontend_mark, 
        backend_mark
) 
values 
('Sameer', 21, 'sameer@example.com', 48, 60),
('Zoya', 23, 'zoya@example.com', 52, 58),
('Nabil', 22, 'nabil@example.com', 37, 46),
('Rafi', 24, 'rafi@example.com', 41, 40),
('Sophia', 22, 'sophia@example.com', 50, 52),
('Hasan', 23, 'hasan@gmail.com', 43, 39);

select * from students;

/* Insert the following sample data into the "courses" table */

insert into courses( 
        course_name,
        credits
)
values 
('Next.js', 3),
('React.js', 4),
('Databases', 3),
('Prisma', 3);
 
select * from courses;

/* Insert the following sample data into the "enrollment" table */

insert into enrollment(
        student_id,
        course_id 
)
values 
(1, 1),
(1, 2),
(2, 1),
(3, 2);

select * from enrollment;

/* Run SQL queries to complete the following tasks:
   
   Query 1:
       Insert a new student record with the following details:

            Name: YourName
            Age: YourAge
            Email: YourEmail
            Frontend-Mark: YourMark
            Backend-Mark: YourMark
            Status: NULL 
*/

/* my openion 
        1. A new record will be inserted in the students table
 */

insert into students(
        student_name,
        age,
        email,
        frontend_mark, 
        backend_mark
) 
values 
('Abu sayed md. imran', 30, 'abu.sayed2050@gmail.com', 23, 19);

select * from students;

/* Query 2:
       Retrieve the names of all students who are enrolled in the course titled 'Next.js'.

            Sample Output:

            student_name
                Sameer
                Zoya 
*/

/* my openion 
        1. It will show the names of the students who have taken the 'Next.js' course
        2. The students table is the main table 
        3. The enrollment table is the join table 
        4. Because the students table and course table are connected to each other through the enrollment table
        5. The WHERE clause will find the course name 'Next.js' from the course table 
            and will show the student name from the student table through the enrollment table.
 */

select student_name from students
join enrollment on students.student_id=enrollment.student_id
join courses on enrollment.course_id=courses.course_id where course_name ='Next.js'

/* Query 3:
       Update the status of the student with the highest total 
       (frontend_mark + backend_mark) to 'Awarded'. 
*/

/* my openion 
        1. The WHERE clause will find the student id from the students table
        2. The ORDER BY  clause will sum the two columns (frontend_mark + backend_mark) 
           and this total mark will be sorted in descending order and limit 1.
 */

--select student_id, (frontend_mark + backend_mark) as total_mark from students order by total_mark desc limit 1

update students
        set status='Awarded'
        where student_id=(select student_id from students order by frontend_mark + backend_mark desc limit 1);

select * from students 

/* Query 4:
       Delete all courses that have no students enrolled.
 */

 /* my openion 
        1. If the course_id in the course table do not exist 
           in the course_id of the enrollment table, those will be deleted.
 */

-- select * from courses where course_id in (select course_id from enrollment)
-- select * from courses where course_id not in (select course_id from enrollment)

delete from courses 
      where course_id not in (select course_id from enrollment);

select * from courses

/* Query 5:
       Retrieve the names of students using a limit of 2, starting from the 3rd student.

            Sample Output:

                student_name
                Nabil
                Rafi 
*/

/* my openion 
        1. limit 2 means it will show the first two rows of the students table.
        2. offset 2 means it will show the next two rows after skipping 
           the first two rows of the students table.
 */

select * from students limit 2 offset 2

/* Query 6:
        Retrieve the course names and the number of students enrolled in each course.

                Sample Output:

                course_name	students_enrolled
                 Next.js	2
                 React.js	2 
*/

/* my openion 
        1. Count the total number of rows in the course table. 
        2. Join the enrollment table and the course table and group by course_name.
 */

select course_name,count(*) as students_enrolled from courses 
join enrollment on courses.course_id=enrollment.course_id group by course_name ;

/* Query 7:
       Calculate and display the average age of all students.

            Sample Output:

            average_age
            22.33
*/

/* my openion 
        Skip one row and find the average age of students from student table 
 */

select avg(age)as average_age from 
(select age from students where student_name !='Abu sayed md. imran') as student_age ;

/* Query 8:
        Retrieve the names of students whose email addresses contain 'example.com'.

            Sample Output:

            student_name
            Sameer
            Zoya
            Nabil
            Rafi
            Sophia 
*/

/* my openion 
        ILIKE: This is a case-insensitive 
        '%example.com': Find email addresses that end with example.com
 */
select student_name from students where email ilike '%example.com'