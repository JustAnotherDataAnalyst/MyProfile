Question - 
------------------
The Employee table holds all employees. Every employee has an Id, and there is also a column for the department Id.

+----+-------+--------+--------------+
| Id | Name  | Salary | DepartmentId |
+----+-------+--------+--------------+
| 1  | Joe   | 70000  | 1            |
| 2  | Henry | 80000  | 2            |
| 3  | Sam   | 60000  | 2            |
| 4  | Max   | 90000  | 1            |
| 5  | Janet | 69000  | 1            |
| 6  | Randy | 85000  | 1            |
+----+-------+--------+--------------+
The Department table holds all departments of the company.

+----+----------+
| Id | Name     |
+----+----------+
| 1  | IT       |
| 2  | Sales    |
+----+----------+
Write a SQL query to find employees who earn the top three salaries in each of the department. For the above tables, your SQL query should return the following rows.

+------------+----------+--------+
| Department | Employee | Salary |
+------------+----------+--------+
| IT         | Max      | 90000  |
| IT         | Randy    | 85000  |
| IT         | Joe      | 70000  |
| Sales      | Henry    | 80000  |
| Sales      | Sam      | 60000  |
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


select Department,Employee,Salary from 
(select d.name as Department,e.name as Employee,e.salary as Salary , --subquery created since the ranking cannot be filtered in the same scope the field/formula was defined in 
    dense_rank() over (partition by e.departmentid order by salary desc) as rnk --data has been partitioned by department since requirement is highest 3 salary by department
from employee e
    inner join department d
    on e.departmentid=d.id)t  --joining the two tables on department information present in employee and department table
    where t.rnk<=3 --Filter out the 3 highest salaries
    order by department asc, salary desc --Can be avoided, but added to fit the description exactly as mentioned in the sample output 




Explanation - 

Step 1 : Identify what data is present in both the tables.
Step 2 : Put special emphasis on the keywords - "Top 3 Highest salaries in EACH of the departments"
Step 3 : Build a query first to rank the employees, in descending order, on their salary per department
Step 4 : Filter out the records from the above mentioned formulated query by striping off records that are lower than rank 3. 
Step 5 : Ensure to create a subquery since SQL doesnt allow using window functions directly in the where clause directly
		 [Refer - https://www.sqltheater.com/2017/09/28/cant-use-row_number-where/]
Step 6 : Build the query and execute.









