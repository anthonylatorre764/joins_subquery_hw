-- 1. List all customers who live in Texas (use JOINs)
SELECT first_name, last_name, district
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
GROUP BY first_name, last_name, district
HAVING district = 'Texas';


-- 2. Get all payments above $6.99 with the Customer's Full Name
SELECT first_name, last_name, amount
FROM payment
INNER JOIN customer
ON payment.customer_id = customer.customer_id
GROUP BY first_name, last_name, amount
HAVING amount > 6.99;


-- 3. Show all customers names who have made payments over $175(use subqueries)
SELECT first_name, last_name, customer_id
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    GROUP BY customer_id
    HAVING SUM(amount) > 175
);


-- 4. List all customers that live in Nepal (use the city table)
SELECT first_name, last_name, country
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
INNER JOIN city
ON address.city_id = city.city_id
INNER JOIN country
ON city.country_id = country.country_id
GROUP BY first_name, last_name, country
HAVING country = 'Nepal';


-- 5. Which staff member had the most transactions?
SELECT first_name, last_name, staff.staff_id, COUNT(payment_id)
FROM staff
INNER JOIN payment
ON staff.staff_id = payment.staff_id
GROUP BY first_name, last_name, staff.staff_id;
-- Answer: Jon Stephens


-- 6. How many movies of each rating are there?
SELECT rating, COUNT(film_id)
FROM film
GROUP BY rating;


-- 7.Show all customers who have made a single payment above $6.99 (Use Subqueries)
SELECT first_name, last_name, customer_id
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    GROUP BY customer_id, amount
    HAVING amount > 6.99
);


-- 8. How many free rentals did our stores give away?
SELECT rental_id, payment_id
FROM payment
WHERE payment_id = NULL
GROUP BY rental_id, payment_id;
-- Answer: None
