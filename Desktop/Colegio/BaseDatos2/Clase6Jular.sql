use sakila;
select last_name from actor c1 where exists (select * from actor c2 where c1.last_name = c2.last_name and c1.actor_id <> c2.actor_id) order by last_name