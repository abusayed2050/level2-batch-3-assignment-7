## Questions (Answer 10 Questions)

#### 1.Ques : What is PostgreSQL?

Ans : PostgreSQL is a object-relational database management system. It’s support SQL standards queries. PostgreSQL supports data types relational (tabular) and non-relational (document or JSON). PostgreSQL is an open-source and working with complex queries.

#### 2.Ques : What is the purpose of a database schema in PostgreSQL?

Ans : Dividing multiple tables into smaller modules. By default, schemas are declared in public.

#### 3.Ques : Explain the primary key and foreign key concepts in PostgreSQL.

Ans : Primary key: A specific column of a table is uniquely identified through the primary key.The value of this column will always be unique and the column will be not null.

Foreign key: A table is joined with another table through a foreign key.This creates a relationship between the two tables.The primary key of one table is added as a foreign key in another table.

#### 4.Ques : What is the difference between the VARCHAR and CHAR data types?

Ans : In VARCHAR, no matter how much memory is declared, it only uses as much as needed.

In CHAR, it uses the entire declared memory location, whether needed or not.

#### 5.Ques : Explain the purpose of the WHERE clause in a SELECT statement.

Ans : Records from a table are filtered using various conditions in the where clause.

#### 6.Ques : What are the LIMIT and OFFSET clauses used for?

Ans : The value specified in the LIMIT,It will display that number of rows from the table.

LIMIT 2 means it will show the first two rows of the table.

The value specified in the OFFSET,It will remove that number of rows from the table.Next It will display that number of rows from the table.

OFFSET 2 means it will show the next two rows after skipping the first two rowss of the table.

#### 7.Ques : How can you perform data modification using UPDATE statements?

Ans : UPDATE statement to change existing records in rows of a table, it's a very powerful tool in postgreSQL,This tool can damage any table if not used carefully.

#### 8.Ques : Explain the GROUP BY clause and its role in aggregation operations.

Ans : The GROUP BY clause is used to group rows with the same values in specified columns into aggregated data. The GROUP BY clause is used with aggregate functions like SUM(), AVG(), COUNT(), MIN(), MAX(),

#### 9.Ques : How can you calculate aggregate functions like COUNT, SUM, and AVG in PostgreSQL?

Ans : select COUNT(\*) from table_name
select SUM(column_name) from table_name
select AVG(column_name) from table_name

#### 10.Ques : Explain the concept of a PostgreSQL view and how it differs from a table.

Ans : A virtual table is created through a VIEW of a specific table. VIEW tool is used for security purposes, complex queries, enhanced data abstraction. Other people cannot understand what is inside the table.
