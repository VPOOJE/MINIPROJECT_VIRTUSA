CREATE DATABASE library_db;
USE library_db;

CREATE TABLE books (
    book_id INT PRIMARY KEY,
    title VARCHAR(100),
    author VARCHAR(100),
    category VARCHAR(50)
);

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100),
    email VARCHAR(100),
    join_date DATE
);

CREATE TABLE issued_books (
    issue_id INT PRIMARY KEY,
    book_id INT,
    student_id INT,
    issue_date DATE,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES books(book_id),
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);

INSERT INTO books VALUES 
(1, 'Java Basics', 'James', 'Programming'),
(2, 'Python Guide', 'Guido', 'Programming'),
(3, 'Data Science', 'Andrew', 'AI');

INSERT INTO students VALUES 
(101, 'Pooja', 'pooja@gmail.com', '2022-01-10'),
(102, 'Ravi', 'ravi@gmail.com', '2021-05-15');

INSERT INTO issued_books VALUES 
(1, 1, 101, '2024-03-01', NULL),
(2, 2, 102, '2022-02-01', '2022-02-10');

SELECT 
    s.student_id,
    s.student_name,
    b.title,
    i.issue_date
FROM issued_books i
JOIN students s ON i.student_id = s.student_id
JOIN books b ON i.book_id = b.book_id
WHERE i.return_date IS NULL
AND i.issue_date < CURDATE() - INTERVAL 14 DAY;

SELECT 
    b.category,
    COUNT(*) AS total_borrowed
FROM issued_books i
JOIN books b ON i.book_id = b.book_id
GROUP BY b.category
ORDER BY total_borrowed DESC;

DELETE FROM students
WHERE student_id NOT IN (
    SELECT student_id FROM (
        SELECT DISTINCT student_id
        FROM issued_books
        WHERE issue_date >= CURDATE() - INTERVAL 3 YEAR
    ) AS temp
);
