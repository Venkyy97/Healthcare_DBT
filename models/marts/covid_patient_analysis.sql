SELECT
  p.patient_id,
  p.age,
  p.gender,
  p.race,
  p.ethnicity,
  p.is_deceased,
  COUNT(DISTINCT e.encounter_id) AS total_covid_encounters,
  MIN(e.encounter_start_time) AS first_covid_encounter,
  MAX(e.length_of_stay) AS max_length_of_stay,
  AVG(e.length_of_stay) AS avg_length_of_stay,
  COUNT(DISTINCT c.code) AS covid_related_conditions  -- ✅ changed from condition_id to code
FROM {{ ref('stg_patients') }} p
LEFT JOIN {{ ref('stg_covid_encounters') }} e 
  ON p.patient_id = e.patient_id
LEFT JOIN {{ ref('stg_covid_conditions') }} c 
  ON p.patient_id = c.patient_id
GROUP BY 1, 2, 3, 4, 5, 6

