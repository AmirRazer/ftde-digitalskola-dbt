{{ config(
    materialized="table",
    schema="mart"
) }}

WITH actor_roles AS (
    SELECT
        actor_id,
        actor_name,
        COUNT(film_id) AS total_roles
    FROM {{ ref('film_actor') }}
    GROUP BY actor_id, actor_name
)

SELECT
    actor_id,
    actor_name,
    total_roles
FROM actor_roles
ORDER BY total_roles DESC
LIMIT 1