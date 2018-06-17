Question - 
------------------
Given a table salary, such as the one below, that has m=male and f=female values. Swap all f and m values (i.e., change all f values to m and vice versa) with a single update query and no intermediate temp table.
For example:
| id | name | sex | salary |
|----|------|-----|--------|
| 1  | A    | m   | 2500   |
| 2  | B    | f   | 1500   |
| 3  | C    | m   | 5500   |
| 4  | D    | f   | 500    |
After running your query, the above salary table should have the following rows:
| id | name | sex | salary |
|----|------|-----|--------|
| 1  | A    | f   | 2500   |
| 2  | B    | m   | 1500   |
| 3  | C    | f   | 5500   |
| 4  | D    | m   | 500    |

Solution –	
# Write your MySQL query statement below

update salary 
set sex = case when sex = 'm' then 'f' else 'm' end

Explanation - 

Step 1 : Identify what data is present in the table.
Step 2 : Put special emphasis on the keywords - "swap all f and m values"
Step 3 : Build an update sql table query which basically swaps the sex field from 'm' to 'f' and vice versa. Case statement can be used in this query 
		 since using case statement, it returns one value. LEveraging this build the query which gives us the value of f when it encounters m in the sex field of the table
Step 4 : Build the query and execute.









