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
select
  film_id,(select COUNT(inventory_id)
          from inventory
          where film_id = film.film_id)
          as number_of_copies
          from film
          where title = 'Hunchback Impossible';



#List all films whose length is longer than the average length of all the films in the Sakila database.
select  title, length
from film
        where length > (select avg(length)
					   from film); 
        
#Use a subquery to display all actors who appear in the film "Alone Trip"


select actor_id, first_name, last_name
from actor
where actor_id in (select actor_id
                   from film_actor
				   where film_id = (select film_id
				   from film
                   where title = 'Alone Trip'));
                   
                   
# Identify all movies categorized as family films.
select film_id, title, rating
from film
where film_id in ( select film_id
                 from film_category
                 where category_id = (
                 select category_id
                 from category
                 Where name = 'Family'));
                 

#Retrieve the customer_id and the total_amount_spent of those clients who spent more than the average of the total_amount spent by each client. 
  
  
select customer_id, total_amount_spent
from (select customer_id,
	 sum(amount) as total_amount_spent
	 from payment
     group by customer_id ) as customer_payments
     where total_amount_spent > (select avg(total_amount_spent)
     from (select customer_id, SUM(amount) as total_amount_spent
     from payment
	 Group by customer_id) as avg_customer_payments);
     
     create temporary table temp_taspc as
     select (select customer_id,
	 sum(amount) as total_amount_spent
	 from payment
     
     
     
	
     
     
     
     
     
  




                            
                            