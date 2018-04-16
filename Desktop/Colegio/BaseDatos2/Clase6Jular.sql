use sakila;
#1
select last_name from actor c1 where exists (select * from actor c2 where c1.last_name = c2.last_name and c1.actor_id <> c2.actor_id) order by last_name
#2
select firs_name, last_name from actor a1 where not exists (select )
#3
select c.customer_id, first_name, last_name from rental r1, customer c where c.customer_id = r1.customer_id and not exists (select * from rental r2 where r1.customer_id = r2.customer_id and r1.rental_id <> r2.rental_id) 
#4
select distinct c.customer_id, first_name, last_name from rental r1, customer c where c.customer_id = r1.customer_id and exists (select * from rental r2 where r1.customer_id = r2.customer_id and r1.rental_id <> r2.rental_id) 
#5
select distinct a.first_name, a.actor_id from actor a, film_actor af, film f where a.actor_id = af.actor_id and af.film_id = f.film_id and (f.title = "CATCH AMISTAD" or f.title = "BETRAYED REAR")
#6

#7

#8