SELECT
  patient AS patient_id,
  encounter AS encounter_id,
  code,
  description,
  tstart AS condition_start_date,
  tstop AS condition_end_date
FROM {{ source('covid_raw', 'conditions') }}
WHERE
  description LIKE '%COVID%'
  OR code IN ('840539006', '840544004')

