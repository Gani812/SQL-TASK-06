# SQL Internship - Task 6: Subqueries and Nested Queries (MySQL)

#  About the Task
In this task, I focused on writing SQL queries using **subqueries** and **nested queries**.  
The goal was to practice:
- Scalar subqueries
- Correlated subqueries
- Subqueries in `SELECT`, `WHERE`, `FROM` clauses
- Using `IN`, `EXISTS`, `NOT EXISTS`, `=`
- Creating derived tables using subqueries in `FROM`

This task helped me apply advanced query logic for data analysis and filtering.


#  Database Used
I worked with the **RentalDB** database, which consists of the following tables:
- `Owners` — Property owner details
- `Properties` — Information about rental properties
- `Locations` — City and area details
- `Renters` — Renter contact information
- `Bookings` — Rental booking records
- `Payments` — Payment details linked to bookings  

The relationships between these tables made it ideal for practicing subqueries.


#  What I Did
I implemented several subqueries to solve different data problems:
- **Scalar subqueries in SELECT** — Example: show each property’s rent and the average rent across all properties
- **Subqueries in WHERE using IN** — Example: list properties in cities where bookings exist
- **Subqueries in WHERE using EXISTS** — Example: find owners with at least one booked property
- **Correlated subqueries** — Example: renters who booked properties above the average rent
- **Subqueries in FROM (derived tables)** — Example: total rent collected per city
- **Subqueries using `=`** — Example: properties with rent equal to maximum rent
- **Subqueries with NOT EXISTS** — Example: properties that have never been booked
- **Subqueries to compute total bookings per renter**
- **Scalar subqueries in SELECT** — Example: show payment as percentage of max payment


# Tools Used
- **MySQL Workbench**


#  Files Included
| `Subqueries.sql` | SQL queries for Task 6 with subqueries and nested logic |
| `README.md` | This file — summary of the task and work done |


#  Summary
This task improved my understanding of:
- Writing subqueries in various parts of SQL queries
- Using `EXISTS`, `IN`, `NOT EXISTS`, `=`, and derived tables effectively
- Combining subqueries with aggregate functions and joins  

I gained hands-on experience writing more advanced SQL queries used in real-world data analysis.

