use sakila;
select title, special_features from film where rating = "PG-13";
select distinct length from film;
select title, rental_rate, replacement_cost from film where replacement_cost between 20 and 24;
select film.title , category.name , film.rating from film, film_category, category where film_category.film_id = film.film_id and film_category.category_id= category.category_id and special_features like "%Behind the scenes%";
select first_name, last_name from film, actor, film_actor where actor.actor_id = film_actor.actor_id and film.film_id = film_actor.film_id and film.title = "ZOOLANDER FICTION";
select store_id, address,city, country from store, address,city,country where store.address_id = address.address_id and address.city_id = city.city_id and city.country_id = country.country_id and store.store_id = 1;
select distinct f1.title , f2.title, f1.rating, f2.rating from film f1, film f2 where f1.rating = f2.rating and f1.film_id != f2.film_id;
select distinct title, first_name, last_name , store.store_id from store, staff, film ,inventory where store.store_id = inventory.store_id and inventory.film_id = film.film_id and store.store_id=2 and store.manager_staff_id = staff.staff_id;