Question - 
------------------
X city opened a new cinema, many people would like to go to this cinema. The cinema also gives out a poster indicating the movies’ ratings and descriptions.
Please write a SQL query to output movies with an odd numbered ID and a description that is not 'boring'. Order the result by rating.

For example, table cinema:

+---------+-----------+--------------+-----------+
|   id    | movie     |  description |  rating   |
+---------+-----------+--------------+-----------+
|   1     | War       |   great 3D   |   8.9     |
|   2     | Science   |   fiction    |   8.5     |
|   3     | irish     |   boring     |   6.2     |
|   4     | Ice song  |   Fantacy    |   8.6     |
|   5     | House card|   Interesting|   9.1     |
+---------+-----------+--------------+-----------+
For the example above, the output should be:
+---------+-----------+--------------+-----------+
|   id    | movie     |  description |  rating   |
+---------+-----------+--------------+-----------+
|   5     | House card|   Interesting|   9.1     |
|   1     | War       |   great 3D   |   8.9     |
+---------+-----------+--------------+-----------+

Solution –	
# Write your MySQL query statement below

select * from cinema where
description != 'boring' and mod(id,2) = 1
order by rating desc



Explanation - 

Step 1 : Identify what data is present in the table.
Step 2 : Put special emphasis on the keywords - "output movies with odd numbered ID and a description is not boring.. Also order the result by rating"
Step 3 : Simply build a query with the aforementioned filter as the description not equal to Boring, remember to pass the quote signs since boring is a 
		 string literal ans also to find the odd numbered records , it can be done by using the mod fucntion, which is 1 for odd values and 0 for even values
Step 4 : Build the query and execute.









