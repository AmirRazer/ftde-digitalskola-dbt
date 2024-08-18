{{ config(
    materialized="table",
    schema="mart"
) }}


WITH film_sales AS (
    SELECT
        film_id,
        title,
        SUM(rental_duration) AS total_rental
    FROM {{ ref('film') }}
    GROUP BY film_id, title
)

SELECT
    film_id,
    title,
    total_rental
FROM film_sales
ORDER BY total_rental DESC
LIMIT 1
