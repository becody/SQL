select u2.id as id,
u2.person_id as person_id,
u2.user_type as type_user,
ia.grade as grade,
ia.tool_id as tool_id
from users u2 
left join impact_analyses ia 
on ia.id = u2.id 
where u2.user_type = 'student'
group by ia.grade, ia.tool_id, u2.id