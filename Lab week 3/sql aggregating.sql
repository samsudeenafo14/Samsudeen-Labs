use sakila;

#1.You need to use SQL built-in functions to gain insights relating to the duration of movies:

# Determine the shortest and longest movie durations and name the values as max_duration and min_duration.
#  Express the average movie duration in hours and minutes. 


SELECT 
  MAX(length) AS max_duration,
  MIN(length) AS min_duration
FROM film;

# 1.2. Express the average movie duration in hours and minutes. Don't use decimals.

SELECT
  FLOOR(AVG(length) / 60) AS avg_hours,
  ROUND(AVG(length	) % 60) AS avg_minutes
FROM film;

#2.You need to gain insights related to rental dates:

# Calculate the number of days that the company has been operating.
# Retrieve rental information and add two additional columns to show the month and weekday of the rental. Return 20 rows of results.


SELECT DATEDIFF(MAX(rental_date), MIN(rental_date)) AS number_of_operting_days
FROM rental;

SELECT 
  rental_id, rental_date,
  MONTH(rental_date) AS rental_month,
  DAYNAME(rental_date) AS rental_weekday
FROM rental
LIMIT 20;


# You need to ensure that customers can easily access information about the movie collection. 
SELECT 
  title AS film_title,
  IFNULL(rental_duration, 'Not Available') AS rental_duration
FROM film
ORDER BY film_title ASC;


# Next, you need to analyze the films in the collection to gain some more insights. Using the film table, determine:
# The total number of films that have been released.
# The number of films for each rating.
# The number of films for each rating, sorting the results in descending order of the number of films. 

SELECT COUNT(film_id) AS total_films
FROM film;

SELECT rating, COUNT(film_id) AS number_of_films
FROM film
GROUP BY rating;

SELECT rating, COUNT(film_id) AS number_of_films
FROM film
GROUP BY rating
ORDER BY number_of_films DESC;

# Using the film table, determine:
# The mean film duration for each rating, and sort the results in descending order of the mean duration. Round off the average lengths to two decimal places. 
# Identify which ratings have a mean duration of over two hours in order to help select films for customers who prefer longer movies.

SELECT
  rating,
  ROUND(AVG(length), 2) AS mean_duration
FROM film
GROUP BY rating
ORDER BY mean_duration DESC;

SELECT
  rating,
  ROUND(AVG(length), 2) AS mean_duration
FROM film
GROUP BY rating
HAVING mean_duration > 120
ORDER BY mean_duration ;













