#subqueries

select first_name, last_name
from actor
where actor_is= 1;

#using joins

select first_name, last_name
from actor
inner join film_actor
on actor.actor_id=film_actor.actor_id
where film_id=1;

#using subquereies

select first_name, last_name
from actor
where actor_id in (select actor_id
				   from film_actor
                   where film_id=(select film_id
                                       from film
                                       where title= 'hunchback impossible');
                                       
                                       
 #retrieve the rental id for film id 2
 select rental_id
 from rental
 where inventory_id in (select inventory_id from inventory
                        where film_id= (select film_id
                                         from film
                                         where title= 'hunchback impossible'));
                                         
                                         
#Determine the number of copies of the film "Hunchback Impossible" that exist in the inventory system.
SELECT 
  film_id,(SELECT COUNT(inventory_id)
          FROM inventory
          WHERE film_id = film.film_id)
   AS number_of_copies
FROM film
WHERE title = 'Hunchback Impossible';



#List all films whose length is longer than the average length of all the films in the Sakila database.
SELECT  title, length
FROM film
        WHERE length > (SELECT AVG(length)
        from film); 
        
#Use a subquery to display all actors who appear in the film "Alone Trip"


SELECT actor_id, first_name, last_name
FROM actor
WHERE actor_id IN (SELECT actor_id
                   FROM film_actor
				   WHERE film_id = (SELECT film_id
				   FROM film
                   WHERE title = 'Alone Trip'));
                   
                   
# Identify all movies categorized as family films.
SELECT film_id, title, rating
FROM film
WHERE film_id IN ( SELECT film_id
                 FROM film_category
                 WHERE category_id = (
                 SELECT category_id
                 FROM category
                 WHERE name = 'Family'));
  


 

                            
                            