Question - 
------------------
Suppose that a website contains two tables, the Customers table and the Orders table. Write a SQL query to find all customers who never order anything.

Table: Customers.

+----+-------+
| Id | Name  |
+----+-------+
| 1  | Joe   |
| 2  | Henry |
| 3  | Sam   |
| 4  | Max   |
+----+-------+
Table: Orders.

+----+------------+
| Id | CustomerId |
+----+------------+
| 1  | 3          |
| 2  | 1          |
+----+------------+
Using the above tables as example, return the following:

+-----------+
| Customers |
+-----------+
| Henry     |
| Max       |
+-----------+


Solution –

/* Write your T-SQL query statement below */
select c.name as Customers from
customers c 
left outer join orders o --To get all Customer information regardless of they having placed an order or not
on c.id=o.customerid
where o.customerid is null --to filter out the records of only those customers who have placed no order yet



Explanation - 

Step 1 : Identify what data is present in both the tables.
Step 2 : Put special emphasis on the keywords - "customers who never order anything"
Step 3 : Build a query first to isolate all records from the customer and orders table by finding all the customer information regardless of their order history
Step 4 : Filter out the records from the above mentioned formulated query by striping off records that have no customerid from the orders table since that is what is required
		 from us
Step 5 : Build the query and execute.









