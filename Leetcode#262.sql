Question - 
------------------
The Trips table holds all taxi trips. Each trip has a unique Id, while Client_Id and Driver_Id are both foreign keys to the Users_Id at the Users table. Status is an ENUM type of (‘completed’, ‘cancelled_by_driver’, ‘cancelled_by_client’).

+----+-----------+-----------+---------+--------------------+----------+
| Id | Client_Id | Driver_Id | City_Id |        Status      |Request_at|
+----+-----------+-----------+---------+--------------------+----------+
| 1  |     1     |    10     |    1    |     completed      |2013-10-01|
| 2  |     2     |    11     |    1    | cancelled_by_driver|2013-10-01|
| 3  |     3     |    12     |    6    |     completed      |2013-10-01|
| 4  |     4     |    13     |    6    | cancelled_by_client|2013-10-01|
| 5  |     1     |    10     |    1    |     completed      |2013-10-02|
| 6  |     2     |    11     |    6    |     completed      |2013-10-02|
| 7  |     3     |    12     |    6    |     completed      |2013-10-02|
| 8  |     2     |    12     |    12   |     completed      |2013-10-03|
| 9  |     3     |    10     |    12   |     completed      |2013-10-03| 
| 10 |     4     |    13     |    12   | cancelled_by_driver|2013-10-03|
+----+-----------+-----------+---------+--------------------+----------+
The Users table holds all users. Each user has an unique Users_Id, and Role is an ENUM type of (‘client’, ‘driver’, ‘partner’).

+----------+--------+--------+
| Users_Id | Banned |  Role  |
+----------+--------+--------+
|    1     |   No   | client |
|    2     |   Yes  | client |
|    3     |   No   | client |
|    4     |   No   | client |
|    10    |   No   | driver |
|    11    |   No   | driver |
|    12    |   No   | driver |
|    13    |   No   | driver |
+----------+--------+--------+
Write a SQL query to find the cancellation rate of requests made by unbanned users between Oct 1, 2013 and Oct 3, 2013. For the above tables, your SQL query should return the following rows with the cancellation rate being rounded to two decimal places.

+------------+-------------------+
|     Day    | Cancellation Rate |
+------------+-------------------+
| 2013-10-01 |       0.33        |
| 2013-10-02 |       0.00        |
| 2013-10-03 |       0.50        |
+------------+-------------------+

Solution –
select t.request_at as Day,isnull(cast(t2.canc_status/t.T_count as decimal(3,2)),0) as "Cancellation Rate" from 
(select request_at, cast(count(*) as decimal(3,2)) as T_count  from
trips 
inner join users
on 
  trips.client_id=users.users_id 
    inner join users as users2
    on trips.driver_id=users2.users_id
where users.banned not like '%yes%'
and request_at >= '2013-10-01' and request_at <= '2013-10-03'
group by request_at
)t
left outer join  
(
select request_at,cast(count(status) as decimal(3,2)) as canc_status  from
trips 
inner join users
on 
  trips.client_id=users.users_id 
    inner join users as users2
    on trips.driver_id=users2.users_id
where users.banned not like '%yes%'
and request_at >= '2013-10-01' and request_at <= '2013-10-03'
 and status like '%cance%'
  group by request_at
 ) t2
 on t.request_at=t2.request_at;



Explanation - 

Step 1 : Identify what data is present in both the tables.
Step 2 : Put special emphasis on the keywords - "ubanned users between x date and y date.... and round of to 2 decimal places"
Step 3 : Since the user table contains both the driver and the client, we would have to use this table twice in our query , and this can be achieved by using two differently aliased tables. 
Step 4 : To calculate the cancellation rate , we use the forumula, number of rides cancelled per total count of rides for that particular date. 
Step 5 : A left outer join is introduced in the query since we need to include all the records from the tables even if the number of cancelled rides are 0 on that date.
Step 6 : Build a query first to isolate the users that are unbanned and the status of the rides is cancelled, as mentioned in the requirement. 
Step 7 : Build another query to isolate the total number of canecelled rides between the mentiponed dates and by unbanned users. 
Step 8 : Divide the results of step 6 and step 7 by first joining the two results using a left outer joined because of the reason explained in step 5
Step 5 : Build the query and execute.









