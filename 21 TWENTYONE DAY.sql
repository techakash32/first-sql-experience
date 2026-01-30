-- set oprators

-- 1.UNION =IT COMBINE TWO QUERIES,DATA TYPE DOESN'T MATTER,
select actor_id ,first_name from sakila.actor where actor_id between 1 and 4
UNION
select actor_id ,first_name from sakila.actor where actor_id between 3 and 5;

-- 2.UNION ALL
select actor_id ,first_name from sakila.actor where actor_id between 1 and 4
UNION ALL
select actor_id ,first_name from sakila.actor where actor_id between 3 and 5;
-- NUMBER OF COLUMN SHOULD BE SHAME


