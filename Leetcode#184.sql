Question - 
------------------
The Employee table holds all employees. Every employee has an Id, a salary, and there is also a column for the department Id.

+----+-------+--------+--------------+
| Id | Name  | Salary | DepartmentId |
+----+-------+--------+--------------+
| 1  | Joe   | 70000  | 1            |
| 2  | Henry | 80000  | 2            |
| 3  | Sam   | 60000  | 2            |
| 4  | Max   | 90000  | 1            |
+----+-------+--------+--------------+
The Department table holds all departments of the company.

+----+----------+
| Id | Name     |
+----+----------+
| 1  | IT       |
| 2  | Sales    |
+----+----------+
Write a SQL query to find employees who have the highest salary in each of the departments. For the above tables, Max has the highest salary in the IT department and Henry has the highest salary in the Sales department.

+------------+----------+--------+
| Department | Employee | Salary |
+------------+----------+--------+
| IT         | Max      | 90000  |
| Sales      | Henry    | 80000  |
+------------+----------+--------+

Solution –

/* Write your T-SQL query statement below */
select t.Department,t.Employee,t.Salary from 
(select d.name as Department,e.name as Employee, Salary --subquery created since the ranking cannot be filtered in the same scope the field/formula was defined in 
 ,rank() over(partition by e.departmentid order by salary desc) as mx_sal --data has been partitioned by department since requirement is highest salary by department
from employee e
inner join department d
on e.departmentid=d.id)t --joining the two tables on department information present in employee and department table
where t.mx_sal=1 --Filter out highest salary 
order by t.Department asc --Can be avoided, but added to fit the description exactly as mentioned in the sample output 


Explanation - 

Step 1 : Identify what data is present in both the tables.
Step 2 : Put special emphasis on the keywords - "Highest salary in EACH of the departments"
Step 3 : Build a query first to rank the employees, in descending order, on their salary per department.
Step 4 : Filter out the records from the above mentioned formulated query by striping off records that are not rank 1. 
Step 5 : Ensure to create a subquery since SQL doesnt allow using window functions directly in the where clause directly
		 [Refer - https://www.sqltheater.com/2017/09/28/cant-use-row_number-where/]
Step 6 : Build the query and execute.









