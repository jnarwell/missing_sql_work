SELECT *
FROM customer;

SELECT *
FROM address;

SELECT *
FROM payment;

SELECT * FROM film_category;

SELECT * FROM film;

SELECT * FROM film_actor;

SELECT * FROM actor;

SELECT * FROM country;

SELECT * FROM city;

SELECT address.district, customer.first_name, customer.last_name
FROM address
JOIN customer ON address.address_id = customer.address_id
WHERE address.district = 'Texas';

--Jennifer Davis, Kim Cruz, Richard Mccrary, Bryan Hardison, Ian Still

SELECT c.first_name, c.last_name, p.amount
FROM payment p
JOIN customer c ON p.customer_id = c.customer_id
WHERE p.amount >= 7;

-- Peter Menard x3, Douglas Graf, etc.

SELECT c.first_name, sum(amount)
FROM payment p
JOIN customer c ON p.customer_id = c.customer_id
WHERE 150 <= (
	SELECT sum(amount)
	FROM payment LIMIT 1
	GROUP BY customer_id
)
GROUP BY c.first_name;

--could not do this one

SELECT concat(c3.first_name, ' ', c3.last_name) AS name_
FROM city c
JOIN address a ON a.city_id = c.city_id
JOIN country c2 ON c2.country_id = c.country_id
JOIN customer c3 ON a.address_id = c3.address_id
WHERE c2.country = 'Argentina';

-- Willie Markham, Jordan Archuleta, etc.

SELECT category_id, count(category_id)
FROM film_category
GROUP BY category_id
ORDER BY count(category_id) DESC;

-- 15, 9, 8, etc.

SELECT count(fa.actor_id), f.title
FROM film_actor fa
JOIN film f ON fa.film_id = f.film_id
JOIN actor a ON a.actor_id = fa.actor_id
GROUP BY f.film_id
ORDER BY count(fa.actor_id) DESC
LIMIT 1;

-- Lambs Cincinatti - 15

SELECT count(f.film_id), concat(a.first_name, ' ', a.last_name) AS name_
FROM film_actor fa
JOIN film f ON fa.film_id = f.film_id
JOIN actor a ON a.actor_id = fa.actor_id
GROUP BY fa.actor_id, name_
ORDER BY count(f.film_id);

-- Emily Dee - 14

SELECT count(c2.city_id), c.country
FROM country c
JOIN city c2 ON c.country_id = c2.country_id
GROUP BY c.country
ORDER BY count(c2.city_id) DESC
LIMIT 1;

-- India - 60

SELECT count(f.film_id) AS count_, concat(a.first_name, ' ', a.last_name) AS name_
FROM film_actor fa
JOIN film f ON fa.film_id = f.film_id
JOIN actor a ON a.actor_id = fa.actor_id
WHERE (
	SELECT count(f.film_id)_
	FROM film_actor fa
	JOIN film f ON fa.film_id = f.film_id
	JOIN actor a ON a.actor_id = fa.actor_id
	GROUP BY fa.actor_id
	ORDER BY count(f.film_id)) > 10
GROUP BY fa.actor_id, name_
ORDER BY count(f.film_id);

-- Cant do