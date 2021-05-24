select distinct dlm.time as time,
dlm.person_id as person_id,
count(distinct dlm.person_id) as user_count,
sum(dlm.sum) as events
from data_load_minutes dlm 
where (dlm.time BETWEEN '2020-03-01 00:00:00' AND '2020-03-31 00:00:00') 
group by dlm.person_id, dlm.time