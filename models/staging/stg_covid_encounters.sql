SELECT
  id AS encounter_id,
  patient AS patient_id,
  organization,
  provider,
  payer,
  encounterclass AS class,
  code,
  description,
  base_encounter_cost,
  total_claim_cost,
  payer_coverage,
  reasoncode,
  reasondescription,
  tstart AS encounter_start_time,
  tstop AS encounter_end_time,
  DATEDIFF('day', tstart, tstop) AS length_of_stay
FROM {{ source('covid_raw', 'encounters') }}

