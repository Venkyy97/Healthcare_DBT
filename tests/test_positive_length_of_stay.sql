SELECT *
FROM {{ ref('stg_covid_encounters') }}
WHERE length_of_stay < 0

