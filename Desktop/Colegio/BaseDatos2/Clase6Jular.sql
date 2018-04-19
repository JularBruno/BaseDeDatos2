use sakila;
#1
select last_name from actor a1 where exists (select * from actor a2 where a1.last_name = a2.last_name and a1.actor_id <> a2.actor_id) order by last_name
#or
select first_name, last_name from actor a1 where last_name in(select last_name from actor a2 where a1.actor_id <> a2.actor_id) order by last_name
#2
select firs_name, last_name from actor a1 where actor_id not in (select distinct actor_id from film_actor)
#3
select c.customer_id, first_name, last_name from rental r1, customer c where c.customer_id = r1.customer_id and not exists (select * from rental r2 where r1.customer_id = r2.customer_id and r1.rental_id <> r2.rental_id) 
#4
select distinct c.customer_id, first_name, last_name from rental r1, customer c where c.customer_id = r1.customer_id and exists (select * from rental r2 where r1.customer_id = r2.customer_id and r1.rental_id <> r2.rental_id) 
#5
select distinct a.first_name, a.actor_id from actor a, film_actor af, film f where a.actor_id = af.actor_id and af.film_id = f.film_id and (f.title = "CATCH AMISTAD" or f.title = "BETRAYED REAR")
#6
SELECT actor_id, first_name, last_name      
  FROM actor
 WHERE actor_id IN (SELECT actor.actor_id
                      FROM film_actor, actor, film
                     WHERE actor.actor_id = film_actor.actor_id
                       AND film.film_id = film_actor.film_id
                       AND title = 'BETRAYED REAR')
   AND actor_id NOT IN (SELECT actor.actor_id
                          FROM film_actor, actor, film
                         WHERE actor.actor_id = film_actor.actor_id
                           AND film.film_id = film_actor.film_id
                           AND title = 'CATCH AMISTAD')
#7
SELECT actor_id, first_name, last_name      
  FROM actor
 WHERE actor_id IN (SELECT actor.actor_id
                      FROM film_actor, actor, film
                     WHERE actor.actor_id = film_actor.actor_id
                       AND film.film_id = film_actor.film_id
                       AND title = 'BETRAYED REAR')
   AND actor_id IN (SELECT actor.actor_id
                          FROM film_actor, actor, film
                         WHERE actor.actor_id = film_actor.actor_id
                           AND film.film_id = film_actor.film_id
                           AND title = 'CATCH AMISTAD')
#8
SELECT actor_id, first_name, last_name      
  FROM actor a
 WHERE NOT EXISTS (SELECT *
                     FROM film_actor, actor, film
                    WHERE actor.actor_id = film_actor.actor_id
                      AND film.film_id = film_actor.film_id
                      AND title IN ('BETRAYED REAR', 'CATCH AMISTAD')
                      AND actor.actor_id = a.actor_id); 