Question - 
------------------

Table: Person
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| PersonId    | int     |
| FirstName   | varchar |
| LastName    | varchar |
+-------------+---------+
PersonId is the primary key column for this table.
Table: Address

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| AddressId   | int     |
| PersonId    | int     |
| City        | varchar |
| State       | varchar |
+-------------+---------+
AddressId is the primary key column for this table.


Write a SQL query for a report that provides the following information for each person in the Person table, regardless if there is an address for each of those people:
FirstName, LastName, City, State

Solution –

/* Write your T-SQL query statement below */
select p.firstname,p.lastname,a.city,a.state --Projection columns
from person p
left outer join  --Because answer is expected for EACH person regardless of their data being present in the other table
address a
on p. personid=a.personid


Explanation - 

Step 1 : Identify what data the two sources bring to the table.
Step 2 : Put special emphasis on the keywords - `For EACH person... regardless if there is an address...`. This means that the final SQL Report should generate information
for all the persons. 
Step 3 : This can be done by using a Left outer join [For more information on joins, kindly visit - https://en.wikipedia.org/wiki/Join_(SQL)] by using the persons on the 'LEFT'
side of the join since we want all of Persons information. 
Step 4 : Identify the field on which you would join the two tables on, which can be done by simply looking at either the metadata available, or by simply querying the two tables - 
select * from person ;
select * from Address ; 
Step 5 : Build the query and execute.









