Question - 
------------------
The Employee table holds all employees including their managers. Every employee has an Id, and there is also a column for the manager Id.

+----+-------+--------+-----------+
| Id | Name  | Salary | ManagerId |
+----+-------+--------+-----------+
| 1  | Joe   | 70000  | 3         |
| 2  | Henry | 80000  | 4         |
| 3  | Sam   | 60000  | NULL      |
| 4  | Max   | 90000  | NULL      |
+----+-------+--------+-----------+
Given the Employee table, write a SQL query that finds out employees who earn more than their managers. For the above table, Joe is the only employee who earns more than his manager.

+----------+
| Employee |
+----------+
| Joe      |
+----------+

Solution –

/* Write your T-SQL query statement below */
select e.name as Employee from employee e
left outer join employee m --Using Left outer join to include all the information from the employee table regardless of an employee having a manager or not
on 
e.managerid=m.id --condition to join employee with his/her manager
where e.salary > m.salary --condition to meet the requirement of employees earning more than their managers


Explanation - 

Step 1 : Identify what data is present in the table.
Step 2 : Put special emphasis on the keywords - "Employees who earns more than his manager"
Step 3 : Build a query using left outer join self join i.e, referencing the same table twice, since the managerid and employeeid are mentioned in the same one table.
Step 4 : Make sure to use two different and easily 
		 understandable aliases for the employee table so that you are not confused in using the filter condition and the joining conditions
Step 5 : Remember to put the filter condition that is in the question requirement i.e., we need only those employees who earn MORE than their managers. 
Step 6 : Build the query and execute.









