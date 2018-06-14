Question - 
------------------

Write a SQL query to get the second highest salary from the Employee table.

+----+--------+
| Id | Salary |
+----+--------+
| 1  | 100    |
| 2  | 200    |
| 3  | 300    |
+----+--------+
For example, given the above Employee table, the query should return 200 as the second highest salary. If there is no second highest salary, then the query should return null.

+---------------------+
| SecondHighestSalary |
+---------------------+
| 200                 |
+---------------------+

Solution –
#1
/* Write your T-SQL query statement below */
select isnull(max(salary),null) as secondhighestsalary --To satisy the condition that , if there is no 2nd highest salary then query should return null
from employee
where salary not in (
select max(salary) from employee) -- identifies the highest salary  in a subquery


Explanation - 

Step 1 : Identify what data is present in the table.
Step 2 : Put special emphasis on the keywords - "2nd Highest salary" & "If there is no second highest salary, then the query should return null"
Step 3 : Create a subquery that returns the highest salary and strip of the highest to return the second highest salary by using a correlated subquery
Step 4 : Build query to isolate the highest salary in the table using max() function
Step 5 : Remember to use the isnull() function to satisfy the second part of the question. 
Step 6 : Build the query and execute.









