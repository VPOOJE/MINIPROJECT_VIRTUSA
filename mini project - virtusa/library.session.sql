CREATE TABLE books (
    book_id INTEGER PRIMARY KEY,
    title TEXT,
    author TEXT,
    category TEXT
);

CREATE TABLE students (
    student_id INTEGER PRIMARY KEY,
    student_name TEXT,
    email TEXT,
    join_date DATE
);

CREATE TABLE issued_books (
    issue_id INTEGER PRIMARY KEY,
    book_id INTEGER,
    student_id INTEGER,
    issue_date DATE,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES books(book_id),
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);
INSERT INTO books VALUES (1, 'Java Basics', 'James', 'Programming');
INSERT INTO books VALUES (2, 'Python Guide', 'Guido', 'Programming');
INSERT INTO books VALUES (3, 'Data Science', 'Andrew', 'AI');

INSERT INTO students VALUES (101, 'Pooja', 'pooja@gmail.com', '2022-01-10');
INSERT INTO students VALUES (102, 'Ravi', 'ravi@gmail.com', '2021-05-15');

INSERT INTO issued_books VALUES (1, 1, 101, '2024-03-01', NULL);
INSERT INTO issued_books VALUES (2, 2, 102, '2022-02-01', '2022-02-10');

SELECT * FROM books;
SELECT * FROM students;
SELECT * FROM issued_books;

SELECT 
    s.student_id,
    s.student_name,
    b.title,
    i.issue_date
FROM issued_books i
JOIN students s ON i.student_id = s.student_id
JOIN books b ON i.book_id = b.book_id
WHERE i.return_date IS NULL
AND i.issue_date < DATE('now', '-14 days');

SELECT 
    b.category,
    COUNT(*) AS total_borrowed
FROM issued_books i
JOIN books b ON i.book_id = b.book_id
GROUP BY b.category
ORDER BY total_borrowed DESC;

ALTER TABLE students ADD status TEXT;

UPDATE students
SET status = 'Inactive'
WHERE student_id NOT IN (
    SELECT DISTINCT student_id
    FROM issued_books
    WHERE issue_date >= DATE('now', '-3 years')
);