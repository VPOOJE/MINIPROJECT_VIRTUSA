
# PRE-TRAINING-PROJECTS




## 1.Problem Statement: Smart Expense Tracker with Insights(python)


This is a simple Expense Tracker application built using Python.


## Features


- Add expense with date, category, amount, and description
- Store data in a CSV file
- Monthly expense summary
- Category-wise spending analysis
- Automatic suggestions based on spending habits
- Pie chart visualization using Matplotlib

## Technologies Used
- Python
- CSV (for data storage)
- Matplotlib (for visualization)

## Screenshots

![1](https://github.com/user-attachments/assets/e4bcca27-6e81-4291-93a0-7dd0ee599bb8)

![2](https://github.com/user-attachments/assets/0f3692d7-62d5-446c-adca-637b89a590f7)

![3](github.com/user-attachments/assets/fc9a2866-39ba-4bb4-96ef-0453ec9cc001)

![4](https://github.com/user-attachments/assets/397ef286-9b13-4db2-8f17-66bae46dec0d)


# 2.Problem Statement: Online Retail Sales Analysis Database(SQL)
This project demonstrates a Retail Database System using SQL.

It manages:

- Customers
- Products
- Orders
- Order Details

It also performs data analysis using SQL queries.

## Key Concepts Used
- Primary Key & Foreign Key
- Joins (INNER JOIN, LEFT JOIN)
- Aggregation (SUM, GROUP BY)
- Sorting (ORDER BY)
- String functions (substr)

## screenshots

![1](https://github.com/user-attachments/assets/14cf6a5b-5621-432c-ae4f-995b509a229c)
![2](https://github.com/user-attachments/assets/9086fac2-1aa0-4812-ae08-560527c7d1b4)
![3](https://github.com/user-attachments/assets/d31f97c7-461b-413e-b6b9-fe70e598516e)
![4](https://github.com/user-attachments/assets/fbed28b3-fcaa-4e5d-94ec-99e394531748)
![5](https://github.com/user-attachments/assets/54959700-93ea-487e-98b0-3b1d61c665d3)
![6](https://github.com/user-attachments/assets/c8217d82-dbac-4e5e-b540-ab6ec60cc5ce)
![7](https://github.com/user-attachments/assets/11df5c31-1b1f-4f1a-ac7d-6ec63d40076b)
![8](https://github.com/user-attachments/assets/ed342c56-fb05-4b21-9af0-a3a15bbbc232)
![9](https://github.com/user-attachments/assets/43282f86-0096-4f4a-9a20-b2a235572b93)

# 3.Problem Statement: Library Management System(JAVA)
This is a console-based Library Management System developed using Java.
It helps manage:

- Books
- Users
- Book issuing and returning
- Fine calculation for late returns
## Features
- Add new books
- View all books
- Remove books (only if not issued)
- Register users
- Issue books with due date
- Return books with fine calculation
- Search books by title or author

## screenshots

![1](https://github.com/user-attachments/assets/d8bdfd93-3848-44d7-8b58-f0a82f393780)

![2](https://github.com/user-attachments/assets/864c969c-8d90-490a-9310-9c0adc705a41)

![3](https://github.com/user-attachments/assets/9a0d11f4-32f4-46c7-aa7d-81e2c1179ed2)

![4](https://github.com/user-attachments/assets/4881ae2e-17fc-4312-a6bc-85efe774dad6)

![5](https://github.com/user-attachments/assets/e74346d5-6376-4452-a03c-95946222aecc)

![6](https://github.com/user-attachments/assets/b2b99f52-a169-4584-983f-78e1f05c7afb)


# MINI-PROJECT USE CASES

## 1.Core Java: The Password Validator
- This project is a Password Validator built using Java.
- It checks whether a password is strong based on specific rules and gives clear feedback to the user.

## Features
- Validates password strength
- Checks minimum length
- Checks for uppercase letters
- Checks for digits
- Gives specific error messages
- Allows retry until a valid password is entered

## Password Rules

A valid password must:

- Be at least 8 characters long
- Contain at least one uppercase letter (A–Z)
- Contain at least one digit (0–9)

## screenshots

![1](https://github.com/user-attachments/assets/176a673e-34be-4963-8427-047a11ec1099)


# 2.SQL: Digital Library Audit

This project is a Library Database Management System implemented using SQL.It manages:

- Books
- Students
- Issued books
and performs useful queries for tracking library activity.

## Key Concepts Used
- Primary Key & Foreign Key
- Joins (INNER JOIN)
- Filtering with WHERE
- Date functions (DATE('now'))
- Aggregation (COUNT, GROUP BY)
- Subqueries
- ALTER & UPDATE operations

## screenshots

## After CREATE TABLE 
SELECT name FROM sqlite_master WHERE type='table';

![1](https://github.com/user-attachments/assets/2920d843-bd89-44de-9cde-af6e4eb6d1e6)

## after INSERT DATA 
SELECT * FROM books; 
SELECT * FROM students; 
SELECT * FROM issued_books; 

![2](https://github.com/user-attachments/assets/07922581-72f4-4d50-88e2-3abe3987fedf)

## Overdue Books Query 
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

![3](https://github.com/user-attachments/assets/2aab2393-ea4e-4b04-a0f9-236f9b9c1ec1)

## Most Borrowed Category 

SELECT  
b.category, 
COUNT(*) AS total_borrowed 
FROM issued_books i 
JOIN books b ON i.book_id = b.book_id 
GROUP BY b.category 
ORDER BY total_borrowed DESC; 

![4](https://github.com/user-attachments/assets/ea222e67-a331-4efb-8cd5-d13149638b60)

## After ALTER TABLE
PRAGMA table_info(students); 

![5](https://github.com/user-attachments/assets/6c8017b5-592c-4494-86a4-7c128e3c6040)

## After UPDATE
SELECT student_id, student_name, status FROM students; 

![6](https://github.com/user-attachments/assets/2ec1deea-d3f9-4c26-bc8b-d5d073334c57)

## 3.Core Python: The &quot;FareCalc&quot; Travel Optimizer
This project is a Ride Fare Calculator developed for a ride-sharing startup called CityCab.
It calculates the total fare based on:

- Distance traveled
- Vehicle type
- Time of travel (surge pricing)

## Features
- Calculates fare based on distance and vehicle type
- Applies surge pricing during peak hours
- Handles invalid vehicle types
- Displays a formatted price receipt
- Includes error handling for incorrect inputs
## Fare Rules
## Vehicle Rates (per km)
- Economy → ₹10/km
- Premium → ₹18/km
- SUV → ₹25/km
## Surge Pricing
- Applied between 5 PM – 8 PM (17 to 20 hours)
- Multiplier: 1.5x

## screenshots
![1](https://github.com/user-attachments/assets/58ee8354-11b0-4c33-940c-a8b4e75ebe4c)
