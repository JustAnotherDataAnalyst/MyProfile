Question - 
------------------
There is a table courses with columns: student and class

Please list out all classes which have more than or equal to 5 students.

For example, the table:

+---------+------------+
| student | class      |
+---------+------------+
| A       | Math       |
| B       | English    |
| C       | Math       |
| D       | Biology    |
| E       | Math       |
| F       | Computer   |
| G       | Math       |
| H       | Math       |
| I       | Math       |
+---------+------------+
Should output:

+---------+
| class   |
+---------+
| Math    |
+---------+



Solution –	
# Write your MySQL query statement below

select class from 
courses 
group by class
having count(distinct student) >= 5


Explanation - 

Step 1 : Identify what data is present in the table.
Step 2 : Put special emphasis on the keywords - "have more than or equal to 5 students"
Step 3 : Simply build a query with the aforementioned filter using having clause since we are aggregating the records of classes with 
		 the number of students in each class
Step 4 : Build the query and execute.









