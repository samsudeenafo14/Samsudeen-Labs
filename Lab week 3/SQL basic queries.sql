use sakila;

#1. 

show tables;

#2. Retrieve all the data from the tables actor, film and customer.

select * 
from actor, film, customer;

#3. Retrieve the following columns from their respective tables:

#3.1 Titles of all films from the film table
#3.2 List of languages used in films, with the column aliased as language from the language table
#3.3 List of first names of all employees from the staff table.

select title 
from film; 

SELECT name AS language
from language;

select first_name
from staff;



#4. Retrieve unique release years.
SELECT DISTINCT release_year
FROM film;



#5. Counting records for database insights:

#5.1 Determine the number of stores that the company has.
#5.2 Determine the number of employees that the company has.
#5.3 Determine how many films are available for rent and how many have been rented.
#5.4 Determine the number of distinct last names of the actors in the database.


select count(store_id) as number_of_stores
from store;

select count(staff_id) as number_of_employees
from staff;

select count(film_id) as films_available
from film;

select count(rental_id) as rented_films
from rental;

SELECT DISTINCT count(last_name)
from actor;

#6. Retrieve the 10 longest films.

SELECT description, length
FROM film
ORDER BY length DESC
LIMIT 10;

#Use filtering techniques in order to:

#7.1 Retrieve all actors with the first name "SCARLETT".

SELECT first_name, last_name
FROM actor
WHERE first_name = 'SCARLETT';
















