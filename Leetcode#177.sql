Question - 
------------------
Write a SQL query to get the nth highest salary from the Employee table.

+----+--------+
| Id | Salary |
+----+--------+
| 1  | 100    |
| 2  | 200    |
| 3  | 300    |
+----+--------+
For example, given the above Employee table, the nth highest salary where n = 2 is 200. If there is no nth highest salary, then the query should return null.

+------------------------+
| getNthHighestSalary(2) |
+------------------------+
| 200                    |
+------------------------+


Solution –

CREATE FUNCTION getNthHighestSalary(@N INT) RETURNS INT as -- Function specification/header
BEGIN
    RETURN (
        /* Write your T-SQL query statement below. */
        select distinct t.salary from 
        (
        select id,salary,dense_rank() over(order by salary desc) as rnk --Dense Rank used to avoid incorrect results generation due to duplication of input records
        from employee) t
        where t.rnk=@N --To filter out specific Nth highest salary required by user
    );
END


Explanation - 

Step 1 : Identify what data is present in the table.
Step 2 : Put special emphasis on the keywords - "Nth highest salary"
Step 3 : Create a query that piopulates the ranks associated with the order of salary in descending order, i.e., from highest to lowest
Step 4 : Build the query using dense_rank() and not rank() because the latter skips ranks incase of duplicate or tied records. [Refer - https://docs.microsoft.com/en-us/sql/t-sql/functions/ranking-functions-transact-sql?view=sql-server-2017]
Step 5 : Enclose the query in a subquery so that the field added to the output i.e, ranking can be utilised as a filter to isolate the Nth Highest salary 
Step 6 : Build the query and execute.









