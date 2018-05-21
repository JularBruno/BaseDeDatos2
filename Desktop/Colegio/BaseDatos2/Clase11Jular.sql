#1

select c.country, count(city) from city cy, country c where c.country_id = cy.country_id 
group by c.country_id order by c.country, c.country_id

#2

select c.country, count(city) from city cy, country c where c.country_id = cy.country_id 
group by c.country_id
having count(city)>10
order by count(city) DESC

#3

select customer.first_name, customer.last_name, address.address, count(rental.rental_id),
sum(payment.amount) from customer inner join address using(address_id)
inner join rental using(customer_id) inner join payment using(rental_id)
group by 1,2,3 order by 5 desc

#4

select film.title from film
where film.film_id not in (select film_id from inventory)

#5

select film.title, inventory_id, rental.rental_id from film
inner join inventory using(film_id) left outer join rental
using(inventory_id) where rental.rental_id is null;

#6

select customer.first_name, customer.last_name, inventory.inventory_id, film.title,
rental.rental_date, rental.return_date from film inner join inventory using (film_id)
inner join rental using (inventory_id) inner join customer using (customer_id)
where rental.return_date is not null order by inventory.store_id, customer.last_name

#7

select concat(c.city, ',', cy.country) as store, concat(m.first_name, ' ', m.last_name) as manager,
sum(amount) as total_sales
from payment as performance_schema 
inner join rental as r on p.rental_id = r.rental_id
inner join inventory as i on r.inventory_id = i.inventory_id
inner join store as s on i.store_id=s.store_id
inner join address as a on s.address_id=a.address_id
inner join city as c on a.city_id=c.city_id
inner join country as cy on c.country_id= cy.country_id
inner join staff as m on s.manager_staff_id= m.staff_id
group by cy.country,c.city,m.first_name,m.last_name
order by cy.country, c.city

#8

select rating, sum(amount)
from film
inner join inventory using (film_id)
inner join rental using (inventory_id)
inner join payment using (rental_id)
group by 1


#9

select actor.actor_id, actor.first_name, actor.last_name, count(actor_id) as film_count
from actor join film_actor using (actor_id)
group by actor_id order by film_count desc limit 1

#10

#10

select category.name, avg(length)
from film join film_category using (film_id)
join category using (category_id)
group by category.name
having avg(length) > (select avg(length) from film)
order by avg(length) desc
