# 1) Total de peliculas que son comedias:
SELECT COUNT(*) AS total_comedy_films
FROM film f
JOIN film_category fc ON fc.film_id = f.film_id
JOIN category ca ON ca.category_id = fc.category_id
WHERE ca.name = 'Comedy'

# 2) Actor/actriz con mas peliculas filmadas:
SELECT a.actor_id, a.first_name, a.last_name, COUNT(fa.actor_id) AS total_movies
FROM film_actor fa
JOIN actor a ON a.actor_id = fa.actor_id
GROUP BY fa.actor_id
ORDER BY total_movies DESC
LIMIT 1

# 3) Empleado del staff que alquilo mas peliculas de GINA DEGENERES (id 107)
SELECT s.first_name, s.last_name, s.store_id, s.email, COUNT(s.staff_id) AS total_alquiladas
FROM rental r 
JOIN inventory i ON i.inventory_id = r.inventory_id
JOIN film_actor fa ON fa.film_id = i.film_id
JOIN staff s ON s.staff_id = r.staff_id
WHERE fa.actor_id = 107
GROUP BY s.staff_id 
ORDER BY total_alquiladas DESC
LIMIT 1

# 4) Cuantas películas con rating PG-13 del store Nº2 ha alquilado el mejor cliente de todos ??
SELECT COUNT(*) total_alquilado_pg13
FROM film f
JOIN inventory i ON i.film_id = f.film_id
JOIN rental r ON r.inventory_id = i.inventory_id
WHERE f.rating = 'PG-13' AND i.store_id=2 AND r.customer_id = (
	SELECT r.customer_id
	FROM rental r
	GROUP BY r.customer_id
	ORDER BY COUNT(r.customer_id) DESC
	LIMIT 1
)

