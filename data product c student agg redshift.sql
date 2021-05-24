select distinct dlm.time as time,
tools.id as tool_id,
tools.name as tool_name,
dlm.person_id as person_id,
count(distinct dlm.person_id) as user_count,
pm.user_type as type_user,
tgla.value as grade_level,
sum(dlm.sum) as events
from data_load_minutes dlm 
left join person_memberships pm
on pm.person_id = dlm.person_id
left join tools 
on tools.id = dlm.tool_id
left join tag_grade_level_attachments tgla 
on tgla.person_id = dlm.person_id 
where (dlm.time BETWEEN '2020-03-01 00:00:00' AND '2020-03-31 00:00:00') 
group by dlm.person_id, dlm.time, tools.id, pm.user_type, tools.name, tgla.value   