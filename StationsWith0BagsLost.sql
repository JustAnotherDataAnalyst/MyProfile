Question - 
------------------
Given the following tables , find the number of bags lost per station. Dont miss any station name, get information for the station, 
that has even 0 bags lost/missing.

Schema -

create table station
  (
    system_source_cd varchar(25),
    station_src_id varchar(25),
    country_cd varchar(25),
    station_cd varchar(25),
    active_ind varchar(25)
  )

create table incident_information
  (
    system_source_cd varchar(25),
    incident_source_id varchar(25),
    bag_agent_source_cd bigint, 
    bag_agent_first_name varchar(250),
    bag_agent_last_name varchar(250),
    incident_categ_name varchar(25),
    mshndl_dt date,
    Fault_id int,
    fault_station_source_cd  varchar(25)
  )

create table bag_details
  (
   system_source_cd varchar(25),
   incident_source_id varchar(25),
   bag_detail_source_id varchar(25),
   bag_customer_first_name varchar(250),
   bag_customer_last_name varchar(250),
   bag_tag_number bigint
  )

Solution –

select * from 
(select station_cd, count(*) as “rptbags” from station s
left outer join 
(
select  i.system_source_cd, i.incident_source_id , i.bag_agent_source_cd, i.mshndl_dt, i.fault_station_source_cd as flt
from 
incident_information i 
left outer join 
bag_details b   
ON i.system_source_cd = b.system_source_cd
AND i.incident_source_id = b.incident_source_id
WHERE mshndl_dt BETWEEN '2018-04-28' AND '2018-05-04' --incase you want to analyse in chunks of data
AND FAULT_LOSS_CLASS_ID BETWEEN 20 AND 29 --Incase you want to analyse in chunks of data
and trim(lower(i.src_sys_cd)) = ‘nttracer’ --Incase you want to analyse in chunks of data
)t
on s.src_sys_cd = t.src_sys_cd
and s.stn_src_id = t.flt
group by stn_cd)fnl
where fnl.stn_cd in ('ABQ','AUS','CLE','CMH','COS','DEN','DSM','EGE','ELP','GUC','HDN','IAH','IND','JAC','MCI','MFE','MKE','MSP','MTJ','OKC','OMA','SAT','SDF','STL','TUL' ) --Incase you want to analyse in chunks of data
order by fnl.stn_cd;

--Please note this query was built with certain requirements which have already been added into the query as filters. 
--If you disregard the comments and execute the query , you will get a master result which would be correct too.
--The query gives results for stations having 0 bags lost as well, reason for it has been explained below. 

Explanation - 

Step 1 : Identify what data is present in all the tables.
Step 2 : Put special emphasis on the keywords - "Dont miss any station name..that has even 0 bags lost/missing."
Step 3 : First understand what information does each and every table provide. On closer examination we see, that station provides us a list of all 
         stations, the incident_information provides a list of all incidents, which may or may not be baggage related, and the 3rd table gives us 
        information about the bag details that are lost/missing.
Step 4 : Now that we have understood the importance and usage of all the tables, we start my first joining the incident_information table and bag_details
         table so that we get a list of all incidents and the bags and more importantly the stations the bags were lost from. 
Step 5 : The output of previous query once left outer joined to the station table will give us the required output since we need to know the counts
         against ALL Stations and not select few or the available ones. Because of that very reason, we use a left outer join and not an inner join 
Step 6 : Build the query and execute.









