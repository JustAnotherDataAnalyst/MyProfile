Question - 
------------------
Write a SQL query to find all duplicate emails in a table named Person.

+----+---------+
| Id | Email   |
+----+---------+
| 1  | a@b.com |
| 2  | c@d.com |
| 3  | a@b.com |
+----+---------+
For example, your query should return the following for the above table:

+---------+
| Email   |
+---------+
| a@b.com |
+---------+
Note: All emails are in lowercase.

Solution –

/* Write your T-SQL query statement below */
select email from person
group by email 
having count(*)>1  --To find duplicate emails in the table


Explanation - 

Step 1 : Identify what data is present in the table.
Step 2 : Put special emphasis on the keywords - "duplicate emails"
Step 3 : Build a query using the aggregating the results by the emails by simply using a group by clause
Step 4 : Use the having clause in tandem with the group by clause in order to filter out the aggregates that have counts greater than 1, since we are looking for only 
		 duplicate records in the table
Step 5 : Build the query and execute.









