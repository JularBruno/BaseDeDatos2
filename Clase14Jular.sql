#1
SELECT CONCAT(customer.first_name, ' ', customer.last_name) AS 'Nombre',
		CONCAT(address.address, ', ',city.city) AS 'Direccion'
FROM customer
INNER JOIN address USING (address_id)
INNER JOIN city USING (city_id)
INNER JOIN country USING (country_id)
WHERE country.country LIKE 'Argentina';


#2
SELECT title, `language`.name, CASE rating WHEN 'G' THEN 'General Audiences'
											WHEN 'PG' THEN 'Parental Guidance Suggested'
											WHEN 'PG-13' THEN 'Parents Strongly Cautioned'
											WHEN 'R' THEN 'Restricted'
											WHEN 'NC-17' THEN 'Adults Only'
											ELSE 'No rating'
											END AS rating
FROM film
INNER JOIN `language` USING (language_id);


#3
SELECT title, release_year
FROM film
WHERE film_id IN (SELECT film_id FROM film_actor
					INNER JOIN actor USING (actor_id)
					WHERE TRIM(LOWER(CONCAT(actor.first_name, ' ', actor.last_name)))
					LIKE TRIM(LOWER(REPLACE(REPLACE(' asd, asd', ',', ''), '.', ''))));


#4
SELECT f.title, CONCAT(c.last_name, ', ', c.first_name) AS name,
		CASE return_date WHEN return_date IS NULL THEN 'No'
						ELSE 'Yes'
						END AS 'return'
FROM rental
INNER JOIN customer c USING (customer_id)
INNER JOIN inventory USING (inventory_id)
INNER JOIN film f USING (film_id)
WHERE MONTH (rental_date) IN ('5', '6');

#5

SELECT CONVERT((SELECT CURRENT_TIME), CHAR);

SELECT CAST((SELECT CURRENT_TIME) AS CHAR);

#In many ways CAST and CONVERT are similar. Both are used to convert data from one type to another. 
							 
#6
#The MySQL IFNULL() and COALESCE() functions are kind of similar, both let you return an alternative value if an expression is NULL
							 
SELECT f.title, inventory_id, IFNULL(return_date, 'No devuelta')
FROM rental
INNER JOIN inventory USING (inventory_id)
INNER JOIN film f USING (film_id);
							 

SELECT f.title, inventory_id, COALESCE(return_date, 'No devuelta')
FROM rental
INNER JOIN inventory USING (inventory_id)
INNER JOIN film f USING (film_id);

#Nvl() is the same but for Oracle, and ISNULL() works in SQLServer.
