Question - 
------------------
Given a Weather table, write a SQL query to find all dates' Ids with higher temperature compared to its previous (yesterday's) dates.

+---------+------------------+------------------+
| Id(INT) | RecordDate(DATE) | Temperature(INT) |
+---------+------------------+------------------+
|       1 |       2015-01-01 |               10 |
|       2 |       2015-01-02 |               25 |
|       3 |       2015-01-03 |               20 |
|       4 |       2015-01-04 |               30 |
+---------+------------------+------------------+
For example, return the following Ids for the above Weather table:

+----+
| Id |
+----+
|  2 |
|  4 |
+----+

Solution –
/* Write your T-SQL query statement below */
select w2.id
from weather w1
inner join weather w2 --self join since we have to compare with the same tables' previous records
on datediff("day",w1.recorddate,w2.recorddate) = 1
where w2.temperature>w1.temperature



Explanation - 

Step 1 : Identify what data is present in the tables.
Step 2 : Put special emphasis on the keywords - "higher temprature compared to its previous (yesterdays dates"
Step 3 : Since we got to compare the data intra table hence we would have to formulate a query with a self join. Note: One cannot use lag incase of dates. 
Step 4 : Filter out the records from the above mentioned formulated query by striping off records have current date temperature higher than previous date
Step 5 : Build the query and execute.









