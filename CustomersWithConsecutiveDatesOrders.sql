Question - 
------------------
Given a table , find the number of customers who have ordered on consecutive days. 

Schema -

create table Transactions 
(
  Transactionid int, 
  Transactiondate date, 
  Amount int, 
  Userid int
  );


  insert into Transactions values (1,'2018-06-14',100,1);
  insert into Transactions values (2,'2018-06-14',100,1);
  insert into Transactions values (3,'2018-06-14',100,2);
  insert into Transactions values (4,'2018-06-15',100,2);
  insert into Transactions values (5,'2018-06-16',100,2);
  insert into Transactions values (6,'2018-06-17',100,2);
  insert into Transactions values (7,'2018-06-14',100,3);
  insert into Transactions values (8,'2018-06-14',100,3);
  insert into Transactions values (9,'2018-06-14',100,4);
  insert into Transactions values (10,'2018-06-14',100,5);
  insert into Transactions values (11,'2018-06-14',100,6);
  insert into Transactions values (12,'2018-06-14',100,7);
  insert into Transactions values (13,'2018-06-15',100,7);
  insert into Transactions values (14,'2018-06-15',100,7);

Solution –


  select * from Transactions; --just to view the entire dataset once before we embark on the journey towards the solution

  --query 
  
  select count(distinct s2.Userid) as numofusers 
  from 
  (select s.Transactionid,s.Amount,s.Userid,s.Transactiondate, lag(Transactiondate,1,null) over(partition by Userid order by Transactiondate asc) as prev_order
  from Transactions s)s2
  where  datediff(day,s2.prev_order,s2.Transactiondate)=1
  ;





Explanation - 

Step 1 : Identify what data is present in both the table.
Step 2 : Put special emphasis on the keywords - "Number of customers who have ordered on consecutive days"
Step 3 : Build a query first to find the difference between the order dates placed by each and every customer or user 
Step 4 : Instead of using row_number or dense_rank() analytical window function, we make use of another inbuilt and pwerful T-SQL function called lag(). 
		 [Refer - https://docs.microsoft.com/en-us/sql/t-sql/functions/lag-transact-sql?view=sql-server-2017] 
Step 5 : Now that the difference between the orders have been calculated per customer, we need to ensure that we adhere to the requirement of 
		 "Customers having ordered on consecutive days" i.e, the difference between the orders should be 1. Note, to calculate difference between two dates use datediff() function.
		 [Refer - https://docs.microsoft.com/en-us/sql/t-sql/functions/datediff-transact-sql?view=sql-server-2017]
Step 6 : Remember to count distinct number of users, since a user can order consecutive days twice, in different 'order streaks'
Step 7 : Build the query and execute.









