--/Problem Title: Department-Course Subquery and Access Control
--/Design normalized tables for departments and the courses they offer, maintaining a
--/foreign key relationship.
--/Insert five departments and at least ten courses across those departments.
--/Use a subquery to count the number of courses under each department.
--/Filter and retrieve only those departments that offer more than two courses.
--/Grant SELECT-only access on the courses table to a specific user.


CREATE TABLE Departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(100) NOT NULL
);


CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(150) NOT NULL,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);

INSERT INTO Departments (dept_id, dept_name) VALUES
(1, 'Computer Science'),
(2, 'Mathematics'),
(3, 'Physics'),
(4, 'English'),
(5, 'Biology');

INSERT INTO Courses (course_id, course_name, dept_id) VALUES
(101, 'Data Structures', 1),
(102, 'Operating Systems', 1),
(103, 'Algorithms', 1),
(104, 'Calculus I', 2),
(105, 'Linear Algebra', 2),
(106, 'Quantum Mechanics', 3),
(107, 'Classical Mechanics', 3),
(108, 'Modern Poetry', 4),
(109, 'Cell Biology', 5),
(110, 'Genetics', 5);

SELECT dept_name
FROM Departments
WHERE dept_id IN (
    SELECT dept_id
    FROM Courses
    GROUP BY dept_id
    HAVING COUNT(course_id) > 2
);
