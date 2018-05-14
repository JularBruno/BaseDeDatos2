select c.country, count(city) from city cy, country c where c.country_id = cy.country_id 
group by c.country_id order by c.country, c.country_id

select c.country, count(city) from city cy, country c where c.country_id = cy.country_id 
group by c.country_id
having count(city)>10
order by count(city) DESC
